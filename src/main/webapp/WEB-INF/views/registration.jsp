<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<fmt:message key="username" var="username" />
<fmt:message key="password" var="password" />
<fmt:message key="phone.number" var="phoneNumber" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><fmt:message key="register"/></title>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <form:form method="POST" modelAttribute="userForm" autocomplete="false">
        <h2><fmt:message key="register"/></h2>

        <div>
            <form:input type="text" path="username" placeholder="${username}"
                        autofocus="true"></form:input>
            <form:errors path="username"></form:errors>
                ${usernameError}
        </div>

        <div>
            <form:input type="password" path="password" placeholder="${password}"></form:input>
        </div>

        <div>
            <form:input type="tel" path="phone" placeholder="${phoneNumber}"></form:input>
            <form:errors path="phone"></form:errors>
        </div>

        <br><button type="submit"><fmt:message key="register"/></button>
    </form:form>

    <br><a href="/"><fmt:message key="main.page" /></a>
</body>
</html>