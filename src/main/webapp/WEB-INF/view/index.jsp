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
    <div class="bg-light p-3">
        <h5>推荐社区</h5>
        <ul class="row">
            <c:forEach items="${topCommunity}" var="community" end="2">
                <li class="flex-fill text-center">
                    <h3><a href="#">${community.name}社区</a></h3>
                    <p>
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
                <li class="flex-fill text-center">
                    <h3><a href="#">${community.name}社区</a></h3>
                    <p>
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
            <c:forEach items="${topInvitation.list}" var="invitation">
                <li class="d-flex flex-column border-bottom">
<%--                    社区--%>
                    <span><a href="#">${invitation.title}</a></span>
<%--                    标题--%>
                    <span><a href="#">${invitation.content}</a></span>
                    <span class="d-flex justify-content-end">${invitation.time}</span>
                </li>
            </c:forEach>
        </ul>
        <nav aria-label="Page navigation example d-flex justify-content-center">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
