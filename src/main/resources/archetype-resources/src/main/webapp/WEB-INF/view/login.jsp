#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${project.name} - Login</title>
        <%@include file="../includes/statics.jsp" %>
    </head>
    <body>
        <div class="container">
            <h1>${artifactId} - Login</h1>
            <c:if test="${symbol_dollar}{not empty param.error or not empty param.timeout}">
                <br/>
                <div>
                    <c:choose>
                        <c:when test="${symbol_dollar}{not empty param.error}">
                            <p class="btn btn-danger">Usuário não autorizado. Username ou senha inválidos. Tente novamente.</p>
                        </c:when>
                        <c:when test="${symbol_dollar}{not empty param.timeout}">
                            <p class="btn btn-warning">Infelizmente sua sessão expirou ou você não se logou anteriormente. Por favor logue-se novamente.</p>
                        </c:when>
                    </c:choose>
                </div>
                <br/>
            </c:if>
            <form name="login" action="<c:url value="/authenticate" />" method="post">
                <label for="<%= UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_USERNAME_KEY%>">Username</label>
                <input autofocus type="text" placeholder="Username" name="<%= UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_USERNAME_KEY%>" value="<c:if test="${symbol_dollar}{not empty param.login_error}"><%= session.getAttribute(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_USERNAME_KEY) %></c:if>" />
                <label for="<%= UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_PASSWORD_KEY%>">Password</label>
                <input type="password" placeholder="Password" name="<%= UsernamePasswordAuthenticationFilter.SPRING_SECURITY_FORM_PASSWORD_KEY%>" /><br>
                <button type="submit" class="btn">Enviar</button>
            </form>
        </div>
    </body>
</html>