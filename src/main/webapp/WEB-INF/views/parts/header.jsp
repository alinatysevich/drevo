<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : fn:replace(fn:replace(pageContext.request.locale, '_US', ''), '_RU', '')}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<style>
    body {
        padding: 16px;
    }

    body.dark-theme {
        color: white;
        background-color: #121212;
    }

    header {
        display: flex;
        justify-content: space-between;
    }

    select {
        width: 100%;
    }

    .dark-theme a:visited {
        color: #ddd;
    }

    .dark-theme a, .dark-theme a:hover {
        color: white;
    }

    .top-right form {
        display: inline-block;
    }
</style>

<header>
    <div>
        <sec:authorize access="isAuthenticated()">
            <fmt:message key="hello"/>, <strong>${pageContext.request.userPrincipal.name}</strong>!
            <c:if test="${!fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/user')}">
                <a href="/user"><fmt:message key="go.to.profile"/></a>
            </c:if>
            <sec:authorize access="hasAuthority('ADMIN')">
                | <a href="/admin/orders"><fmt:message key="not.completed.orders"/></a>
            </sec:authorize>
        </sec:authorize>
    </div>

    <div class="top-right">
        <a href="/"><fmt:message key="main.page"/></a> |
        <a href="/help/shipping"><fmt:message key="shipping"/></a> |
        <a href="/basket"><fmt:message key="basket"/></a>

        <sec:authorize access="!isAuthenticated()">
            | <a href="/login"><fmt:message key="login"/></a>
            | <a href="/registration"><fmt:message key="register"/></a>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            | <a href="/logout"><fmt:message key="logout"/></a>
        </sec:authorize>

        | <form>
            <select id="language" name="language" onchange="submit()">
                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                <option value="ru" ${language == 'ru' ? 'selected' : ''}>Русский</option>
            </select>
        </form>
    </div>
</header>

