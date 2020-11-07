<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${invitation.title}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/invitation.css">
</head>
<body class="bg-light">
<%@include file="header.jsp"%>
<main class="container">
    <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-dark rounded shadow-sm">
        <a href="${pageContext.request.contextPath}/community/${community.id}">
            <img class="mr-3" src="${community.logo}" alt="logo" width="48" height="48">
        </a>
        <div class="lh-100">
            <a href="${pageContext.request.contextPath}/community/${community.id}">
                <h6 class="mb-0 text-white lh-100">${community.name}社区</h6>
            </a>
            <small>
                <c:choose>
                    <c:when test="${empty community.introduction}">暂无简介</c:when>
                    <c:otherwise>${community.introduction}</c:otherwise>
                </c:choose>
            </small>
        </div>
    </div>
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <h5 class="mb-0 p-3">${invitation.title}</h5>
        <ul class="p-0">
            <li class="row border-info d-flex">
                <%--用户信息--%>
                <div class="col-lg-2 col-sm-12 mr-3 bg-light d-flex userInfo">
                    <small class="text-muted">楼主</small>
                    <a href="${pageContext.request.contextPath}/user/${invitation.userId}" class="text-center">
                        <img class="avatar" src="${invitation.userAvatar}" alt="logo">
                    </a>
                    <a href="${pageContext.request.contextPath}/user/${invitation.userId}" class="text-center">
                        <span class="username">${invitation.username}</span>
                    </a>
                </div>
                <div class="col-lg-9 col-sm-12 flex-grow-1 d-flex flex-column pt-3 pb-3 pr-3 border-bottom">
                    <div class="m-0 comment_content" style="word-break: break-all;">${invitation.content}</div>
                    <span class="flex-grow-1 d-flex align-self-end justify-content-end mr-3 time">
                        <fmt:formatDate value="${invitation.time}" pattern="yyyy-MM-dd hh:mm"/>
                    </span>
                </div>
            </li>
            <c:forEach items="${comments.list}" var="commentUser" varStatus="index">
                <li class="row border-info d-flex">
                    <div class="col-lg-2 col-sm-12 mr-3 bg-light d-flex userInfo">
                        <small class="text-muted">${index.index+1}楼</small>
                        <a href="${pageContext.request.contextPath}/user/${commentUser.userId}" class="text-center">
                            <img class="avatar" src="${commentUser.userAvatar}" alt="logo">
                        </a>
                        <a href="${pageContext.request.contextPath}/user/${commentUser.userId}" class="text-center">
                            <span class="username">${commentUser.username}</span>
                        </a>
                    </div>
                    <div class="col-lg-9 col-sm-12 flex-grow-1 d-flex flex-column pt-3 pb-3 pr-3 border-bottom" >
                        <div class="m-0 comment_content" style="word-break: break-all;">${commentUser.content}</div>
                        <div>
                            <div class="d-flex flex-wrap">
                                <button class="btn btn-info btn-sm d-flex justify-content-end" type="button"
                                        data-toggle="collapse" data-target="#comment${commentUser.id}" onclick="showComment(${commentUser.id})">回复</button>
                                <span class="flex-grow-1 d-flex align-self-end justify-content-end mr-3 time">
                                    <fmt:formatDate value="${commentUser.time}" pattern="yyyy-MM-dd hh:mm"/>
                                </span>
                            </div>
                            <div class="collapse mt-3" id="comment${commentUser.id}">
                                    <%--楼中评论区--%>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <%--分页条--%>
        <c:if test="${!empty comments.list && comments.list.size() > 0}">
            <nav aria-label="Page navigation example" class="mt-3 pb-1">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${comments.prePage < 1}">
                            <li class="page-item disabled" data-toggle="tooltip" data-placement="left" title="没有上一页">
                                <a class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/invitation/${invitation.id}?pageIndex=${comments.prePage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="index" begin="1" end="${comments.pages}">
                        <c:choose>
                            <c:when test="${index eq comments.pageNum}">
                                <li class="page-item active"><a class="page-link" href="/invitation/${invitation.id}?pageIndex=${index}">${index}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="/invitation/${invitation.id}?pageIndex=${index}">${index}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${comments.pageNum >= comments.nextPage}">
                            <li class="page-item disabled" data-toggle="tooltip" data-placement="right" title="没有下一页">
                                <a class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="/invitation/${invitation.id}?pageIndex=${comments.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </c:if>
        <h6>发表评论</h6>
        <form method="post" action="${pageContext.request.contextPath}/publishInvitation">
            <div id="contentEidtor"></div>
            <textarea style="display: none" id="content"></textarea>
            <button type="button" class="mt-3 btn btn-danger" name="publishButton" onclick="publishFirstComment()">发表</button>
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
    editor.customConfig.onchange = function(html) {
        $('#content').val(html)
    };
    editor.customConfig.zIndex = 0;
    editor.customConfig.uploadImgShowBase64 = true;// 使用 base64 保存图片
    editor.create();
    $('#content').val(editor.txt.html());

    // 全局变量---用户状态
    let userStatus = ${empty sessionScope.userStatus};

    // 用户未登录，禁用评论功能
    if (userStatus){
        editor.txt.html("你还没有登录");
        editor.$textElem.css("text-align","center");
        editor.$textElem.attr('contenteditable', false);
        disabledButton();
    }

    // 批量禁用所有按钮
    function disabledButton() {
        let publishButtons = document.getElementsByName("publishButton");
        for(let i = 0;i<publishButtons.length;i++){
            publishButtons[i].setAttribute("disabled","disabled");
        }
    }

    // 局部渲染评论
    function showComment(commentId,pageIndex,pageSize) {
        $.post("${pageContext.request.contextPath}/getComments",
            {
                cinId:commentId,
                pageIndex:pageIndex,
                pageSize:pageSize
            }, function (response) {
            $("#comment"+commentId).html(response);
            if (userStatus){
                disabledButton();
            }
        });
    }

    // 发表第一层评论
    function publishFirstComment() {
        if (userStatus){
            return;
        }
        let firstComment = {
            invitationId:${invitation.id},
            <c:if test="${sessionScope.userId!=null}">userId:${sessionScope.userId},</c:if>
            content:$("#content").val(),
            invitationUserId:${invitation.userId}
        };
        $.ajax({
            url:"${pageContext.request.contextPath}/publishComment",
            data:firstComment,
            type:"POST",
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

    // 层中选择评论对象
    function toCommentFor(cinId,cforId,cforUsername) {
        if (userStatus){
            return;
        }
        let cfor = $("#comment"+cinId).find("form").find("span");
        cfor.text("回复:"+cforUsername);
        cfor.attr("id",cforId);
    }

    // 发表评论
    function publishComment(cinId) {
        if (userStatus){
            return;
        }
        let commentView = $("#comment"+cinId);
        let cforId = commentView.find("form").find("span").attr("id");
        let comment = {
            invitationId: ${invitation.id},
            cinId:cinId,
            <c:if test="${sessionScope.userId!=null}">userId:${sessionScope.userId},</c:if>
            content: commentView.find("form").find("textarea").val(),
            invitationUserId:${invitation.userId}
        };
        if (cforId!==undefined){
            comment.cforId = cforId;
        }else {
            comment.cforId = cinId;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/publishComment",
            data:comment,
            type:"POST",
            dataType:"json",
            success:function (response) {
                console.log(response);
                if (response.success){
                    alert(response.message);
                    showComment(cinId);
                } else {
                    alert(response.message);
                }
            }
        })
    }
</script>
</body>
</html>
