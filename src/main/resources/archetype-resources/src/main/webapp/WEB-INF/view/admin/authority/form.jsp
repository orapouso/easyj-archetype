#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="path" value="/admin/authority${symbol_dollar}{not empty data.id ? '/' : ''}${symbol_dollar}{data.id}" />
<c:url var="action" value="${symbol_dollar}{path}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${symbol_dollar}{project.name} - Authority: ${symbol_dollar}{not empty data.id ? data.name : 'New'}</title>
        <%@include file="../../../includes/statics.jsp" %>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
        <script src="<c:url value="/static/js/jquery-ajaxform.js" />" type="text/javascript"></script>
        <script type="text/javascript" >
            $(function (){
                ajaxSubmitSave("form.save");
                ajaxSubmitDelete("form.delete");
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Authority: ${symbol_dollar}{not empty data.id ? data.name : 'New'}</h1>
            <form:form action="${symbol_dollar}{action}" method="POST" modelAttribute="data" cssClass="save form-horizontal">
                <c:if test="${symbol_dollar}{not empty data.id}">
                    <input type="hidden" name="_method" value="PUT"/>
                </c:if>
                <div class="control-group">
                    <label for="id" class="control-label"><strong>Authority:</strong></label>
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-star" title="required"></i></span>
                            <c:if test="${symbol_dollar}{not empty data.id}">
                                <c:set var="disabled" value="true" />
                            </c:if>
                            <form:input path="id" placeholder="Authority" cssClass="required" maxlength="10" disabled="${symbol_dollar}{disabled}" />
                        </div>
                        <div class="help-inline"><form:errors path="id" /></div>
                    </div>
                </div>
                <div class="control-group">
                    <label for="name" class="control-label"><strong>Name:</strong></label>
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-star" title="required"></i></span>
                            <form:input path="name" placeholder="Name" cssClass="required" maxlength="45" />
                        </div>
                        <div class="help-inline"><form:errors path="name" /></div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="offset2">
                        <button type="submit" class="btn btn-success">Send</button>
                        <a href="<c:url value="${symbol_dollar}{path}" />" class="btn">Cancel</a>
                    </div>
                </div>
            </form:form>
        <c:if test="${symbol_dollar}{not empty data.id}">
            <form:form action="${symbol_dollar}{action}" method="POST" cssClass="delete">
                <div class="control-group">
                    <div class="offset2">
                        <input type="hidden" name="_method" value="DELETE"/>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </form:form>
        </c:if>
        </div>
    </body>
</html>
