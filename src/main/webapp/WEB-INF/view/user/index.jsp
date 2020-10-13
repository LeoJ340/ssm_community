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
    <div class="p-3 bg-white rounded shadow-sm">

    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/header.js"></script>
<script>
    function changePassword(){
        const pass1 = $("#pass1").val();
        const pass2 = $("#pass2").val();
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
</script>
</body>
</html>
