<%--
    Document   : message
    Created on : Jul 5, 2024, 8:44:10 PM
    Author     : LeHoangTrong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${not empty requestScope.MESSAGE}">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            swal({
                title: "${requestScope.TITLE}",
                text: "${requestScope.MESSAGE}",
                icon: "${requestScope.ICON}",
                button: "${requestScope.BUTTON}",
                timer: 4000
            });
        });
    </script>
</c:if>
