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
import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import register.bean.RegistrationBean;

/**
 *
 * @author Shampa Dey
 */
public class RegisterAction extends ActionSupport implements SessionAware, Preparable {

    private RegistrationBean registrationBean = new RegistrationBean();
    List<RegistrationBean> registeredUserList = new ArrayList<RegistrationBean>();
    Map<String, Object> session;
    private String subjectTemplate = "Registration in Book Exchange Portal";
    private String bodyTemplate = "Dear {0}, " + "<br>" + "<br>"
            + "OTP for your User Registration in Book Exchange Portal is {2}." + "<br>" + "<br>"
            + "Please do not share it with anyone." + "<br>" + "<br>"
            + "** This is an auto-generated mail from Book Exchange Portal  Management System.**" + "<br>" + "<br>"
            + "Thanks," + "<br>" + "<br>"
            + "{1}," + "<br>"
            + "CDAC,Kolkata";
    private FwdSMS sendSMS = new FwdSMS();
    private Random rand = new Random();

    public RegisterAction() {
    }

    @SkipValidation
    public String showRegister() {
        return SUCCESS;
    }

    public String sendOTP() {
        try {
            System.out.println("Inside Register method");
            int otp = rand.nextInt(900000) + 100000;
            registrationBean.setOtp(Integer.toString(otp));
            System.out.println("OTP is " + otp);
            int mailSendStatus = SendMail("Book Exchange Portal", "shampa.dey@cdac.in", registrationBean.getName(), registrationBean.getEmail(), registrationBean.getOtp());
            if (mailSendStatus == 1) {
                System.out.println("Email OTP sent successfully");
                session.put("name", registrationBean.getName());
                session.put("email", registrationBean.getEmail());
                session.put("password", registrationBean.getPassword());
                session.put("otp", registrationBean.getOtp());
            }
            return SUCCESS;
        } catch (Exception e) {
            System.out.println("Inside Register error");
            e.printStackTrace();
            return ERROR;
        }
    }

    public String verifyOTP() {
        try {
            System.out.println("Inside Verify OTP method");
            System.out.println("OTP Sent " + session.get("otp"));
            System.out.println("OTP Given " + registrationBean.getConfirmotp());

            if (registrationBean.getConfirmotp() == null ? session.get("otp").toString() == null : registrationBean.getConfirmotp().equals(session.get("otp").toString())) {
                RegistrationBean rb = new RegistrationBean();
                rb.setName(session.get("name").toString());
                rb.setEmail(session.get("email").toString());
                rb.setPassword(session.get("password").toString());
                rb.setUpdated_by(1);
                Ibatis.sqlMap().insert("register.addRegistrationDetails", rb);
                addActionMessage("Registration is successful");
            } else {
                addActionError("OTP Mismatch");
            }
            return SUCCESS;
        } catch (Exception e) {
            System.out.println("Inside Verify OTP error");
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
        if (registrationBean.getEmail() != null) {
            try {
                setRegisteredUserList(Ibatis.sqlMap().queryForList("authentication.checkWhetherEmailAlreadyExists", registrationBean));
                if (!registeredUserList.isEmpty()) {
                    addActionError("Provided email is already exists. Kindly try other! ");
                }
            } catch (Exception e) {
                addActionError("Provided email is already exists. Kindly try other! ");
                e.printStackTrace();
            }

        }
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

    public List<RegistrationBean> getRegisteredUserList() {
        return registeredUserList;
    }

    public void setRegisteredUserList(List<RegistrationBean> registeredUserList) {
        this.registeredUserList = registeredUserList;
    }

}
