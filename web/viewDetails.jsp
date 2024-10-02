<%--
    Document   : viewDetails
    Created on : Jul 9, 2024, 5:30:35 PM
    Author     : LeHoangTrong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp"/>
        <title>View Details</title>
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
                                    <h1 class="hero-box__title text-dark">View Details</h1>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="total" value="0"/>
                                            <c:forEach var="orderDetail" items="${requestScope.LIST_PRODUCT}">
                                                <tr>
                                                    <td>${orderDetail.productID}</td>
                                                    <td>${orderDetail.price}</td>
                                                    <td>${orderDetail.quantity}</td>
                                                    <td>${orderDetail.price * orderDetail.quantity}</td>
                                                    <c:set var="total" value="${total + orderDetail.price * orderDetail.quantity}"/>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="3" class="text-right">Total</td>
                                                <td>${total}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
