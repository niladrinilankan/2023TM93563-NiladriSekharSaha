/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dbconfig.Ibatis;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import master.bean.UserMasterBean;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import register.bean.RegistrationBean;

/**
 *
 * @author Shampa Dey
 */
public class CheckAuthenticationAction extends ActionSupport implements SessionAware {
    
    private Map<String, Object> session;
    private RegistrationBean studentBean = new RegistrationBean();
    List<RegistrationBean> logonInformation = new ArrayList<RegistrationBean>();
    private String email;
    private String password;
    
    public CheckAuthenticationAction() {
    }
    
    @SkipValidation
    public String showLogin() throws Exception {
        ((SessionMap) this.session).invalidate();
        this.session = ActionContext.getContext().getSession();
        return SUCCESS;
    }
    
    
    public String login() {
        try {
            if (session.containsKey("email")) {
                session.remove("email");
                session.remove("name");
                session.remove("id");
            }
            System.out.println("User Name" + studentBean.getEmail());
            setLogonInformation(Ibatis.sqlMap().queryForList("authentication.checkAuthentication", studentBean));
            if (logonInformation.isEmpty()) {
                addActionError("Unable to Login. Check User Id or Password.");
                return ERROR;
            } else {
                //New JSESSIONID
                HttpServletRequest request = ServletActionContext.getRequest();
                if (!request.getSession().isNew()) {
                    ((SessionMap) this.session).invalidate();
                    this.session = ActionContext.getContext().getSession();
                }
                //New JSESSIONID
                
                session.put("email", getLogonInformation().get(0).getEmail());
                session.put("id", getLogonInformation().get(0).getId());
                session.put("name", getLogonInformation().get(0).getName());
                System.out.println("Inside else part");
                return SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Inside exception");
            return ERROR;
        }
    }

    public String logout() {
        if (session.containsKey("email")) {
                session.remove("email");
                session.remove("name");
                session.remove("id");
            }
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("ShowDraftLogin:- " + request.getSession().isNew());
        ((SessionMap) this.session).invalidate();
        this.session = ActionContext.getContext().getSession();
        addActionMessage("You have Successfully Logged Out");
        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<RegistrationBean> getLogonInformation() {
        return logonInformation;
    }

    public void setLogonInformation(List<RegistrationBean> logonInformation) {
        this.logonInformation = logonInformation;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public RegistrationBean getStudentBean() {
        return studentBean;
    }

    public void setStudentBean(RegistrationBean studentBean) {
        this.studentBean = studentBean;
    }
    
    
    
    
}
