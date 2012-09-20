#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="path" value="/admin/authority" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${project.name} - Authority: ${symbol_dollar}{not empty data.id ? data.name : 'New'}</title>
        <%@include file="../../../includes/statics.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Authority: ${symbol_dollar}{not empty data.id ? data.name : 'New'}</h1>
            <c:url var="action" value="${symbol_dollar}{path}${symbol_dollar}{not empty data.id ? '/' : ''}${symbol_dollar}{data.id}" />
            <form:form action="${symbol_dollar}{action}" method="POST" modelAttribute="data">
                <c:if test="${symbol_dollar}{not empty data.id}">
                    <input type="hidden" name="_method" value="PUT"/>
                </c:if>
                <div class="control-group">
                    <label for="id"><strong>Authority:</strong></label>
                    <c:choose>
                        <c:when test="${symbol_dollar}{empty data.id}">
                            <form:input path="id" placeholder="Authority" />
                            <div class="control-group error help-inline">
                                <form:errors path="id" cssClass="help-inline" />
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p>${symbol_dollar}{data.id}</p>
                        </c:otherwise>
                    </c:choose>
                    <label for="name"><strong>Name:</strong></label>
                    <form:input path="name" placeholder="Name" />
                    <div class="control-group error help-inline">
                        <form:errors path="name" cssClass="help-inline" />
                    </div>
                </div>
                <div class="control-group">
                    <button type="submit" class="btn btn-success">Send</button>
                    <a href="<c:url value="${symbol_dollar}{path}" />" class="btn">Cancel</a>
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
