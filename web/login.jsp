<%--
    Document   : login.jsp
    Created on : Jul 3, 2024, 8:03:52 PM
    Author     : LeHoangTrong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/iofrm-style.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/iofrm-theme19.css">
        <c:import url="import.jsp" />
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
                        <img src="./assets/images/graphic3.svg" alt="">
                    </div>
                </div>
                <div class="form-holder">
                    <div class="form-content">
                        <div class="form-items">
                            <h3>Login to account</h3>
                            <form id="form" action="MainController" method="POST">
                                <input class="form-control" type="text" name="userID" value="${param.userID}" placeholder="UserID" required>
                                <input class="form-control" type="password" name="password" value="${param.password}" placeholder="Password" required>
                                <div class="g-recaptcha" data-sitekey="6LddSwkqAAAAALRi-RgIrt55UiMhk75tr2rQfTqu"></div>
                                <div class="form-button">
                                    <button name="action" value="Login" id="submit" type="submit"
                                            class="ibtn">Login</button>
                                </div>
                            </form>
                            <div class="other-links">
                                <div class="text">Or login with</div>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BeautyWebsite/MainController?action=LoginWithGoogle&response_type=code&client_id=597849125326-6m9u4g0reo8mbb8t600rfhmn23vgs1ll.apps.googleusercontent.com&approval_prompt=force">
                                    <i class="fab fa-google"></i>
                                    Google
                                </a>
                            </div>
                            <div class="page-links">
                                <a href="register.html">Register new account</a>
                            </div>
                            <div class="mt-4">
                                <form action="MainController" method="POST">
                                    <input type="submit" name="action" value="Lastuser" class="btn btn-link"
                                           style="color: #fff; background-color: #007bff; border-color: #007bff;">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="./assets/js/jquery.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/main.js"></script>
        <script src="./assets/js/myCode.js"></script>


    </body>

</html>