<%-- Document : checkout.jsp Created on : Jul 5, 2024, 3:43:00 PM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp" />
        <title>Check Out Page</title>
    </head>

    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />

        <c:set var="cart" value="${sessionScope.CART}" />
        <c:set var="total" value="0" />
        <div class="container mt-4">
            <h2 class="text-dark">Check Out Page</h2>
            <div class="row">
                <div class="col-6">
                    <h3 class="text-dark">Your Cart</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty cart}">
                                <c:forEach var="product" items="${cart.cart.values()}">
                                    <tr>
                                        <td>${product.productName}</td>
                                        <td>$${product.price}</td>
                                        <td>${product.quantity}</td>
                                        <td>$${product.price * product.quantity}</td>
                                    </tr>
                                    <c:set var="total" value="${total + product.price * product.quantity}" />
                                </c:forEach>
                            </c:if>
                            <tr>
                                <td colspan="3">Total</td>
                                <td>$${total}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <h3 class="text-dark">Check Out</h3>
                    <c:if test="${sessionScope.LOGIN_USER ne null}">
                        <form id="myForm" action="MainController" method="post">
                            <div class="form-group">
                                <label for="userID">UserID</label>
                                <input type="text" class="form-control" id="name" name="userID"
                                       value="${sessionScope.LOGIN_USER.userID}" readonly="">
                            </div>
                            <div class="form-group">
                                <label for="mail">Your Mail</label>
                                <input type="Email" class="form-control" id="mail" name="mail" value="${sessionScope.LOGIN_USER.email}" placeholder="Enter mail" required="">
                            </div>
                            <div class="form-group">
                                <label for="payment">Payment</label>
                                <select class="form-control" id="payment" name="payment" required>
                                    <option value="Cash">Cash</option>
                                    <option value="VNPay">VNPay</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Check Out</button>
                            <input  type="hidden" name="action" value="Checkout" />
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER eq null}">
                        <div class="alert alert-danger" role="alert">
                            Please <a href="login.html">login</a> to check out
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>

</html>