<%-- 
    Document   : Reset Password
    Created on : Oct 23, 2024, 11:12:51 AM
    Author     : Niladri Sekhar Saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <!-- Register Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 wow fadeInLeft" data-wow-delay="0.1s">
                      
                    </div>
                    <div class="col-lg-6 wow fadeInRight" data-wow-delay="0.3s">
                        <s:form action="" theme="simple" method="post" autocomplete="off" enctype="multipart/form-data">
                            <s:if test="hasActionMessages()">
                                <div class="welcome-login">
                                    <s:actionmessage theme="simple"/>
                                </div>
                            </s:if>
                            <s:if test="hasActionErrors()">
                                <div class="error-login">
                                    <s:actionerror theme="simple"/>
                                </div>
                            </s:if>
                            <h2 class="form-title" style="color: #13576C; text-align: center; font-weight: bold">Reset Password</h2>  
                            <br/>
                            <div class="row g-3 row justify-content-center">
                                <div class="mb-3">
                                    <label for="name" class="form-label" style="font-weight: bold">Confirm Name</label>
                                    <s:textfield name="registrationBean.name" id="name" placeholder="Name" cssClass="form-control" theme="simple" required="required"/>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label" style="font-weight: bold">Confirm Email</label>
                                    <s:textfield name="registrationBean.email" id="email" type="email" placeholder="Email" cssClass="form-control" theme="simple" required="required"/>
                                </div>

                                <div class="col-3">
                                    <s:submit action="verifyDetailsAndSendOTP" value="Send OTP" cssClass="btn btn-primary"/>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register End -->
    </body>
</html>
