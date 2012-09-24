#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="path" value="/admin/user${symbol_dollar}{not empty data.id ? '/' : ''}${symbol_dollar}{data.id}" />
<c:url var="action" value="${symbol_dollar}{path}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${symbol_dollar}{project.name} - User ${symbol_dollar}{not empty data.id ? data.name : 'New'}</title>
        <%@include file="../../../includes/statics.jsp" %>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="<c:url value="/static/js/jquery-ajaxform.js" />" type="text/javascript"></script>
        <script type="text/javascript" >
            $(function (){
                ajaxSubmitSave("form.save");
                ajaxSubmitDelete("form.delete");
                ajaxLoadSelect("authorities", "<c:url value="/admin/authority" />", {
                    selected:[<c:forEach items="${symbol_dollar}{data.authorities}" var="authority" varStatus="status" >
                                "${symbol_dollar}{authority.id}"<c:if test="${symbol_dollar}{not status.last}">, </c:if></c:forEach>
                             ],
                    valueLabel:"id",
                    nameLabel:"name",
                    check:0
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>User: ${symbol_dollar}{not empty data.id ? data.name : 'New'}</h1>
            <form:form action="${symbol_dollar}{action}" method="POST" modelAttribute="data" autocomplete="off" cssClass="save">
                <c:if test="${symbol_dollar}{not empty data.id}">
                    <input type="hidden" name="_method" value="PUT"/>
                </c:if>
                <c:if test="${symbol_dollar}{empty data.id}">
                    <input type="hidden" name="enabled" value="1"/>
                </c:if>
                <div class="control-group">
                    <label for="name"><strong>Name:</strong></label>
                    <form:input path="name" placeholder="Name" cssClass="required" maxlength="90" />
                    <div class="control-group error help-inline">
                        <form:errors path="name" cssClass="help-inline" />
                    </div>
                </div>
                <div class="control-group">
                    <label for="username"><strong>Username:</strong></label>
                    <form:input path="username" placeholder="Username" cssClass="required" maxlength="20" />
                    <div class="control-group error help-inline">
                        <form:errors path="username" cssClass="help-inline" />
                    </div>
                </div>
                <div class="control-group">
                    <label for="password"><strong>Password:</strong></label>
                    <form:password path="password" placeholder="Password" cssClass="required" maxlength="32" />
                    <div class="control-group error help-inline">
                        <form:errors path="password" cssClass="help-inline" />
                    </div>
                </div>
            <c:if test="${symbol_dollar}{not empty data.id}">
                <div class="control-group">
                    <label for="enabled" class="checkbox">
                        <strong>Enabled</strong>
                        <form:checkbox path="enabled" />
                    </label>
                </div>
            </c:if>
                <div class="control-group">
                    <label for="authorities"><strong>Authorities</strong></label>
                    <form:select path="authorities" multiple="multiple">
                        <form:options items="${symbol_dollar}{auths}" itemLabel="name" itemValue="id" />
                    </form:select>
                </div>
                <div class="control-group">
                    <button type="submit" class="btn btn-success">Send</button>
                    <a href="<c:url value="${symbol_dollar}{path}" />" class="btn">Cancel</a>
                </div>
            </form:form>
            <c:if test="${symbol_dollar}{not empty data.id}">
                <form:form action="${symbol_dollar}{action}" method="POST" cssClass="delete">
                    <input type="hidden" name="_method" value="DELETE"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form:form>
            </c:if>
        </div>
    </body>
</html>
