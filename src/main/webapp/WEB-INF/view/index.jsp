<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>论坛首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body class="bg-light">
<%@include file="header.jsp"%>
<main role="main" class="container">
    <div class="row">
        <div class="col">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <h5 class="border-bottom border-gray pb-2 mb-0">热门社区</h5>
                <c:forEach items="${topCommunity}" var="community">
                    <div class="media text-muted pt-3">
                        <img src="${community.logo}" alt="logo" width="48" height="48">
                        <p class="media-body pb-3 mb-0 ml-3 lh-125 border-bottom border-gray">
                            <strong class="d-block text-gray-dark">
                                <a href="${pageContext.request.contextPath}/community/${community.id}">${community.name}社区</a>
                            </strong>
                            <c:choose>
                                <c:when test="${empty community.introduction}">
                                    暂无简介
                                </c:when>
                                <c:otherwise>
                                    ${community.introduction}
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </c:forEach>
            </div>
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <h5 class="border-bottom border-gray pb-2 mb-0">热门帖子</h5>
                <c:forEach items="${topInvitation}" var="invitation">
                    <div class="media text-muted pt-3">
                        <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">
                                    <a href="${pageContext.request.contextPath}/community/${invitation.communityId}">${invitation.community.name}社区</a>
                                </strong>
                                <fmt:formatDate value="${invitation.time}" pattern="yyyy-MM-dd"/>
                            </div>
                            <span class="d-block"><a href="${pageContext.request.contextPath}/invitation/${invitation.id}">${invitation.title}</a></span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/header.js"></script>
</body>
</html>