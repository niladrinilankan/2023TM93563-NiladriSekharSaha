<%-- 
    Document   : Dashboard
    Created on : Sep 13, 2024, 2:05:14 PM
    Author     : Niladri Sekhar Saha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book List</title>
    </head>
    <body>
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
        <h3 style="text-align: center">Own Book List</h3>
        <div class="container-fluid about bg-light py-5">
            <div class="container py-5">
                <div class="row g-5 align-items-center">

                    <div class="col-lg-12 col-xl-12 wow fadeInRight" data-wow-delay="0.3s">
                        <div class="text-center">
                            <a class="forward fancybox.iframe" href="showAddNewBook"><h6 style="text-align: right">Add New Book</h6></a>
                        </div>
                        <br/>
                        <div class="table-area card shadow p-3 mb-5 bg-white rounded table-responsive" style="padding: 10px; color: #383838;" >
                            <div class="table-space">
                                <table id="example" class="display" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Book ID</th>
                                            <th>Title</th>
                                            <th>Author</th>
                                            <th>Genre</th>
                                            <th>Condition</th>
                                            <th>Location</th>
                                            <th>Availability Status</th>
                                            <th>Owner</th>
                                            <th>Action</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="data" items="${bookList}">
                                            <tr> 
                                                <td>${data.book_ser_no}</td> 
                                                <td>${data.title}</td> 
                                                <td>${data.author}</td> 
                                                <td>${data.genre}</td> 
                                                <td>${data.book_condition}</td> 
                                                <td>${data.location}</td>
                                                <td>${data.availability_status}</td> 
                                                <th>${data.owner}</th>
                                                <td>
                                                    <a  class="forward fancybox.iframe"  href="showUpdateBook?booklistBean.book_id=${data.book_id}">Update</a>
                                                </td>
                                                <td>
                                                    <a   href="deleteBookAction?booklistBean.book_id=${data.book_id}">Delete</a>
                                                </td>
                                            </tr> 
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
