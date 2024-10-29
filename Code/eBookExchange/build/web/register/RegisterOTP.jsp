<%-- 
    Document   : Register2
    Created on : Sep 23, 2024, 11:12:51 AM
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
    </head>
    <body>
        <!-- Register Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 wow fadeInLeft" data-wow-delay="0.1s">
                      
                    </div>
                    <div class="col-lg-6 wow fadeInRight" data-wow-delay="0.3s">
                        <s:form action="" theme="simple" method="post" enctype="multipart/form-data">
                            <s:if test="hasActionMessages()">
                                <div class="welcome">
                                    <s:actionmessage theme="simple" cssStyle="margin-left: 30px"/>
                                </div>
                            </s:if>
                            <s:if test="hasActionErrors()">
                                <div class="errors">
                                    <s:actionerror theme="simple" cssStyle="margin-left: 30px"/>
                                </div>
                            </s:if>
                            <h2 class="form-title" style="color: #13576C; text-align: center; font-weight: bold">Register</h2>  
                            <br/>
                            <div class="row g-3 row justify-content-center">
                                <div class="mb-3">
                                    <label for="otp" class="form-label" style="font-weight: bold">OTP</label>
                                    <s:textfield name="registrationBean.confirmotp" id="confirmotp" placeholder="OTP" cssClass="form-control" theme="simple" required="required"/>
                                </div>

                                <div class="col-3">
                                    <s:submit action="verifyOTP" value="Register" cssClass="btn btn-primary"/>
                                </div>
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
