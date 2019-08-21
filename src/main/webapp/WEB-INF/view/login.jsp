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
<form class="form-signin" method="post" action="${pageContext.request.contextPath}/login">
    <div class="text-center mb-4">
        <img class="mb-5" src="${pageContext.request.contextPath}/static/images/logo.webp" alt="" width="200">
        <h1 class="h3 mb-3 font-weight-normal">用户登录</h1>
    </div>

    <div class="form-label-group">
        <label for="username">用户名：</label>
        <input type="text" id="username" class="form-control" placeholder="请输入用户名" name="username" maxlength="10" required value="${rememberUsername}">
    </div>

    <div class="form-label-group">
        <label for="password">密码：</label>
        <input type="password" id="password" class="form-control" placeholder="请输入密码" name="password" minlength="6" maxlength="16" required value="${rememberPassword}">
    </div>

    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" name="remember">记住我
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
