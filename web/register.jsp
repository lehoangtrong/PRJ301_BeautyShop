<%--
    Document   : register
    Created on : Jul 5, 2024, 9:30:06 PM
    Author     : LeHoangTrong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page</title>
        <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/iofrm-style.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/iofrm-theme19.css">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>

    <body>
        <c:import url="message.jsp" />
        <div class="form-body without-side">
            <div class="website-logo">
                <a href="MainController">
                    <div class="logo">
                        <img class="" src="./assets/images/logo.png" alt="">
                    </div>
                </a>
            </div>
            <div class="row">
                <div class="img-holder">
                    <div class="bg"></div>
                    <div class="info-holder">
                        <img src="assets/images/graphic3.svg" alt="">
                    </div>
                </div>
                <div class="form-holder">
                    <div class="form-content">
                        <div class="form-items">
                            <h3>Register new account</h3>
                            <form action="MainController" method="post">
                                <span class="text-danger">${requestScope.USER_ERROR.userIDError}</span>
                                <input class="form-control" type="text" name="userID" value="${param.userID}" placeholder="UserID" required>
                                <span class="text-danger">${requestScope.USER_ERROR.fullNameError}</span>
                                <input class="form-control" type="text" name="fullName" value="${param.fullName}" placeholder="Full Name" required>
                                <input class="form-control" type="email" name="email" value="${param.email}" placeholder="Email" required>
                                <span class="text-danger">${requestScope.USER_ERROR.passwordError}</span>
                                <input class="form-control" type="password" name="password" value="${param.password}" placeholder="Password" required>
                                <span class="text-danger">${requestScope.USER_ERROR.confirmError}</span>
                                <input class="form-control" type="password" name="confirm" value="${param.confirm}" placeholder="Confirm Password" required>
                                <span class="text-danger">${requestScope.USER_ERROR.getError()}</span>
                                <div class="g-recaptcha" data-sitekey="6LddSwkqAAAAALRi-RgIrt55UiMhk75tr2rQfTqu"></div>
                                <div class="form-button">
                                    <button name="action" value="Create" id="submit" type="submit" class="ibtn">Register</button>
                                </div>
                            </form>
                            <div class="other-links">
                                <div class="text">Or register with</div>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BeautyWebsite/MainController?action=LoginWithGoogle&response_type=code&client_id=597849125326-6m9u4g0reo8mbb8t600rfhmn23vgs1ll.apps.googleusercontent.com&approval_prompt=force">
                                    <i class="fab fa-google"></i>
                                    Google
                                </a>
                            </div>
                            <div class="page-links">
                                <a href="login.html">Login to account</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>
