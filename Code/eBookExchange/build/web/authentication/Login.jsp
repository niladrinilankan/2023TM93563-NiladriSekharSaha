<%-- 
    Document   : Login
    Created on : Sep 19, 2024, 11:25:12 AM
    Author     : Niladri Sekhar Saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
        <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" >
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/action-message.css"/> 
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_style.css" >       

        <script type="text/javascript">
            function ValidCaptcha() {
                var string1 = sessionStorage.getItem("captchaCode");
                var string2 = (document.getElementById('captcha-input').value);

                if (string1 == string2) {
//                    alert('Captcha Match! Arghya');
                    return true;
                }
                else
                {
                    alert('Captcha Mismatch!');
                    return false;
                }
            }
//            function removeSpaces(string) {
//                return string.split(' ').join('');
//            }
        </script>
        <script type="text/javascript">
            function validateForm() {
                var validation = true;
                validation &= ValidCaptcha();
                if (validation == 1)
                {
                    validation &= closeProgressIndicatorShow();
                }
                if (validation == 1) {

                    return true;
                }
                else
                    return false;
            }
        </script>

        <style>
            canvas {
                max-width: 100%;                
            }
        </style>        
    </head>

    <body style="background-color: #F7FAFB">

        <!-- Login Start -->
        <div class="container-fluid contact bg-light py-5">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 wow fadeInLeft" data-wow-delay="0.1s">

                    </div>
                    <div class="col-lg-6 wow fadeInRight" data-wow-delay="0.3s">
                        <div class="border shadow p-3 mb-5 bg-white rounded" style="background-color: #ffffff; border-radius: 25px;">
                            <s:form action="loginAction" onsubmit="return validateForm(this);" method="post" autocomplete="off" theme="simple" enctype = "multipart/form-data">
                                <div class="container mt-5">
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

                                    <h2 class="form-title" style="color: #13576C; text-align: center; font-weight: bold">Login</h2>  
                                    <br/>
                                    <div class="row justify-content-center">
                                        <div class="col-md-9">
                                            <div class="mb-3">
                                                <label for="name" class="form-label" style="font-weight: bold">Email</label>
                                                <s:textfield name="studentBean.email" id="email" placeholder="Email" cssClass="form-control" theme="simple" required="required"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label" style="font-weight: bold">Password</label>
                                                <s:password name="studentBean.password" id="password" placeholder="Password" cssClass="form-control" required="required"/> 
                                            </div>
                                            <div class="mb-3 d-flex align-items-center">
                                                <canvas id="captcha" width="200" height="80"></canvas>
                                                <button type="button" class="btn btn-secondary" id="refresh-captcha">
                                                    <i class="fa fa-refresh"></i>
                                                </button>
                                            </div>

                                            <div class="mb-3">
                                                <label for="captcha-input" class="form-label" style="font-weight: bold">Enter Captcha</label>
                                                <input type="text" class="form-control" id="captcha-input" required>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                            <br>                                  
                                        </div>
                                    </div>     
                                    <div class="row">
                                        <div class="col">
                                            <div class="d-flex justify-content-start">                 
                                                <a target="blank" style="color: #0097bd; font-weight: bold" onMouseOver="this.style.color='#102147'"onMouseOut="this.style.color='#0097bd'" href="showResetPassword">Forgot Password?</a> 
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="d-flex justify-content-end">                                    
                                                <span style="color: #818181; font-weight: bold">New User? &nbsp;</span><a target="blank" style="color: #0097bd; font-weight: bold" onMouseOver="this.style.color='#102147'"onMouseOut="this.style.color='#0097bd'"  href="showRegisterAction">Register</a>                 
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login End -->      

        <!-- JS -->
        <script src="resources/loginstyle/jquery/jquery.min.js"></script>
        <script src="resources/loginstyle/js/main.js"></script>

        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/lib/wow/wow.min.js"></script>
        <script src="resources/lib/easing/easing.min.js"></script>
        <script src="resources/lib/waypoints/waypoints.min.js"></script>
        <script src="resources/lib/counterup/counterup.min.js"></script>
        <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="resources/lib/lightbox/js/lightbox.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <!-- Template Javascript -->
        <script src="resources/js/main.js"></script>

        <script>
            $(document).ready(function() {
                // Generate captcha on page load
                generateCaptcha();
                // Handle captcha refresh button click
                $("#refresh-captcha").click(function() {
                    generateCaptcha();
                    $("#captcha-input").val("");
                });
                // Handle form submit
                $("#captcha-form").submit(function(event) {
                    event.preventDefault();

                    // Validate captcha
                    var captchaInput = $("#captcha-input").val();
                    var captchaCode = sessionStorage.getItem("captchaCode");
                    if (captchaInput != captchaCode) {
                        alert("Invalid captcha code. Please try again.");
                        generateCaptcha();
                        $("#captcha-input").val("");
                        return;
                    }
                    // Form validation successful, submit form
                    alert("Form submitted successfully.");
                    $("#captcha-form").trigger("reset");
                    generateCaptcha();
                });

                // Define the function generateCaptcha()
                function generateCaptcha() {
                    // Get the canvas element with ID captcha and create an instance of its canvas rendering context
                    var a = $("#captcha")[0],
                            b = a.getContext("2d");
                    // Clear the canvas
                    b.clearRect(0, 0, a.width, a.height);
                    // Define the string of characters that can be included in the captcha
                    var f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",
                            e = "",
                            g = -45,
                            h = 45,
                            i = h - g,
                            j = 20,
                            k = 30,
                            l = k - j;
                    // Generate each character of the captcha
                    for (var m = 0; m < 6; m++) {
                        // Select random letter from the pool to be part of the captcha
                        var n = f.charAt(Math.floor(Math.random() * f.length));
                        e += n;

                        // Set up the text formatting
                        b.font = j + Math.random() * l + "px Arial";
                        b.textAlign = "center";
                        b.textBaseline = "middle";

                        // Set the color of the text
                        b.fillStyle = "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")";

                        // Add the character to the canvas
                        var o = g + Math.random() * i;
                        b.translate(20 + m * 30, a.height / 2);
                        b.rotate(o * Math.PI / 180);
                        b.fillText(n, 0, 0);
                        b.rotate(-1 * o * Math.PI / 180);
                        b.translate(-(20 + m * 30), -1 * a.height / 2);
                    }
                    // Set the captcha code in session storage
                    sessionStorage.setItem("captchaCode", e);
                }
            })
        </script>
    </body>
</html>

