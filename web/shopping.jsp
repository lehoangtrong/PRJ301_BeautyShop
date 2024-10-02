<%-- Document : shopping Created on : Jul 3, 2024, 12:31:29 PM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <c:import url="import.jsp" />
        <title>Shopping Page</title>
    </head>

    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />
        <div class="container">
            <h2 class="text-dark mt-4">Shopping Page</h2>
            <!-- Create search form -->
            <div class="row">
                <form action="MainController" method="post">
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" name="searchProduct" value="${param.searchProduct}"
                                   class="form-control text-dark" id="floatingInputGroup1"
                                   placeholder="Search">
                            <label for="floatingInputGroup1">Search product</label>
                            <input type="hidden" name="index" value="1"/>
                        </div>
                    </div>
                    <button style="height: 3rem !important;" type="submit" class="btn btn-primary" name="action"
                            value="SearchProduct">Search</button>
                    <input type="hidden" name="success" value="${pageContext.request.servletPath}"/>
                </form>
            </div>
            <div class="row col-12">
                <div class="d-flex justify-content-center">
                    <c:if test="${requestScope.LIST_PRODUCT_COUNT > 12}"> 
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:url var="page" value="MainController">
                                    <c:param name="action" value="SearchProduct"/>
                                    <c:param name="searchProduct" value="${param.searchProduct}"/>
                                    <c:param name="success" value="${pageContext.request.servletPath}"/>
                                </c:url>
                                <c:if test="${1 != requestScope.CURRENT_PAGE}">
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="${page}&index=${requestScope.CURRENT_PAGE - 1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:set var="startPage" value="${requestScope.CURRENT_PAGE - 2}"/>
                                <c:set var="endPage" value="${requestScope.CURRENT_PAGE + 2}"/>
                                <c:if test="${startPage < 1}">
                                    <c:set var="startPage" value="1"/>
                                    <c:set var="endPage" value="5"/>
                                </c:if>
                                <c:if test="${endPage > requestScope.LIST_PRODUCT_COUNT}">
                                    <c:set var="endPage" value="${requestScope.LIST_PRODUCT_COUNT}"/>
                                    <c:set var="startPage" value="${endPage - 4}"/>
                                </c:if>
                                <c:forEach var="index" begin="${startPage}" end="${endPage}">
                                    <li class="page-item <c:if test="${index == requestScope.CURRENT_PAGE}">active</c:if>">
                                        <a class="page-link" href="${page}&index=${index}">${index}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${requestScope.LIST_PRODUCT_COUNT != requestScope.CURRENT_PAGE}">
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="${page}&index=${requestScope.CURRENT_PAGE + 1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </c:if>
                </div>
            </div>
            <c:if test="${requestScope.LIST_PRODUCT ne null}">
                <div class="container mt-4">
                    <div class="row">
                        <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                            <div class="col-md-3 mt-2">
                                <form action="MainController" method="post">
                                    <div class="card">
                                        <h5 class="card-header">${product.productName}</h5>
                                        <div class="card-body">
                                            <p class="card-text">Price: $${product.price}</p>
                                            <div class="d-flex row align-items-center">
                                                <p style="margin: 0;" class="card-text col-8">Quantity:
                                                    ${product.quantity}</p>
                                                <input type="number" class="form-control col-4" name="quantity"
                                                       value="1" min="1" />
                                            </div>
                                            <button name="action" value="Add"
                                                    style="height: 3rem!important;" class="btn btn-primary mt-2">Add
                                                to cart</button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="productID" value="${product.productID}" />
                                    <input type="hidden" name="productName" value="${product.productName}" />
                                    <input type="hidden" name="price" value="${product.price}" />
                                    <input type="hidden" name="searchProduct" value="${param.searchProduct}"/>
                                    <input type="hidden" name="index" value="${requestScope.CURRENT_PAGE}"/>
                                    <input type="hidden" name="success" value="${pageContext.request.servletPath}"/>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
    </body>

</html>