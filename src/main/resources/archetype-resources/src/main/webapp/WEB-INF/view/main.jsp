#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${artifactId} - Main</title>
        <%@include file="../includes/main.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Hello World!! You are logged in as <sec:authentication property="principal.username" /> !!</h1>
            <sec:authorize ifAllGranted="ROLE_USER">
                <p>if you can see this, you have <strong>ROLE_USER</strong></p>
            </sec:authorize>
            <sec:authorize ifAllGranted="ROLE_ADMIN">
                <p>You can see this if you have <strong>ROLE_ADMIN</strong></p>
                <a class="btn btn-primary" href="<c:url value="/admin/user" />">Users</a>
                <a class="btn btn-primary" href="<c:url value="/admin/authority" />">Authorities</a>
            </sec:authorize>
        </div>
    </body>
</html>