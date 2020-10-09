<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${community.name}社区</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body class="bg-light">
<%@include file="header.jsp"%>
<main class="container">
    <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-dark rounded shadow-sm">
        <a href="${pageContext.request.contextPath}/community/${community.id}">
            <img class="mr-3" src="${community.logo}" alt="logo" width="48" height="48">
        </a>
        <div class="lh-100">
            <h6 class="mb-0 text-white lh-100">${community.name}社区</h6>
            <small>
                <c:choose>
                    <c:when test="${empty community.introduction}">暂无简介</c:when>
                    <c:otherwise>${community.introduction}</c:otherwise>
                </c:choose>
            </small>
        </div>
    </div>

    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <c:forEach items="${invitationPage.list}" var="invitationUser">
            <div class="media text-muted pt-3">
                <div class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
                    <div class="d-flex justify-content-between align-items-center w-100">
                        <strong class="text-gray-dark">
                            <a href="${pageContext.request.contextPath}/invitation/${invitationUser.id}">${invitationUser.title}</a>
                        </strong>
                        <fmt:formatDate value="${invitationUser.time}" pattern="yyyy-MM-dd hh:mm"/>
                    </div>
                    <span class="d-block"><a href="">${invitationUser.username}</a></span>
                </div>
            </div>
        </c:forEach>
            <%-- 分页条 --%>
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
                                <a class="page-link" href="${pageContext.request.contextPath}/community/${community.id}?pageIndex=${invitationPage.prePage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="index" begin="1" end="${invitationPage.pages}">
                        <c:choose>
                            <c:when test="${index eq invitationPage.pageNum}">
                                <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/community/${community.id}?pageIndex=${index}">${index}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/community/${community.id}?pageIndex=${index}">${index}</a></li>
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
                                <a class="page-link" href="${pageContext.request.contextPath}/community/${community.id}?pageIndex=${invitationPage.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>

            <h6>发表新帖</h6>
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
<script src="${pageContext.request.contextPath}/static/js/header.js"></script>
<script>
    // 创建富文本编辑器
    let E = window.wangEditor;
    let editor = new E('#contentEidtor');
    let content = $('#content');
    editor.customConfig.onchange = function(html) {
        content.val(html);
    };
    editor.customConfig.zIndex = 0;
    editor.customConfig.uploadImgShowBase64 = true;// 使用 base64 保存图片
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
            url:"${pageContext.request.contextPath}/publishInvitation",
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
