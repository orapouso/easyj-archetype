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
        <title>User ${symbol_dollar}{not empty data.id ? data.name : 'New'}</title>
        <%@include file="../../../includes/main.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>User: ${symbol_dollar}{not empty data.id ? data.name : 'New'}</h1>
            <c:url var="action" value="/admin/user${symbol_dollar}{not empty data.id ? '/' : ''}${symbol_dollar}{data.id}" />
            <form:form action="${symbol_dollar}{action}" method="POST" modelAttribute="data" autocomplete="off">
                <c:if test="${symbol_dollar}{not empty data.id}">
                    <input type="hidden" name="_method" value="PUT"/>
                </c:if>
                <c:if test="${symbol_dollar}{empty data.id}">
                    <input type="hidden" name="enabled" value="1"/>
                </c:if>
                <div class="control-group">
                    <label for="name"><strong>Name:</strong></label>
                    <form:input path="name" placeholder="Name" />
                    <div class="control-group error help-inline">
                        <form:errors path="name" cssClass="help-inline" />
                    </div>
                    <label for="username"><strong>Username:</strong></label>
                    <form:input path="username" placeholder="Username" />
                    <div class="control-group error help-inline">
                        <form:errors path="username" cssClass="help-inline" />
                    </div>
                    <label for="password"><strong>Password:</strong></label>
                    <form:password path="password" placeholder="Password" />
                    <div class="control-group error help-inline">
                        <form:errors path="password" cssClass="help-inline" />
                    </div>
                    <c:if test="${symbol_dollar}{not empty data.id}">
                        <label for="enabled" class="checkbox">
                            <strong>Enabled</strong>
                            <form:checkbox path="enabled" />
                        </label>
                    </c:if>
                </div>
                <label for="authorities"><strong>Authorities</strong></label>
                <form:select path="authorities" multiple="multiple">
                    <form:options items="${symbol_dollar}{auths}" itemLabel="name" itemValue="id" />
                </form:select>
                <div class="control-group">
                    <button type="submit" class="btn btn-success">Send</button>
                    <a href="<c:url value="/admin/user" />" class="btn">Cancel</a>
                </div>
            </form:form>
            <c:if test="${symbol_dollar}{not empty data.id}">
                <form:form action="${symbol_dollar}{action}" method="POST" onsubmit="return confirm('Are you sure you want to delete THAT?')">
                    <input type="hidden" name="_method" value="DELETE"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form:form>
            </c:if>
        </div>
    </body>
</html>
