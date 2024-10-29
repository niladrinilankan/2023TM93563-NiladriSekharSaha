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
                    <div class="col-lg-6 wow fadeInLeft" data-wow-delay="0.1s">
                        <div class="contact-item">
                            <div>
                                <h1 class="display-4 mb-4">Register</h1>
                            </div>
                            <div class="d-flex align-items-center mb-4">
                                <!--<img src=""/>-->

                                <div id="message" style="border-radius: 10px">
                                    <h4>Password must contain the following:</h4>
                                    <ul style="list-style-type:none;">
                                        <li id="letter" class="invalid">One lowercase character</li>
                                        <li id="capital" class="invalid">One uppercase character</li>
                                        <li id="number" class="invalid">One number</li>
                                        <li id="character" class="invalid">One special character (@, $ or _)</li>
                                        <li id="length" class="invalid">Eight characters minimum</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
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
                            <div class="row g-3 row justify-content-center">
                                <div class="mb-3">
                                    <label for="name" class="form-label" style="font-weight: bold">Name</label>
                                    <s:textfield name="registrationBean.name" id="name" placeholder="Name" cssClass="form-control" theme="simple" required="required"/>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label" style="font-weight: bold">Email</label>
                                    <s:textfield name="registrationBean.email" type="email" id="email" placeholder="Email" cssClass="form-control" theme="simple" required="required"/>
                                </div>
                                   
                                <div class='image'>
                                    <label for="password" class="form-label" style="font-weight: bold">Password</label>
                                    <span class='imageIcon'><i class="far fa-eye" id="togglePassword" style="cursor: pointer;"></i></span>
                                        <s:password name="registrationBean.password" type="password" id="password" placeholder="Password" cssClass="form-control" theme="simple" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$_])[A-Za-z\d@$_]{8,}$" title="Must contain at least one number, one uppercase, lowercase letter, one special character (@, $ or _) and at least 8 or more characters" required="required" oncopy="return false" onpaste="return false"/>
                                </div>

                                <div class="mb-3">
                                    <label for="confirmpassword" class="form-label" style="font-weight: bold">Confirm Password</label>
                                    <s:password name="registrationBean.confirmpassword" id="confirmpassword" placeholder="Confirm Password" cssClass="form-control" theme="simple" required="required" oncopy="return false" onpaste="return false"/>                                 
<!--                                    <i class="far fa-eye" id="togglePassword" style="cursor: pointer;"></i>                                                                                                                 -->
                                </div>

                                <div class="col-3">
                                    <s:submit action="changePassword" value="Send OTP" cssClass="btn btn-primary"/>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register End -->

        <!-- Show Password Script -->
        <script>
            function showPassword() {             
                var pswd = document.getElementById("password");
                if (pswd.type === "password") {
                    pswd.type = "text";
                } else {
                    pswd.type = "password";
                }
            }
        </script>
        <!-- End of Show Password Script -->

        <!-- Password Validation Script -->
        <script>
            var myInput = document.getElementById("password");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var character = document.getElementById("character");
            var length = document.getElementById("length");

            // When the user clicks on the password field, show the message box
            myInput.onfocus = function() {
                document.getElementById("message").style.display = "block";
            }

            // When the user clicks outside of the password field, hide the message box
            myInput.onblur = function() {
                document.getElementById("message").style.display = "none";
            }

            // When the user starts to type something inside the password field
            myInput.onkeyup = function() {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate special character
                var characters = /[@$_]/g;
                if (myInput.value.match(characters)) {
                    character.classList.remove("invalid");
                    character.classList.add("valid");
                } else {
                    character.classList.remove("valid");
                    character.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }
        </script>

        <script>
            const togglePassword = document.querySelector('#togglePassword');
                    const password = document.querySelector('#password');
                    togglePassword.addEventListener('click', function(e) {
                        // toggle the type attribute
                        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                                password.setAttribute('type', type);
                        // toggle the eye slash icon
                        this.classList.toggle('fa-eye-slash');
                    });
        </script>
        <!-- End of Password Validation Script -->
    </body>
</html>
