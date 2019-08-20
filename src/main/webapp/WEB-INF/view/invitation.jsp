<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${invitationComment.title}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<%@include file="header.jsp"%>
<main class="container mt-3">
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <div class="border bg-transparent">
            <h5>${invitationComment.community.name}社区</h5>
            <p>
                <c:choose>
                    <c:when test="${empty invitationComment.community.introduction}">简介</c:when>
                    <c:otherwise>${invitationComment.community.introduction}</c:otherwise>
                </c:choose>
            </p>
        </div>
        <h5 class="mt-3 mb-1 p-3 border">${invitationComment.title}</h5>
        <ul class="border p-0">
            <li class="row p-3 border-bottom d-flex flex-nowrap">
                <%--用户信息--%>
                <div class="p-3 d-flex flex-column">
                    <img src="" alt="" style="width: 75px;height: 75px;background-color: #1e88e5">
                    <span class="text-center">${invitationComment.username}</span>
                </div>
                <div class="flex-grow-1 ml-3 d-flex flex-column">
                    <p style="word-break: break-all;">${invitationComment.content}</p>
                    <span class="flex-grow-1 d-flex align-self-end justify-content-end mr-3 mt-5">${invitationComment.time}</span>
                </div>
            </li>
            <c:forEach items="${invitationComment.commentUsers}" var="commentUser">
                <li class="row p-3 border-bottom d-flex flex-nowrap">
                    <div class="p-3 d-flex flex-column">
                        <img src="" alt="" style="width: 75px;height: 75px;background-color: #1e88e5">
                        <span class="text-center">${commentUser.username}</span>
                    </div>
                    <div class="flex-grow-1 ml-3 d-flex flex-column">
                        <p style="word-break: break-all;">${commentUser.content}</p>
                        <span class="flex-grow-1 d-flex align-self-end justify-content-end mr-3 mt-5">${commentUser.time}</span>
                        <div>
                            <button class="btn btn-primary d-flex justify-content-end" type="button" data-toggle="collapse" data-target="#comment${commentUser.id}">回复</button>
                            <div class="collapse" id="comment${commentUser.id}">
                                <div class="card card-body">
                                    <ul>
                                        <c:forEach items="${commentUser.commentUsers}" var="comment">
                                            <li>
                                                <span>${comment.username}:
                                                    <c:if test="${comment.cforId!=comment.cinId}">
                                                        回复 ${comment.cforUsername}:
                                                    </c:if>
                                                    ${comment.content}
                                                </span>
                                                <span>${comment.time}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <form method="get" action="">
                                        <textarea rows="1" maxlength="100" required class="w-100" name="content"></textarea>
                                        <input type="submit" value="回复">
                                    </form>
                                </div>
                            </div>
                        </div>
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
