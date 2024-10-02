<%-- Document : viewCart Created on : Jul 3, 2024, 7:40:44 PM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp" />
        <title>View cart page</title>
        <style>
            .action button {
                height: 2.5rem;
                width: 5rem;
            }
        </style>
    </head>

    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />

        <c:set var="cart" value="${sessionScope.CART}" />
        <div class="container">
            <h2 class="text-dark mt-4">View Cart Page</h2>
            <c:if test="${not empty cart}">
                <div class="container mt-4">
                    <div class="row">
                        <c:set var="total" value="0" />
                        <c:forEach var="product" items="${cart.cart.values()}">
                            <div class="row mt-4">
                                <div class="card">
                                    <form action="MainController" method="post">
                                        <h4 class="card-header">${product.productName}</h4>
                                        <div
                                            class="card-body d-flex flex-row justify-content-between align-items-center">
                                            <p class="card-text">Price: $${product.price}</p>
                                            <p class="card-text">Quantity: <input type="number" min="1"
                                                                                  class="form-control" name="quantity"
                                                                                  value="${product.quantity}"></input></p>
                                            <p class="card-text"><b>Total: $${product.price *
                                                                              product.quantity}</b></p>
                                            <div class="action">
                                                <button name="action" value="Edit"
                                                        class="btn btn-primary">Edit</button>
                                                <button name="action" value="Remove"
                                                        class="btn btn-danger">Remove</button>
                                            </div>
                                            <input type="hidden" name="productID"
                                                   value="${product.productID}" />
                                            <c:set var="total"
                                                   value="${total + (product.price * product.quantity)}" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="row mt-4">
                            <div class="card">
                                <div
                                    class="card-body d-flex flex-row justify-content-between align-items-center">
                                    <h4 class="card-text">Total: $${total}</h4>
                                    <div class="action">
                                        <form action="MainController" method="POST">
                                            <button name="action" value="checkout_page"
                                                    class="btn btn-success">Checkout</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </body>

</html>