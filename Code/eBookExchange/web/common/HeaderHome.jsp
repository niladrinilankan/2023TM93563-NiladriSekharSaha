<%-- 
    Document   : Header
    Created on : Nov 21, 2016, 12:40:14 PM
    Author     : Niladri Sekhar Saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid topbar px-0 d-none d-lg-block">
            <div class="container px-0">
                <div class="row gx-0 align-items-center" style="height: 45px;">
                    <div class="col-lg-8 text-center text-lg-start mb-lg-0">
                        <div class="d-flex flex-wrap">
                            <!--<a href="#" class="text-muted me-4"><i class="fas fa-map-marker-alt text-primary me-2"></i>Find A Location</a>-->
                            <span class="text-muted me-4"><i class="fas fa-phone-alt text-primary me-2"></i>+91-9474793357</span>
                            <span class="text-muted me-0"><i class="fas fa-envelope text-primary me-2"></i>niladri.saha@live.com</span>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center text-lg-end">
                        <div class="d-flex align-items-center justify-content-end">
                            <a href="#" class="btn btn-primary btn-square rounded-circle nav-fill me-3"><i class="fab fa-facebook-f text-white"></i></a>
                            <a href="https://x.com/NiladriSah32445" target="_blank" class="btn btn-primary btn-square rounded-circle nav-fill me-3"><i class="fab fa-twitter text-white"></i></a>
                            <a href="#" class="btn btn-primary btn-square rounded-circle nav-fill me-3"><i class="fab fa-instagram text-white"></i></a>
                            <a href="#" class="btn btn-primary btn-square rounded-circle nav-fill me-0"><i class="fab fa-linkedin-in text-white"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar & Hero Start -->
        <div class="container-fluid sticky-top px-0">
            <div class="position-absolute bg-dark" style="left: 0; top: 0; width: 100%; height: 100%;">
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-expand-lg navbar-dark bg-white py-3 px-4">
                    <a href="#" class="navbar-brand p-0">
                        <h1 class="text-primary m-0"><i class="fas fa-donate me-3"></i>Book Exchange Platform</h1>
                        <!--                       <img src="img/logo.png" alt="Logo"> -->
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0">
                            <!--<a href="showHomePage" class="nav-item nav-link active">Home</a>-->
                            <a href="showHomePage" class="nav-item nav-link">Home</a>
                            <a href="showAboutPage" class="nav-item nav-link">About</a>
                            <a href="showContactPage" class="nav-item nav-link">Contact</a>
                            <a href="showLoginAction" class="nav-item nav-link">Login</a>
                            <a href="showRegisterAction" target="blank" class="nav-item nav-link">Registration</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar & Hero End -->



       

    </body>
</html>