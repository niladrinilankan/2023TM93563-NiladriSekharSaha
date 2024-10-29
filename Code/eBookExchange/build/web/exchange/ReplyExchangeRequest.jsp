<%-- 
    Document   : ReplyExchangeRequest
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
        <title>Reply Exchange Request</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title>-->
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <!--        <link rel="preconnect" href="https://fonts.googleapis.com">-->
        <!--        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>-->
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

        <!--Favicon-->
        <link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon">


        <% response.addHeader("X-Frame-Options", "SAMEORIGIN");
            response.addHeader("X-XSS-Protection", "1; mode=block");
            response.addHeader("X-Content-Type-Options", "nosniff");
            response.addHeader("X-Download-Options", "noopen");
            response.addHeader("Strict-Transport-Security", "max-age=31536000");
            response.addHeader("Access-Control-Allow-Origin", "*");
        %> 

        <script type="text/javascript" src="<%=request.getContextPath()%>/js/accessibility.min.js"></script>

        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>

        <!-- JQuery Datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <!--        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

        <% response.addHeader("X-Frame-Options", "SAMEORIGIN");
            response.addHeader("X-XSS-Protection", "1; mode=block");
            response.addHeader("X-Content-Type-Options", "nosniff");
            response.addHeader("X-Download-Options", "noopen");
            response.addHeader("Strict-Transport-Security", "max-age=31536000");
            response.addHeader("Access-Control-Allow-Origin", "*");
        %> 

        <script>
//            jQuery.noConflict();
            jQuery(document).ready(function ($) {
                $('#example').DataTable();
            });

//            $(document).ready(function() {
//                $(":reset");
//            });          
        </script>

        <style>
            #example a {
                color: #0097BD;
                font-weight: bold;
            }

            #example a:hover {
                color: #13576c;
                font-weight: bold;
            }
        </style>

        <!--         For Struts2 Jquery -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/struts/js/base/jquery.ui.core.min.js?s2j=3.5.1"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/struts/js/plugins/jquery.subscribe.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/struts/js/struts2/jquery.struts2.min.js?s2j=3.5.1"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/confirm.js"></script>
        <script type="text/javascript">
            $(function () {
                jQuery.struts2_jquery.version = "3.5.1";
                jQuery.scriptPath = "/eLanguageDivision_CMS/struts/";
                jQuery.ajaxSettings.traditional = true;

                jQuery.ajaxSetup({
                    cache: false
                });

                jQuery.struts2_jquery.require("js/struts2/jquery.ui.struts2.min.js");

            });
        </script>
        <link id="jquery_theme_link" rel="stylesheet" href="<%=request.getContextPath()%>/struts/themes/smoothness/jquery-ui.css?s2j=3.5.1" type="text/css"/>
        <!--         End For Struts2 Jquery -->
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

        <script type="text/javascript">
            function replyExchangeRequest(selected_transaction_status) {
                //alert(selected_transaction_status);
                if (selected_transaction_status === 'Modified')
                {
                    document.getElementById("delivery_method").readOnly = false;
                    document.getElementById("exchange_duration").readOnly = false;
                }else{
                    document.getElementById("delivery_method").readOnly =true;
                    document.getElementById("exchange_duration").readOnly = true;
                }
            }
        </script>
    </head>
    <body>
        <!-- Register Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 wow fadeInLeft" data-wow-delay="0.1s">

                    </div>
                    <div class="col-lg-6 wow fadeInRight" data-wow-delay="0.3s">
                        <s:form action="replyExchangeTransactionRequest" theme="simple" method="post" autocomplete="off" enctype="multipart/form-data">
                            <h2 class="form-title" style="color: #13576C; text-align: center; font-weight: bold">Modify Exchange Request</h2>  
                            <br/>
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
                            <br/>
                            <div class="row g-3 row justify-content-center">
                                <div class="mb-3">
                                    <label for="email" class="form-label" style="font-weight: bold">Action <span style="color: red">*</span></label>
                                    <s:select name="exchangeTransactionBean.transaction_status" list="#{'Accepted':'Accepted','Rejected':'Rejected','Modified':'Modified'}" cssClass="form-select" onchange="replyExchangeRequest(this.value)"/>         
                                </div>
                                <div class="mb-3">
                                    <label for="title" class="form-label" style="font-weight: bold">Book Title </label>
                                    <s:textfield name="booklistBean.title" id="title" placeholder="Title" cssClass="form-control" theme="simple" readonly="true"/>
                                </div>
                                <div class="mb-3">
                                    <label for="location" class="form-label" style="font-weight: bold">Location </label>
                                    <s:textfield name="booklistBean.location"  id="location" placeholder="Location" cssClass="form-control" theme="simple"  readonly="true"/>
                                </div>
                                <div class="mb-3">
                                    <label for="owner" class="form-label" style="font-weight: bold">Owner </label>
                                    <s:textfield name="booklistBean.owner"  id="author" placeholder="Owner" cssClass="form-control" theme="simple"  readonly="true"/>
                                </div>
                            </div>
                            <div class="row g-3 row justify-content-center">
                                <div class="mb-3">
                                    <label for="title" class="form-label" style="font-weight: bold">Delivery Method</label>
                                    <s:textfield name="exchangeTransactionBean.delivery_method" id="delivery_method" placeholder="Add Delivery Method" cssClass="form-control" theme="simple" readonly="true"/>
                                </div>
                                <div class="mb-3">
                                    <label for="title" class="form-label" style="font-weight: bold">Exchange Duration</label>
                                    <s:textfield name="exchangeTransactionBean.exchange_duration" id="exchange_duration" placeholder="Add Duration for Exachnage" cssClass="form-control" theme="simple" readonly="true" />
                                </div>
                                <div class="col-3">
                                    <s:submit  value="Reply Exchange Request" cssClass="btn btn-primary"/>
                                </div>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>