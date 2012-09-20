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
        <title>${project.name} - Acesso Negado</title>
        <%@include file="../includes/statics.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>${symbol_dollar}{project.name} - Acesso Negado</h1>
            <p>O conteúdo que você está tentando acessar é restrito e você não tem permissão de acessá-lo.</p>
            <p>Por favor, entre com outro usuário neste <a href="<c:url value="/login"/>">link</a>.</p>
            <p>Caso tenha alguma dúvida, basta entrar em contato com o suporte.</p>
            <p>Obrigado</p>
        </div>
    </body>
</html>
