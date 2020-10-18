<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/userIndex.css">
</head>
<body class="bg-light">
<%@include file="../header.jsp"%>
<main role="main" class="container">
    <div class="jumbotron jumbotron-fluid mt-5 mb-3 pt-3 pb-3">
        <div class="container">
            <div class="d-flex flex-wrap">
                <div class="avatar">
                    <img src="${userMap.user.avatar}" alt="">
                </div>
                <div class="d-flex flex-column ml-3">
                    <h3>${userMap.user.username}</h3>
                    <span>
                        生日：<fmt:formatDate value="${userMap.user.birthday}" pattern="MM-dd"/>
                    </span>
                </div>
                <c:if test="${sessionScope.userId==userMap.user.id}">
                    <div class="ml-auto d-flex justify-content-end">
                        <div>
                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#changePassword">修改密码</button>
                        </div>
                    </div>
                </c:if>
            </div>
            <!-- change password Modal -->
            <div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="changePasswordModalLabel">修改密码</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="pass1">密码</label>
                                    <input type="password" class="form-control" id="pass1">
                                </div>
                                <div class="form-group">
                                    <label for="pass2">再次输入密码</label>
                                    <input type="password" class="form-control" id="pass2">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="changePassword()">修改密码</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- change password Modal -->
            <div class="oftenBrowseCommunities">
                <h6 class="ml-1">常逛的社区</h6>
                <div class="btn-group" role="group" aria-label="communities">
                    <c:forEach items="${userMap.communities}" var="community">
                        <a href="${pageContext.request.contextPath}/community/${community.id}">
                            <button type="button" class="btn btn-secondary m-1">${community.name}</button>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-white rounded shadow-sm main">
        <ul class="nav nav-tabs d-flex" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#dynamic" onclick="dynamics()">动态</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#invitation" onclick="invitations()">帖子</a>
            </li>
            <c:if test="${userMap.user.id==sessionScope.userId}">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#notice" onclick="">
                        通知
                        <span class="badge badge-pill bg-light align-text-bottom"></span>
                    </a>
                </li>
            </c:if>
        </ul>
        <!-- tab-content -->
        <div class="tab-content">
            <div id="dynamic" class="container tab-pane active"><br>
                <%-- 个人动态页面 --%>
                <ul class="list-group" id="dynamics">
                    <c:forEach items="${userMap.dynamics}" var="dynamic" >
                        <li class="list-group-item d-flex flex-column">
                            <a>${dynamic.content}</a>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M3.204 11L8 5.519 12.796 11H3.204zm-.753-.659l4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"></path>
                            </svg>
                            <div class="card mb-1 border-0 bg-light">
                                <div class="card-body">
                                    ${dynamic.invitation}
                                </div>
                            </div>
                            <p class="time text-secondary">
                                回复于${dynamic.communityName}社区
                                &nbsp&nbsp
                                <fmt:formatDate value="${dynamic.time}" pattern="yyyy-MM-dd"/>
                            </p>
                        </li>
                    </c:forEach>
                </ul>
                <div class="text-center" id="dynamicLoading">
                    <div class="spinner-border" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
            </div>
            <div id="invitation" class="container tab-pane"><br>
                <%-- 帖子 --%>
                <ul class="list-group" id="invitations"></ul>
                <div class="text-center" id="invitationsLoading">
                    <div class="spinner-border" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
            </div>
            <c:if test="${userMap.user.id==sessionScope.userId}">
                <div id="notice" class="container tab-pane fade"><br>
                    <%-- 通知 --%>
                </div>
            </c:if>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/header.js"></script>
<script>
    let type = "dynamic"
    let dynamicIsFull = false
    let invitationIsFull = false

    function getScrollTop(){
        let scrollTop
        let bodyScrollTop = 0
        let documentScrollTop = 0
        if(document.body){
            bodyScrollTop = document.body.scrollTop
        }
        if(document.documentElement){
            documentScrollTop = document.documentElement.scrollTop
        }
        scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop
        return scrollTop
    }
    //文档的总高度
    function getScrollHeight(){
        let scrollHeight
        let bodyScrollHeight = 0
        let documentScrollHeight = 0
        if(document.body){
            bodyScrollHeight = document.body.scrollHeight
        }
        if(document.documentElement){
            documentScrollHeight = document.documentElement.scrollHeight
        }
        scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight
        return scrollHeight
    }
    function getWindowHeight(){
        let windowHeight
        if(document.compatMode === "CSS1Compat"){
            windowHeight = document.documentElement.clientHeight
        }else{
            windowHeight = document.body.clientHeight
        }
        return windowHeight
    }

    window.onscroll = function () {
        if(getScrollHeight() - (getScrollTop() + getWindowHeight()) < 1){
            if (type === "dynamic" && dynamicIsFull === false){
                dynamics()
            }else if (type === "invitation" && invitationIsFull === false){
                invitations()
            }
        }
    }

    let dynamicPageIndex = 1
    function dynamics() {
        type = "dynamic"
        if (!dynamicIsFull){
            $.ajax({
                url: "${pageContext.request.contextPath}/user/dynamic/${userMap.user.id}/"+dynamicPageIndex*3,
                type: "GET",
                success:function (response) {
                    dynamicPageIndex++
                    try {
                        let json = JSON.parse(response)
                        if (json.isEmpty){
                            $("#dynamicLoading").css("visibility","hidden")
                            dynamicIsFull = true
                        }
                    }catch (e) {
                        $("#dynamics").append(response)
                    }
                }
            })
        }
    }

    let invitationPageIndex = 0
    function invitations() {
        type = "invitation"
        if (!invitationIsFull){
            $.ajax({
                url: "${pageContext.request.contextPath}/user/invitations/${userMap.user.id}/"+invitationPageIndex*10,
                type: "GET",
                success:function (response) {
                    invitationPageIndex++
                    try {
                        let json = JSON.parse(response)
                        if (json.isEmpty){
                            $("#invitationsLoading").css("visibility","hidden")
                            invitationIsFull = true
                        }
                    }catch (e) {
                        $("#invitations").append(response)
                    }
                }
            })
        }
    }

    <c:if test="${sessionScope.userId==userMap.user.id}">
    function changePassword(){
        let pass1 = document.getElementById("pass1").value
        let pass2 = document.getElementById("pass2").value
        if (pass1===""||pass2===""){
            alert("请输入密码");
        }else {
            if (pass1===pass2){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/update",
                    data: {
                        id:${sessionScope.userId},
                        password:pass1
                    },
                    type:"POST",
                    dataType:"json",
                    success:function (response) {
                        if (response.success){
                            alert("修改成功，请重新登录!");
                            window.location.href="${pageContext.request.contextPath}/";
                        } else {
                            alert("修改失败");
                        }
                        $('#changePassword').modal('hide');
                    }
                })
            }else {
                alert("两次输入密码不同");
            }
        }
    }
    </c:if>
</script>
</body>
</html>
