<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<fmt:message key="buy" var="buy" />
<fmt:message key="save" var="save" />
<fmt:message key="please.login.to.use.the.basket" var="please" />

<html>
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="products"/></title>
</head>

<body>
    <%@ include file = "./parts/header.jsp" %>

    <h2><fmt:message key="products"/></h2>

    <c:forEach var="product" items="${products}" varStatus="status">
        <div>
            <h4>${product.name}</h4>
            <div><fmt:message key="price"/>: ${product.price}<fmt:message key="currency.symbol"/></div>
            <div><fmt:message key="material"/>: ${product.material.name}</div>
            <div><fmt:message key="care"/>: ${product.care}</div>
            <div><fmt:message key="filling" />: ${product.filling}</div>
            <div><fmt:message key="delivery.days"/>: ${product.deliveryDays}</div>
            <br />
            <img src="${product.imageUrl}" height="150" />
            <br /><br />
            <form:form method="post" action="/products/buy/${product.id}">
                <input type="submit" value="${buy}" ${empty user ? "disabled" : ""} title="${empty user ? please : ""}" />
            </form:form>
            <br /><br />
            <c:if test="${!status.last}"><hr /></c:if>
        </div>
    </c:forEach>

    <sec:authorize access="hasAuthority('ADMIN')">
        <h2><fmt:message key="add.product"/></h2>

        <form:form method="post" action="/products" modelAttribute="product">
            <table cellpadding="2" cellspacing="2">
                <tr>
                    <td><fmt:message key="category"/></td>
                    <td><form:select path="category" items="${productCategories}" itemValue="name" itemLabel="name" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="material"/></td>
                    <td><form:select path="material" items="${productMaterials}" itemValue="name" itemLabel="name" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="name"/></td>
                    <td><form:input path="name" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="care"/></td>
                    <td><form:input path="care" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="filling"/></td>
                    <td><form:input path="filling" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="image.url"/></td>
                    <td><form:input path="imageUrl" type="url" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="price"/></td>
                    <td><form:input path="price" type="number" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="delivery.days"/></td>
                    <td><form:input path="deliveryDays" type="number" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="${save}" /></td>
                </tr>
            </table>
        </form:form>
    </sec:authorize>

    <%@ include file = "./parts/footer.jsp" %>
</body>
</html>
