<%-- 
    Document   : Register
    Created on : Oct 15, 2024, 10:10:40 AM
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
        <title>Registration</title>

        <!-- CSS for Password Message -->
        <style>
            /* The message box is shown when the user clicks on the password field */
            #message {
                display:none;
                background: #f1f1f1;
                color: #000;
                position: relative;
                padding: 20px;
                margin-top: 10px;
            }

            #message p {
                padding: 10px 35px;
                font-size: 18px;
            }

            /* Add a green text color and a checkmark when the requirements are right */
            .valid {
                color: green;
            }

            .valid:before {
                position: relative;
                left: -35px;
                content: "✔";
            }

            /* Add a red text color and an "x" when the requirements are wrong */
            .invalid {
                color: red;
            }

            .invalid:before {
                position: relative;
                left: -35px;
                content: "✖";
            }
        </style>
        <!-- End of CSS for Password Message -->
        
        <style>
            .image{
                width: 100%;
                position: relative;

            }
            .imageIcon{

                display: flex;
                align-items: center;
                position: absolute;
                height: 100%;
                top: 0;
                right: 0;
                padding-right: 15px;
                padding-top: 30px;
            }
        </style>
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
                            <h2 class="form-title" style="color: #13576C; text-align: center; font-weight: bold">Change Password</h2>  
                            <br/>
                            <div class="row g-3 row justify-content-center">
                                <div class="mb-3">
                                    <label for="name" class="form-label" style="font-weight: bold">Name</label>
                                    <s:textfield name="registrationBean.name" id="name" placeholder="Name" cssClass="form-control" theme="simple" readonly="true" value="%{#session.name}"/>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label" style="font-weight: bold">Email</label>
                                    <s:textfield name="registrationBean.email" type="email" id="email" placeholder="Email" cssClass="form-control" theme="simple" readonly="true" value="%{#session.email}"/>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmpassword" class="form-label" style="font-weight: bold">Old Password</label>
                                    <s:password name="registrationBean.oldpassword" id="oldpassword" placeholder="Old Password" cssClass="form-control" theme="simple" required="required" oncopy="return false" onpaste="return false"/>                                 
<!--                                    <i class="far fa-eye" id="togglePassword" style="cursor: pointer;"></i>                                                                                                                 -->
                                </div>
                                <div class='image'>
                                    <label for="password" class="form-label" style="font-weight: bold">New Password</label>
                                    <span class='imageIcon'><i class="far fa-eye" id="togglePassword" style="cursor: pointer;"></i></span>
                                        <s:password name="registrationBean.password" type="password" id="password" placeholder="Password" cssClass="form-control" theme="simple" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$_])[A-Za-z\d@$_]{8,}$" title="Must contain at least one number, one uppercase, lowercase letter, one special character (@, $ or _) and at least 8 or more characters" required="required" oncopy="return false" onpaste="return false"/>
                                </div>

                                <div class="mb-3">
                                    <label for="confirmpassword" class="form-label" style="font-weight: bold">Confirm Password</label>
                                    <s:password name="registrationBean.confirmpassword" id="confirmpassword" placeholder="Confirm Password" cssClass="form-control" theme="simple" required="required" oncopy="return false" onpaste="return false"/>                                 
<!--                                    <i class="far fa-eye" id="togglePassword" style="cursor: pointer;"></i>                                                                                                                 -->
                                </div>

                                <div class="col-3">
                                    <s:submit action="submitChangePassword" value="Change Password" cssClass="btn btn-primary"/>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
       
    </body>
</html>
