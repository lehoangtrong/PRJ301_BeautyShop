<%-- Document : header.jsp Created on : Jun 25, 2024, 10:36:54 AM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header class="header header-layout1">
    <nav class="navbar navbar-expand-lg sticky-navbar">
        <div class="container-fluid">
            <a style="height: 100%;" class="navbar-brand" href="MainController">
                <img style="width: 100%; height: 100%;" src="./assets/images/logo.png" class="logo" alt="logo">
            </a>
            <button class="navbar-toggler" type="button">
                <span class="menu-lines"><span></span></span>
            </button>
            <div class="collapse navbar-collapse" id="mainNavigation">
                <ul class="navbar-nav">
                    <li class="nav__item">
                        <a href="MainController" class="nav__item-link <c:if test="${pageContext.request.servletPath eq '/home.jsp'}">active</c:if>">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="MainController?action=Shopping_Page" class="nav__item-link
                            <c:if test="${pageContext.request.servletPath eq '/shopping.jsp'}">
                                active
                            </c:if>">Shopping Page</a>
                    </li>
                    <li class="nav__item">
                        <a href="MainController?action=viewCart" class="nav__item-link <c:if test="${pageContext.request.servletPath eq '/viewCart.jsp'}">active</c:if>">
                                View Cart</a>
                        </li>
                    <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                        <li class="nav__item">
                            <a href="admin.jsp" class="nav__item-link <c:if test="${pageContext.request.servletPath eq '/admin.jsp'}">active</c:if>">Admin Page</a>
                            </li>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER ne null}">
                        <li class="nav__item">
                            <a href="MainController?action=viewOrder" class="nav__item-link <c:if test="${pageContext.request.servletPath eq '/viewOrder.jsp'}">active</c:if>">View Order</a>
                            </li>
                            <li class="nav__item">
                                <a href="updateProfile.jsp" class="nav__item-link <c:if test="${pageContext.request.servletPath eq '/updateProfile.jsp'}">active</c:if>">Update Profile</a>
                            </li>
                    </c:if>
                </ul>
                <button class="close-mobile-menu d-block d-lg-none"><i class="fas fa-times"></i></button>
            </div>
            <div class="contact__number d-none d-xl-flex align-items-center">
                <i class="fas fa-phone"></i>
                <a href="tel:84565137667">84 565 137 67</a>
            </div>

            <ul class="navbar-actions d-none d-xl-flex align-items-center list-unstyled mb-0">
                <c:if test="${sessionScope.LOGIN_USER.roleID ne 'AD'}">
                    <c:set var="cart" value="${sessionScope.CART}" />
                    <li>
                        <a href="MainController?action=viewCart" class="action__btn action__btn-cart">
                            <i class="fas fa-shopping-cart"></i><span class="cart__counter">
                                <c:if test="${not empty cart}">
                                    ${cart.cart.size()}
                                </c:if>
                            </span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER.roleID ne null}">
                    <li>
                        <a href="MainController?action=Logout" class="action__btn action__btn-login">
                            <i class="fas fa-sign-out-alt">
                            </i>
                            <h4>Welcome, ${sessionScope.LOGIN_USER.fullName}</h4>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER.roleID eq null}">
                    <li>
                        <a href="login.html" class="btn btn__primary">
                            <span>Login / Register</span>
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>