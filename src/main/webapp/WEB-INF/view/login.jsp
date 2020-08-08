<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
</head>
<body>
<form class="form-signin" id="loginForm">
    <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal">用户登录</h1>
    </div>
    <div class="form-label-group">
        <label for="username">用户名：</label>
        <input type="text" id="username" class="form-control" placeholder="请输入用户名" name="username" value="${rememberUsername}">
    </div>
    <div class="form-label-group">
        <label for="password">密码：</label>
        <input type="password" id="password" class="form-control" placeholder="请输入密码" name="password" value="${rememberPassword}">
    </div>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" name="remember">记住我
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="button" onclick="login()">登录</button>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script>
    function login(){
        if ($("#username").val()===""||$("#password").val()===""){
            alert("请输入用户名及密码");
        }else {
            $.ajax({
                url:"${pageContext.request.contextPath}/login.do",
                type:"POST",
                data:$("#loginForm").serialize(),
                dataType:"json",
                success:function (response) {
                    if (response.success){
                        alert(response.message);
                        window.location.href="${pageContext.request.contextPath}/";
                    }else {
                        alert(response.message);
                    }
                }
            });
        }
    }
</script>
</body>
</html>
