#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="path" value="/admin/user" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${symbol_dollar}{project.name} - Users</title>
        <%@include file="../../../includes/statics.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Users</h1>
            <a href="<c:url value="${symbol_dollar}{path}/create" />">Add new</a><br><br>
            <table class="table">
                <tr>
                    <th>Name</th>
                    <th colspan="2">Username</th>
                </tr>
                <c:forEach items="${symbol_dollar}{data}" var="entity">
                <tr>
                    <td><a href="<c:url value="${symbol_dollar}{path}/${symbol_dollar}{entity.id}" />">${symbol_dollar}{entity.name}</a></td>
                    <td><a href="<c:url value="${symbol_dollar}{path}/${symbol_dollar}{entity.id}" />">${symbol_dollar}{entity.username}</a></td>
                    <td><a href="<c:url value="${symbol_dollar}{path}/${symbol_dollar}{entity.id}/edit" />">Edit</a></td>
                </tr>
                </c:forEach>
            </table>
            <a href="<c:url value="/" />" class="btn btn-primary">Home</a>
        </div>
    </body>
</html>
