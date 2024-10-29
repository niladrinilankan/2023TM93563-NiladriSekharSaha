/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package register.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import common.FwdSMS;
import common.mail.SendMail;
import dbconfig.Ibatis;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import register.bean.RegistrationBean;

/**
 *
 * @author Shampa Dey
 */
public class ResetAction extends ActionSupport implements SessionAware, Preparable {

    private RegistrationBean registrationBean = new RegistrationBean();
    List<RegistrationBean> logonInformation = new ArrayList<RegistrationBean>();

    Map<String, Object> session;
    private String subjectTemplate = "Reset Password in Book Exchange Portal ";
    private String bodyTemplate = "Dear {0}, " + "<br>" + "<br>"
            + "OTP for your reset password request in Book Exchange Portal is {2}." + "<br>" + "<br>"
            + "Please do not share it with anyone." + "<br>" + "<br>"
            + "** This is an auto-generated mail from Book Exchange Portal  Management System.**" + "<br>" + "<br>"
            + "Thanks," + "<br>" + "<br>"
            + "{1}," + "<br>"
            + "CDAC,Kolkata";
    private FwdSMS sendSMS = new FwdSMS();
    private Random rand = new Random();

    public ResetAction() {
    }

    @SkipValidation
    public String showResetPassword() {
        return SUCCESS;
    }

    public String verifyDetailsAndSendOTP() {
        try {
            setLogonInformation(Ibatis.sqlMap().queryForList("authentication.checkDetailsForPasswordReset", registrationBean));
            if (logonInformation.isEmpty()) {
                addActionError("Invalid Details , kindly check and confirm.");
                return ERROR;
            } else {
                System.out.println("Inside Reset method");
                int otp = rand.nextInt(900000) + 100000;
                registrationBean.setOtp(Integer.toString(otp));
                System.out.println("OTP is " + otp);
                int mailSendStatus = SendMail("Book Exchange Portal", "shampa.dey@cdac.in", registrationBean.getName(), registrationBean.getEmail(), registrationBean.getOtp());
                if (mailSendStatus == 1) {
                    System.out.println("Email OTP sent successfully");
                    session.put("name", registrationBean.getName());
                    session.put("email", registrationBean.getEmail());
                    session.put("otp", registrationBean.getOtp());
                }
                return SUCCESS;
            }
        } catch (Exception e) {
            System.out.println("Inside Register error");
            addActionError("Invalid Details , kindly check and confirm.");
            e.printStackTrace();
            return ERROR;
        }
    }

    public String submitResetPassword() {
        try {
            System.out.println("Inside Verify OTP method");
            System.out.println("OTP Sent " + session.get("otp"));
            System.out.println("OTP Given " + registrationBean.getConfirmotp());

            if (registrationBean.getConfirmotp() == null ? session.get("otp").toString() == null : registrationBean.getConfirmotp().equals(session.get("otp").toString())) {
                RegistrationBean rb = new RegistrationBean();
                rb.setName(session.get("name").toString());
                rb.setEmail(session.get("email").toString());
                rb.setPassword(registrationBean.getPassword());
                Ibatis.sqlMap().update("register.resetPassword", rb);
                addActionMessage("Password is updated successfully");
                 return SUCCESS;
            } else {
                addActionError("OTP Mismatch");
                 return ERROR;
            }
        } catch (Exception e) {
            addActionError("OTP Mismatch");
            e.printStackTrace();
            return ERROR;
        }
    }

    private int SendMail(String senderName, String senderEmail, String receiverName, String receiverEmail, String otp) {
        System.out.println("senderName:- " + senderName);
        System.out.println("senderEmail:- " + senderEmail);
        System.out.println("receiverName:- " + receiverName);
        System.out.println("receiverEmail:- " + receiverEmail);
        System.out.println("otp:- " + otp);
        if (!senderEmail.equals("") || !receiverEmail.equals("")) {
            String subject = MessageFormat.format(subjectTemplate, senderName, new Date());
            String message = MessageFormat.format(bodyTemplate, receiverName, senderName, otp);
            SendMail mail = new SendMail();
            mail.setFromAddress(senderEmail);
            mail.setToAddress(receiverEmail);
            mail.setSubject(subject);
            mail.setMessage(message);
            return mail.sendMail();
        } else {
            return 0;
        }
    }

    @Override
    public void validate() {
        if (registrationBean.getPassword() == null ? registrationBean.getConfirmpassword() != null : !registrationBean.getPassword().equals(registrationBean.getConfirmpassword())) {
            addActionError("Password and Confirm Password Mismatch");
        }
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void prepare() {
    }

    public RegistrationBean getRegistrationBean() {
        return registrationBean;
    }

    public void setRegistrationBean(RegistrationBean registrationBean) {
        this.registrationBean = registrationBean;
    }

    public List<RegistrationBean> getLogonInformation() {
        return logonInformation;
    }

    public void setLogonInformation(List<RegistrationBean> logonInformation) {
        this.logonInformation = logonInformation;
    }

}
