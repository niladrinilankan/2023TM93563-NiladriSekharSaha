<%-- 
    Document   : Transaction Status
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
        <title>Transaction Status</title>
    </head>
    <body>
        <h3 style="text-align: center">Transaction Status</h3>
        <div class="container-fluid about bg-light py-5">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-12 col-xl-12 wow fadeInRight" data-wow-delay="0.3s">
                        <div class="table-area card shadow p-3 mb-5 bg-white rounded table-responsive" style="padding: 10px; color: #383838;" >
                            <div class="table-space">
                                <table id="example" class="display" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Book ID</th>
                                            <th>Title</th>
                                            <th>Requested By</th>
                                             <th>Requested To</th>
                                            <th>Requested On</th>
                                            <th>Delivery Method</th>
                                            <th>Exchange Duration</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="data" items="${exchangeTransactionList}">
                                            <tr> 
                                                <td>${data.book_ser_no}</td> 
                                                <td>${data.title}</td> 
                                                <td>${data.sender_name}</td> 
                                                <td>${data.receiver_name}</td> 
                                                <td>${data.transaction_date}</td> 
                                                <td>${data.delivery_method}</td> 
                                                <td>${data.exchange_duration}</td>
                                                <td>${data.transaction_status}</td>
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
