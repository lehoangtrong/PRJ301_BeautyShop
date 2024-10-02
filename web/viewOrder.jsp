<%--
    Document   : viewOrder
    Created on : Jul 9, 2024, 5:20:27 PM
    Author     : LeHoangTrong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp"/>
        <title>View Order</title>

    </head>
    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />
        <div class="main-content">
            <section class="hero-layout1">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-box hero-box-layout1">
                                <div class="hero-box__inner">
                                    <h1 class="hero-box__title text-dark">View Order</h1>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Order Total</th>
                                                <th>Order Status</th>
                                                <th>View Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${requestScope.LIST_ORDER}">
                                                <tr>
                                                    <td>${order.orderID}</td>
                                                    <td>${order.orderDate}</td>
                                                    <td>${order.total}</td>
                                                    <td>${order.status}</td>
                                                    <td>
                                                        <a href="MainController?action=View_Detail&orderID=${order.orderID}">View Detail</a>
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
            </section>
    </body>
</html>
