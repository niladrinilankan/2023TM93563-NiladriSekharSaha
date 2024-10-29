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

                        </div>
                    </div>
                    <div class="col-lg-4 text-center text-lg-end">
                        <div class="d-flex align-items-center justify-content-end">
                            <i class="fas fa-solid fa-user me-2" style="color: #0097bd"></i><span style="color: #bccddb;">Welcome <s:property  value="%{#session['name']}"/></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->               
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
                            <a href="showAllBooks" target="blank" class="nav-item nav-link">Home</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Books</a>
                                <div class="dropdown-menu m-0">
                                    <a href="showOwnBooks" target="blank" class="dropdown-item">Own Books</a>
                                    <a href="showAllBooks" target="blank" class="dropdown-item">Book Search</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Transactions</a>
                                <div class="dropdown-menu m-0">
                                    <a href="getAllTransactionStatus" target="blank" class="dropdown-item">All Transaction Status</a>
                                    <a href="showPendingTransactionList" target="blank" class="dropdown-item">Pending Exchange Requests</a>
                                </div>
                            </div>
                            <a href="showChangePasswordAction" target="blank" class="nav-item nav-link">Change Password</a>
                            <a href="logoutAction" target="blank" class="nav-item nav-link">Sign Out</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Topbar Start -->
        <div class="container-fluid topbar px-0 d-none d-lg-block">
            <div class="container px-0">
                <div class="row gx-0 align-items-center" style="height: 15px;">

                </div>
            </div>
        </div>
        <!-- Topbar End -->

    </body>
</html>