#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="path" value="/admin/authority" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${project.name} - Authority ${symbol_dollar}{data.name}</title>
        <%@include file="../../../includes/statics.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Authority: ${symbol_dollar}{data.name}</h1>
            <strong>Authority:</strong> ${symbol_dollar}{data.id}<br/>
            <strong>Name:</strong> ${symbol_dollar}{data.name}
            <br/><br/>
            <a href="<c:url value="${symbol_dollar}{path}/${symbol_dollar}{data.id}/edit" />" class="btn btn-primary">Edit</a>
            <a href="<c:url value="${symbol_dollar}{path}" />" class="btn">Authorities</a>
        </div>
    </body>
</html>
