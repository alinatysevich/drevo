<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<fmt:message key="order" var="order" />

<html>
<head>
    <meta charset="UTF-8">
    <title>Basket</title>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <h2><fmt:message key="basket"/></h2>

    <c:choose>
        <c:when test="${empty user}">
            <fmt:message key="please.login.to.use.the.basket"/>
        </c:when>
        <c:when test="${empty basket.basketItems}">
            <fmt:message key="the.basket.is.empty"/>
        </c:when>
        <c:otherwise>
            <div>
                <fmt:message key="total"/>: <strong>${total}<fmt:message key="currency.symbol"/></strong>
            </div>

            <c:forEach var="basketItem" items="${basket.basketItems}" varStatus="status">
                <div>
                    <h4>${basketItem.product.name}</h4>
                    <div><fmt:message key="quantity"/>: ${basketItem.quantity}</div>
                    <div><fmt:message key="price"/>: ${basketItem.product.price}<fmt:message key="currency.symbol"/></div>
                    <br />
                    <img src="${basketItem.product.imageUrl}" height="150" />
                    <br /><br />
                    <c:if test="${!status.last}"><hr /></c:if>
                </div>
            </c:forEach>

            <br />

            <form:form method="post" action="/basket/buy/${basket.id}">
                <input type="submit" value="${order}" />
            </form:form>
        </c:otherwise>
    </c:choose>

    <%@ include file = "./parts/footer.jsp" %>
</body>
</html>
