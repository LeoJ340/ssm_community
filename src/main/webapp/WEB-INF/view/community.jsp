<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${communityInvitations.name}社区</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<%@include file="header.jsp"%>
<main class="container mt-3">
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <div class="border bg-transparent">
            <h5>${communityInvitations.name}社区</h5>
            <p>
                <c:choose>
                    <c:when test="${empty communityInvitations.introduction}">简介</c:when>
                    <c:otherwise>${communityInvitations.introduction}</c:otherwise>
                </c:choose>
            </p>
        </div>
        <ul>
            <c:forEach items="${communityInvitations.invitationUsers}" var="invitationUser">
                <li class="d-flex flex-column border-bottom">
                    <span class="row">
                        <a class="text-primary" href="/invitation/${invitationUser.id}">${invitationUser.title}</a>
                        <span>${invitationUser.username}</span>
                    </span>
                    <span class="content">${invitationUser.content}</span>
                    <span class="d-flex justify-content-end">${invitationUser.time}</span>
                </li>
            </c:forEach>
        </ul>
        <h5>发表回复</h5>
        <form method="post" action="${pageContext.request.contextPath}/publishInvitation">
            <input type="text" maxlength="50" placeholder="请输入标题" class="w-100 pl-3 mt-3 mb-3 title" name="title"id="title" />
            <div id="contentEidtor"></div>
            <textarea id="content" style="display: none" name="content"></textarea>
            <button type="submit" class="mt-3 btn btn-danger" id="publishButton">发表</button>
        </form>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/wangEditor/wangEditor.min.js"></script>
<script>
    let E = window.wangEditor;
    let editor = new E('#contentEidtor');
    let $text1 = $('#content');
    editor.customConfig.onchange = function(html) {
        $text1.val(html)
    };
    editor.create();
    $text1.val(editor.txt.html());
    if (${empty sessionScope.userStatus}){
        editor.txt.html("你还没有登录");
        editor.$textElem.attr('contenteditable', false);
        $("#title").attr("disabled",true);
        $("publishButton").attr("disabled",true);
    }
</script>
</body>
</html>
