#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${symbol_dollar}{project.name} - Exception</title>
        <%@include file="../includes/statics.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>Infelizmente uma exceção ocorreu</h1>
            ${symbol_dollar}{exception}
        </div>
    </body>
</html>
