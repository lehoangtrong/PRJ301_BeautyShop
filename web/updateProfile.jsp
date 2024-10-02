<%-- Document : updateProfile.jsp Created on : Jul 9, 2024, 3:30:58 PM Author : LeHoangTrong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp" />
        <title>Update Profile</title>
    </head>

    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />
        <c:if test="${sessionScope.LOGIN_USER eq null}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <div class="main-content">
            <section class="hero-layout1">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-box hero-box-layout1">
                                <div class="hero-box__inner">
                                    <h1 class="hero-box__title text-dark">Update Profile</h1>
                                    <form action="MainController" method="post">
                                        <div class="form-group row">
                                            <label for="userID" class="col-sm-2 col-form-label">UserID</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="userID" readonly
                                                       class="form-control-plaintext" id="userID"
                                                       value="${sessionScope.LOGIN_USER.userID}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Old
                                                password</label>
                                            <div class="col-sm-10">
                                                <input type="password" name="oldPassword" class="form-control"
                                                       id="inputPassword" value="${param.oldPassword}" placeholder="Old Password">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">New
                                                password</label>
                                            <div class="col-sm-10">
                                                <input type="password" name="password" class="form-control"
                                                       id="inputPassword" value="${param.password}" placeholder="New Password">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label">Confirm
                                                password</label>
                                            <div class="col-sm-10">
                                                <input type="password" name="confirm" class="form-control"
                                                       id="inputPassword" value="${param.confirm}" placeholder="Confirm password">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="fullName" class="col-sm-2 col-form-label">Full
                                                Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="fullName" id="fullName"
                                                       value="${sessionScope.LOGIN_USER.fullName}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputEmail"
                                                   class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" name="email" id="inputEmail"
                                                       value="${sessionScope.LOGIN_USER.email}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary" name="action"
                                                        value="UpdateProfile">Update</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>

</html>