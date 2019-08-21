<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/register" class="form-signin" method="post" onsubmit="return verify()">
    <div class="text-center mb-4">
        <img class="mb-5" src="${pageContext.request.contextPath}/static/images/logo.webp" alt="" width="200">
        <h1 class="h3 mb-3 font-weight-normal">用户注册</h1>
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="username">用户名：</label>
        <input type="text" id="username" class="form-control" placeholder="请输入用户名" name="username" maxlength="10" required>
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="password">密码：</label>
        <input type="password" id="password" class="form-control" placeholder="请输入长度为6-16的密码" name="password" maxlength="16" minlength="6" required>
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="passwordAgain">再次输入密码：</label>
        <input type="password" id="passwordAgain" class="form-control" placeholder="请再次输入密码" maxlength="16" minlength="6" name="passwordAgain" required>
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="birthday">出生日期：</label>
        <input type="date" id="birthday" class="form-control" name="birthday" required>
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="email">email：</label>
        <input type="email" id="email" class="form-control" placeholder="请输入您的Email" name="email" required>
    </div>

    <div class="form-label-group mb-3">
        <span class="text-danger">*</span>
        <label for="tel-number">联系电话：</label>
        <input type="tel" id="tel-number" class="form-control" placeholder="请输入您的联系电话" name="telNumber" required>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script>
    /**
     * 两次密码验证
     * @returns {boolean}
     */
    function verify(){
        let password = $("#password").val();
        let passwordAgain = $("#passwordAgain").val();
        if (password===passwordAgain){
            return true;
        } else {
            alert("两次输入的密码不同!");
            return false;
        }
    }
</script>
</body>
</html>
