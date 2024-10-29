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
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-lg-12 col-xl-12 wow fadeInRight" data-wow-delay="0.3s">
                    <s:form action="searchBooks" theme="simple" method="post" autocomplete="off" enctype="multipart/form-data">
                        <h2 class="form-title" style="color: #13576C; text-align: center; font-weight: bold">Search Books</h2>  
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
                        <div class="form-area card shadow p-3 mb-5 bg-white rounded" style="padding: 10px; color: #383838;">
                            <p></p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-field">
                                        <label for="name" class="form-label" style="font-weight: bold">Title </label>
                                        <s:textfield name="booklistBean.title" id="title" placeholder="Title" cssClass="form-control" theme="simple"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-field">
                                        <label for="email" class="form-label" style="font-weight: bold">Author </label>
                                        <s:textfield name="booklistBean.author"  id="author" placeholder="Author" cssClass="form-control" theme="simple"/>
                                    </div>
                                </div>
                            </div>
                            <p></p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-field">
                                        <label for="email" class="form-label" style="font-weight: bold">Condition </label>
                                        <s:textfield name="booklistBean.book_condition"  id="author" placeholder="Condition" cssClass="form-control" theme="simple"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-field">
                                        <label for="email" class="form-label" style="font-weight: bold">Location </label>
                                        <s:textfield name="booklistBean.location"  id="location" placeholder="Location" cssClass="form-control" theme="simple"/>
                                    </div>
                                </div>
                            </div>
                            <p></p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-field">
                                        <label for="email" class="form-label" style="font-weight: bold">Genre </label>
                                        <s:textfield name="booklistBean.genre"  id="author" placeholder="Genre" cssClass="form-control" theme="simple"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-field">
                                        <label for="email" class="form-label" style="font-weight: bold">Availability Status </label>
                                        <s:select name="booklistBean.availability_status" list="#{'available':'Available','Not Available':'Not Available'}" cssClass="form-select"/>         
                                    </div>
                                </div>
                            </div>
                            <p></p>
                            <div class="row">
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                    <s:submit name="Reset" cssClass="btn btn-primary"  action="showAllBooks" value="Reset"/>
                                </div>
                            </div>
                        </div>
                    </s:form>
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
                                                <c:choose>
                                                    <c:when test="${data.pending_request == 0}">
                                                        <a  class="forward fancybox.iframe"  href="showPlaceExchangeTransactionRequest?booklistBean.book_id=${data.book_id}">Request for Exchange</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a  href="#" style="color: green">Exchange Request Placed</a>
                                                    </c:otherwise>
                                                </c:choose>

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
