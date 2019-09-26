<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${invitation.title}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<%@include file="header.jsp"%>
<main class="container mt-3">
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <div class="p-3 border bg-transparent">
            <h5><a href="/community/${community.id}">${community.name}社区</a></h5>
            <p>
                <c:choose>
                    <c:when test="${empty community.introduction}">暂无简介</c:when>
                    <c:otherwise>${community.introduction}</c:otherwise>
                </c:choose>
            </p>
        </div>
        <h5 class="mt-3 mb-0 p-3 border">${invitation.title}</h5>
        <ul class="border p-0">
            <li class="row p-3 border-bottom d-flex flex-nowrap">
                <%--用户信息--%>
                <div class="col-1 p-0 bg-info d-flex flex-column">
                    <span class="text-center">${invitation.username}</span>
                </div>
                <div class="flex-grow-1 ml-3 d-flex flex-column">
                    <p style="word-break: break-all;">${invitation.content}</p>
                    <span class="flex-grow-1 d-flex align-self-end justify-content-end mr-3 mt-5 time">${invitation.time}</span>
                </div>
            </li>
            <c:forEach items="${comments.list}" var="commentUser">
                <li class="row p-3 border-bottom d-flex flex-nowrap">
                    <div class="col-1 p-0 bg-info d-flex flex-column">
                        <span class="text-center">${commentUser.username}</span>
                    </div>
                    <div class="flex-grow-1 ml-3 d-flex flex-column">
                        <p style="word-break: break-all;">${commentUser.content}</p>
                        <span class="flex-grow-1 d-flex align-self-end justify-content-end mr-3 time">${commentUser.time}</span>
                        <div>
                            <button class="btn btn-primary d-flex justify-content-end" type="button"
                                    data-toggle="collapse" data-target="#comment${commentUser.id}" onclick="showComment(${commentUser.id})">回复</button>
                            <div class="collapse" id="comment${commentUser.id}">
                                <%--楼中评论区--%>
                                <div class="card card-body"></div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <%--分页条--%>
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
    </div>
</main>
<div class="container mt-3">
    <h5>发表评论</h5>
    <form method="post" action="${pageContext.request.contextPath}/publishInvitation">
        <div id="contentEidtor"></div>
        <textarea style="display: none" id="content"></textarea>
        <button type="button" class="mt-3 btn btn-danger" name="publishButton" onclick="publishFirstComment()">发表</button>
    </form>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/wangEditor/wangEditor.min.js"></script>
<script>
    // 创建富文本编辑器
    let E = window.wangEditor;
    let editor = new E('#contentEidtor');
    let $text1 = $('#content');
    editor.customConfig.onchange = function(html) {
        $text1.val(html)
    };
    editor.create();
    $text1.val(editor.txt.html());

    // 用户未登录，禁用评论功能
    if (${empty sessionScope.userStatus}){
        editor.txt.html("你还没有登录");
        editor.$textElem.css("text-align","center");
        editor.$textElem.attr('contenteditable', false);
        // 批量禁用所有按钮
        let publishButtons = document.getElementsByName("publishButton");
        for(let i = 0;i<publishButtons.length;i++){
            publishButtons[i].setAttribute("disabled","disabled");
        }
    }
    // 局部渲染评论
    function showComment(commentId) {
        $.ajax({
            url:"/getCommentUsers",
            data:{
                cinId:commentId
            },
            type:"GET",
            success:function (response) {
                console.log(response);
            }
        })
    }

    // 发表第一层评论
    function publishFirstComment() {
        let firstComment = {
            invitationId:${invitation.id},
            <c:if test="${sessionScope.userId!=null}">userId:${sessionScope.userId},</c:if>
            content:$("#content").val()
        };
        $.ajax({
            url:"/publishComment",
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
    function toCommentFor(cinId,cforId,cforUsername) {
        let cfor = $("#comment"+cinId).find("form").find("span");
        cfor.text("回复:"+cforUsername);
        cfor.attr("id",cforId);
    }
    function publishComment(cinId) {
        let cforId = $("#comment"+cinId).find("form").find("span").attr("id");
        let comment = {
            invitationId: ${invitation.id},
            cinId:cinId,
            <c:if test="${sessionScope.userId!=null}">userId:${sessionScope.userId},</c:if>
            content: $("#comment"+cinId).find("form").find("textarea").val()
        };
        if (cforId!==undefined){
            comment.cforId = cforId;
        }else {
            comment.cforId = cinId;
        }
        console.log(comment);
        $.ajax({
            url:"/publishComment",
            data:comment,
            type:"POST",
            dataType:"json",
            success:function (response) {
                console.log(response);
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
