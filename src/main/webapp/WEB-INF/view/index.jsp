<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="bg-light p-3">
        <h5>热门社区</h5>
        <ul class="row">
            <c:forEach items="${topCommunity}" var="community" end="2">
                <li class="text-center" style="width: 33%">
                    <h3><a href="${pageContext.request.contextPath}/community/${community.id}">${community.name}社区</a></h3>
                    <p class="content">
                        <c:choose>
                            <c:when test="${empty community.introduction}">
                                暂无简介
                            </c:when>
                            <c:otherwise>
                                ${community.introduction}
                            </c:otherwise>
                        </c:choose>
                    </p>
                </li>
            </c:forEach>
        </ul>
        <ul class="row">
            <c:forEach items="${topCommunity}" var="community" begin="3">
                <li class="text-center" style="width: 33%">
                    <h3><a href="${pageContext.request.contextPath}/community/${community.id}">${community.name}社区</a></h3>
                    <p class="content">
                        <c:choose>
                            <c:when test="${empty community.introduction}">
                                暂无简介
                            </c:when>
                            <c:otherwise>
                                ${community.introduction}
                            </c:otherwise>
                        </c:choose>
                    </p>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <h5>热门帖子</h5>
        <ul>
            <c:forEach items="${topInvitation}" var="invitation">
                <li class="d-flex flex-column border-bottom">
                    <span><a href="${pageContext.request.contextPath}/community/${invitation.communityId}" class="bg-dark text-white">${invitation.community.name}社区</a></span>
                    <div class="row pr-3 pl-3">
                        <span><a href="${pageContext.request.contextPath}/invitation/${invitation.id}">${invitation.title}</a></span>
                        <span class="flex-grow-1 d-flex justify-content-end time">
                                <fmt:formatDate value="${invitation.time}" pattern="yyyy-MM-dd hh:mm"/>
                        </span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>