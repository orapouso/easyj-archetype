#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User ${symbol_dollar}{data.name}</title>
        <%@include file="../../../includes/main.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>User: ${symbol_dollar}{data.name}</h1>
            <strong>Name:</strong> ${symbol_dollar}{data.name}<br/>
            <strong>Username:</strong> ${symbol_dollar}{data.username}<br/>
            <strong>Enabled?</strong> ${symbol_dollar}{data.enabled ? "Sim" : "Não"}<br/>
            <strong>Authorities:</strong>
            [<c:forEach items="${symbol_dollar}{data.authorities}" var="authority" varStatus="status" >
                ${symbol_dollar}{authority.name}<c:if test="${symbol_dollar}{not status.last}">, </c:if>
            </c:forEach>]
            <br/><br/>
            <a href="<c:url value="/admin/user/${symbol_dollar}{data.id}/edit" />" class="btn btn-primary">Edit</a>
            <a href="<c:url value="/admin/user" />" class="btn">Users</a>
        </div>
    </body>
</html>
