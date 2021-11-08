<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<fmt:message key="complete.order" var="completeOrder" />

<html>
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="not.completed.orders"/></title>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <h2><fmt:message key="not.completed.orders"/></h2>

    <c:if test="${empty orders}"><fmt:message key="there.are.no.new.orders"/></c:if>

    <c:forEach var="basket" items="${orders}" varStatus="status">
        <div><fmt:message key="name"/>: ${basket.user.username}</div>
        <div><fmt:message key="phone.number"/>: ${basket.user.phone}</div>
        <div><fmt:message key="address"/>: ${basket.user.address.address}, ${basket.user.address.city}, ${basket.user.address.region} region,  ${basket.user.address.zipCode}, ${basket.user.address.country}</div>

        <c:forEach var="basketItem" items="${basket.basketItems}">
            <div>
                <h4>${basketItem.product.name}</h4>
                <div><fmt:message key="quantity"/>: ${basketItem.quantity}</div>
                <div><fmt:message key="price"/>: ${basketItem.product.price}<fmt:message key="currency.symbol"/></div>
                <br />
                <img src="${basketItem.product.imageUrl}" height="150" />
            </div>
        </c:forEach>

        <br /><br />
        <form:form method="post" action="/admin/orders/complete/${basket.id}">
            <input type="submit" value="${completeOrder}" />
        </form:form>

        <c:if test="${!status.last}"><hr /></c:if>
    </c:forEach>

    <%@ include file = "./parts/footer.jsp" %>
</body>
</html>
