#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${symbol_dollar}{project.name} - Authorities</title>
        <%@include file="../../../includes/main.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Authorities</h1>
            <a href="<c:url value="/admin/authority/create" />">Add new</a><br><br>
            <table class="table">
                <tr>
                    <th>Name</th>
                    <th colspan="2">Authority</th>
                </tr>
                <c:forEach items="${symbol_dollar}{data}" var="authority">
                <tr>
                    <td><a href="<c:url value="/admin/authority/${symbol_dollar}{authority.id}" />">${symbol_dollar}{authority.name}</a></td>
                    <td>${symbol_dollar}{authority.id}</td>
                    <td><a href="<c:url value="/admin/authority/${symbol_dollar}{authority.id}/edit" />">Edit</a></td>
                </tr>
                </c:forEach>
            </table>
            <a href="<c:url value="/" />" class="btn btn-primary">Home</a>
        </div>
    </body>
</html>
