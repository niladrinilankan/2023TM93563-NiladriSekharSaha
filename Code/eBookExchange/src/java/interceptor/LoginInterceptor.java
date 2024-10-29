/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;
import org.apache.struts2.StrutsStatics;

/**
 *
 * @author CDAC-01
 */
public class LoginInterceptor extends ActionSupport implements Interceptor, StrutsStatics {

    private static final long serialVersionUID = 1L;
    private static final String USER_HANDLE = "user_name";
    private static final String LOGIN_ATTEMPT = "loginAttempt";


    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    @Override
    public void init() {
        // TODO Auto-generated method stub
    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        System.out.println("Intercepter Working");
        Map<String, Object> sessionAttributes = invocation.getInvocationContext().getSession();
        if (sessionAttributes == null || sessionAttributes.get("email") == null || sessionAttributes.get("email").toString().isEmpty()) {
            addActionError("Session Expired");
            System.out.println("Login Intercepter If");
            return "SessionExpired";
        } else {
            if (!((String) sessionAttributes.get("email")).equals(null)) {
                return invocation.invoke();
            } else {
                addActionError("Session Expired");
                System.out.println("Login Intercepter Else");
                return "SessionExpired";
            }
        }
    }

    
}
