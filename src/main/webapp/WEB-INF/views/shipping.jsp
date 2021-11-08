<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="shipping.information"/></title>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <h2><fmt:message key="shipping.information"/></h2>

    <p><fmt:message key="deliveries.may.take"/></p>

    <p><fmt:message key="these.times.may.be.delayed"/></p>

    <p><fmt:message key="if.your.tracking.number.shows.your.package"/></p>

    <%@ include file = "./parts/footer.jsp" %>
</body>
</html>

