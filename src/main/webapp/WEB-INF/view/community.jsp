<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${community.name}社区</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<%@include file="header.jsp"%>
<main class="container mt-3">
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <div class="border bg-transparent p-3">
            <h5>${community.name}社区</h5>
            <p>
                <c:choose>
                    <c:when test="${empty community.introduction}">暂无简介</c:when>
                    <c:otherwise>${community.introduction}</c:otherwise>
                </c:choose>
            </p>
        </div>
        <ul class="mt-3 pl-0">
            <c:forEach items="${invitationPage.list}" var="invitationUser">
                <li class="d-flex flex-column border-bottom">
                    <div class="row pl-3">
                        <a class="text-primary" href="/invitation/${invitationUser.id}">${invitationUser.title}</a>
                        <span class="flex-grow-1 d-flex justify-content-end pr-3 time">${invitationUser.username}</span>
                    </div>
                    <div class="row pl-3">
                        <span class="content">${invitationUser.content}</span>
                        <span class="flex-grow-1 d-flex justify-content-end pr-3 time">
                            <fmt:formatDate value="${invitationUser.time}" pattern="yyyy-MM-dd hh:mm"/>
                        </span>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${invitationPage.prePage < 1}">
                        <li class="page-item disabled" data-toggle="tooltip" data-placement="left" title="没有上一页">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/community/${community.id}?pageIndex=${invitationPage.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="index" begin="1" end="${invitationPage.pages}">
                    <c:choose>
                        <c:when test="${index eq invitationPage.pageNum}">
                            <li class="page-item active"><a class="page-link" href="/community/${community.id}?pageIndex=${index}">${index}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="/community/${community.id}?pageIndex=${index}">${index}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${invitationPage.pageNum >= invitationPage.nextPage}">
                        <li class="page-item disabled" data-toggle="tooltip" data-placement="right" title="没有下一页">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/community/${community.id}?pageIndex=${invitationPage.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
        <h5>发表新帖</h5>
        <form method="post" action="${pageContext.request.contextPath}/publishInvitation">
            <input type="text" maxlength="50" placeholder="请输入标题" class="w-100 pl-3 mt-3 mb-3 title" id="title" />
            <div id="contentEidtor"></div>
            <textarea style="display: none" id="content"></textarea>
            <button type="button" class="mt-3 btn btn-danger" id="publishButton" onclick="publishInvitation()">发表</button>
        </form>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/wangEditor/wangEditor.min.js"></script>
<script>
    // 创建富文本编辑器
    let E = window.wangEditor;
    let editor = new E('#contentEidtor');
    let content = $('#content');
    editor.customConfig.onchange = function(html) {
        content.val(html);
    };
    editor.create();
    content.val(editor.txt.html());

    // 全局变量---用户状态
    let userStatus = ${empty sessionScope.userStatus};

    // 用户未登录，禁用发贴功能
    if (userStatus){
        editor.txt.html("你还没有登录");
        editor.$textElem.css("text-align","center");
        editor.$textElem.attr('contenteditable', false);
        $("#title").attr("disabled",true);
        $("#publishButton").attr("disabled",true);
    }
    function publishInvitation() {
        if (userStatus){
            return;
        }
        let invitation = {
            communityId : ${community.id},
            <c:if test="${sessionScope.userId!=null}">userId:${sessionScope.userId},</c:if>
            title:$("#title").val(),
            content:$("#content").val()
        };
        $.ajax({
            url:"/publishInvitation",
            type:"POST",
            data:invitation,
            dataType:"json",
            success:function (response) {
                if (response.success){
                    alert(response.message);
                    window.location.reload();
                } else {
                    alert(response.message);
                }
            }
        })
    }
</script>
</body>
</html>
