<%-- Document : admin Created on : Jul 3, 2024, 9:41:33 PM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp" />
        <style>
            .form-group {
                margin-bottom: 1rem;
            }

            button {
                width: 100% !important;
                height: 3rem !important;
            }

            input {
                width: 100% !important;
                height: 3rem !important;
                border: none;
                background-color: transparent !important;
            }

            .action a {
                height: 3rem;
                width: 25% !important;

            }
        </style>
        <title>Admin page</title>
    </head>

    <body>
        <c:import url="header.jsp" />
        <c:if test="${sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:import url="message.jsp" />

        <div class="container mt-4">
            <div class="row">
                <div class="col-6">
                    <h3 class="text-dark">User Management</h3>
                    <form action="MainController" method="post">
                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" name="search" value="${param.search}"
                                       class="form-control text-dark" id="floatingInputGroup1"
                                       placeholder="Search">
                                <label for="floatingInputGroup1">Search user</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="action"
                                value="Search">Search</button>
                    </form>
                </div>
                <div class="col-6">
                    <h3 class="text-dark">Shop Management</h3>
                    <form action="MainController" method="post">
                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" name="searchProduct" value="${param.searchProduct}"
                                       class="form-control text-dark" id="floatingInputGroup2"
                                       placeholder="Search">
                                <label for="floatingInputGroup2">Search item</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="action"
                                value="SearchProduct">Search</button>
                        <input type="hidden" name="success" value="${pageContext.request.servletPath}" />
                        <input type="hidden" name="index" value="all"/>
                    </form>
                </div>
            </div>
            <c:if test="${not empty requestScope.LIST_USER}">
                <div class="row mt-4">
                    <div class="col-12">
                        <table class="table table-striped caption-bottom">
                            <h4>List of users</h4>
                            <thead>
                                <tr class="text-center">
                                    <th>No</th>
                                    <th>Username</th>
                                    <th>Fullname</th>
                                    <th>Role</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" varStatus="loop" items="${requestScope.LIST_USER}">
                                <form action="MainController" method="POST">
                                    <tr class="text-center">
                                        <td>${loop.count}</td>
                                        <td><input class="input" name="userID" type="text"
                                                   value="${user.userID}" readonly></input></td>
                                        <td><input class="input" name="fullName" type="text"
                                                   value="${user.fullName}" required></input></td>
                                        <td><input class="input" name="roleID" type="text"
                                                   value="${user.roleID}" required></input></td>
                                        <td><input class="input" name="email" type="text"
                                                   value="${user.email}" required></input></td>
                                        <td><input class="input" name="status" type="text"
                                                   value="${user.status}" required></input></td>
                                        <td class="text-center">
                                            <div class="d-flex action">
                                                <button type="submit" class="btn btn-primary" name="action"
                                                        value="Update">Update</button>
                                                <input type="hidden" name="search"
                                                       value="${param.search}" />
                                                <a href="MainController?action=Delete&userID=${user.userID}&search=${param.search}"
                                                   class="btn btn-danger">Delete</a>
                                            </div>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <div class="row mt-4">
                    <div class="col-12">
                        <table class="table table-striped">
                            <h4>List of items</h4>
                            <thead>
                                <tr class="text-center">
                                    <th>No</th>
                                    <th>Item ID</th>
                                    <th>Item Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="loop" items="${requestScope.LIST_PRODUCT}">
                                <form action="MainController" method="POST">
                                    <tr class="text-center">
                                        <td>${loop.count}</td>
                                        <td><input class="input" name="productID" type="text"
                                                   value="${product.productID}" readonly></input></td>
                                        <td><input class="input" name="productName" type="text"
                                                   value="${product.productName}" required></input></td>
                                        <td><input class="input" name="price" type="text"
                                                   value="${product.price}" required></input></td>
                                        <td><input class="input" name="quantity" type="text"
                                                   value="${product.quantity}" required></input></td>
                                        <td class="text-center">
                                            <div class="d-flex action">
                                                <button type="submit" class="btn btn-primary" name="action"
                                                        value="UpdateProduct">Update</button>
                                                <input type="hidden" name="searchProduct"
                                                       value="${param.searchProduct}" />
                                                <input type="hidden" name="success"
                                                       value="${pageContext.request.servletPath}" />
                                            </div>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>
    </body>

</html>