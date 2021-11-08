<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<fmt:message key="edit" var="edit" />
<fmt:message key="save" var="save" />

<html>
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="user.page"/></title>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <div>
        <h2><fmt:message key="phone.number"/></h2>
        ${user.phone}
    </div>

    <c:choose>
        <c:when test="${param.edit}">
            <h2><fmt:message key="edit.address"/></h2>

            <form:form method="post" action="/user" modelAttribute="address">
                <table cellpadding="2" cellspacing="2">
                    <tr>
                        <td><fmt:message key="zip.code"/></td>
                        <td><form:input path="zipCode" /></td>
                    </tr>
                    <tr>
                        <td><fmt:message key="country"/></td>
                        <td><form:select path="country" items="${countries}" itemValue="name" itemLabel="name" /></td>
                    </tr>
                    <tr>
                        <td><fmt:message key="region"/></td>
                        <td><form:input path="region" /></td>
                    </tr>
                    <tr>
                        <td><fmt:message key="city"/></td>
                        <td><form:input path="city" /></td>
                    </tr>
                    <tr>
                        <td><fmt:message key="address"/></td>
                        <td><form:input path="address" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="${save}" /></td>
                    </tr>
                </table>
            </form:form>
        </c:when>
        <c:otherwise>
            <h2><fmt:message key="address"/></h2>
            <div><fmt:message key="zip.code"/>: ${address.zipCode}</div>
            <div><fmt:message key="country"/>: ${address.country}</div>
            <div><fmt:message key="region"/>: ${address.region}</div>
            <div><fmt:message key="city"/>: ${address.city}</div>
            <div><fmt:message key="address"/>: ${address.address}</div>
            <br />
            <a href="?edit=true"><fmt:message key="edit"/></a>
            <br /><br />
        </c:otherwise>
    </c:choose>

    <hr />

    <h2><fmt:message key="order.history"/></h2>
    <c:forEach var="basket" items="${orders}">
        <c:forEach var="basketItem" items="${basket.basketItems}">
            <div>
                <h4>${basketItem.product.name}</h4>
                <div><fmt:message key="quantity"/>: ${basketItem.quantity}</div>
                <div><fmt:message key="price"/>: ${basketItem.product.price}<fmt:message key="currency.symbol"/></div>
                <br />
                <img src="${basketItem.product.imageUrl}" height="150" />
                <br /><br />
            </div>
        </c:forEach>
    </c:forEach>

    <%@ include file = "./parts/footer.jsp" %>
</body>
</html>
