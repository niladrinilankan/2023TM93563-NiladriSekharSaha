/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.StrutsStatics;

/**
 *
 * @author Manas Chakraborty
 */
public class PostOnlyInterceptor implements Interceptor {

    private static final long serialVersionUID = 1L;

    @Override
    public void destroy() {
    }

    @Override
    public void init() {
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        ActionContext context = (ActionContext) invocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) context.get(StrutsStatics.HTTP_REQUEST);
        System.out.println(request.getMethod() + " Method");
        if (!request.getMethod().equalsIgnoreCase("POST")) {
            return "SessionExpired";
        }
        return invocation.invoke();
    }
}
