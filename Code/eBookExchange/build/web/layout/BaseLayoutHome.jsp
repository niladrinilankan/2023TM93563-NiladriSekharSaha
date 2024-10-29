<%-- 
    Document   : About
    Created on : Oct 15, 2024, 1:07:04 PM
    Author     : Niladri Sekhar Saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
    <head>
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

        <!-- Datetime Picker -->
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

        <!-- Add fancyBox main JS and CSS files -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />

        <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery('.forward').fancybox(
                        {
                            autoDimensions: true,
                            autoSize: false,
                            width: 800,
                            height: 800,
                            afterClose: function () {
                                parent.location.reload(true);
                            }
                        }
                );
                jQuery('.back').fancybox(
                        {
                            autoDimensions: false,
                            autoSize: true,
                            minWidth: 540,
                            minHeight: 240

                        }
                );
            });
        </script>
        <!-- End fancyBox main JS and CSS files -->

    </head>
    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="body"/>
        <!-- Copyright Start -->
        <div class="container-fluid copyright py-4">
            <div class="container">
                <tiles:insertAttribute name="copyright"/>
            </div>
        </div>
        <!-- Copyright End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary btn-lg-square back-to-top"><i class="fa fa-arrow-up"></i></a>   


        <!-- JavaScript Libraries -->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/lib/wow/wow.min.js"></script>
        <script src="resources/lib/easing/easing.min.js"></script>
        <script src="resources/lib/waypoints/waypoints.min.js"></script>
        <script src="resources/lib/counterup/counterup.min.js"></script>
        <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="resources/lib/lightbox/js/lightbox.min.js"></script>


        <!-- Template Javascript -->
        <script src="resources/js/main.js"></script>

    </body>
</html>
