/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

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
public class ChangePasswordAction extends ActionSupport implements SessionAware, Preparable {

    private RegistrationBean registrationBean = new RegistrationBean();
    List<RegistrationBean> logonInformation = new ArrayList<RegistrationBean>();

    Map<String, Object> session;

    public ChangePasswordAction() {
    }

    @SkipValidation
    public String showChangePassword() {
        return SUCCESS;
    }

    public String submitChangePassword() {
        try {
            Ibatis.sqlMap().update("register.resetPassword",registrationBean);
            addActionMessage("Password updated successfully");
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to change password!");
            return ERROR;
        }
    }

    @Override
    public void validate() {
        if (registrationBean.getOldpassword() != null) {
            try {
                registrationBean.setId(Integer.parseInt(session.get("id").toString()));
                int passwordCount = Integer.parseInt(Ibatis.sqlMap().queryForObject("authentication.validateOldPassword", registrationBean).toString());
                if (passwordCount == 0) {
                    addActionError("Incorrect Old Password!");
                }
            } catch (Exception e) {
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

    public List<RegistrationBean> getLogonInformation() {
        return logonInformation;
    }

    public void setLogonInformation(List<RegistrationBean> logonInformation) {
        this.logonInformation = logonInformation;
    }

}
