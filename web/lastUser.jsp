<%--
    Document   : lastUser
    Created on : Jul 16, 2024, 10:52:24 AM
    Author     : LeHoangTrong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="import.jsp" />

        <title>Last User Page</title>
    </head>
    <body>
        <c:import url="header.jsp" />
        <c:import url="message.jsp" />
        <c:if test="${requestScope.USER ne null}">
            userID: ${requestScope.USER.userID} </br>
            fullName: ${requestScope.USER.fullName} </br>
            roleID: ${requestScope.USER.roleID} </br>

        </c:if>
    </body>
</html>
