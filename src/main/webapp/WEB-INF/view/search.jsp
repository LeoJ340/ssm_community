<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>社区首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<%@include file="header.jsp"%>
<main class="container mt-3">
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <h5>搜索结果：共${communites.size()}条</h5>
        <ul>
            <c:forEach items="${communites}" var="community">
                <li class="d-flex flex-column border-bottom">
                    <span><a href="${pageContext.request.contextPath}/community/${community.id}" class="bg-dark text-white">${community.name}社区</a></span>
                    <span class="content">
                        <c:choose>
                            <c:when test="${empty community.introduction}">暂无简介</c:when>
                            <c:otherwise>${community.introduction}</c:otherwise>
                        </c:choose>
                    </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
