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
<form class="form-signin" id="registerForm">
    <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal">用户注册</h1>
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="username">用户名：</label>
        <input type="text" id="username" class="form-control" placeholder="请输入用户名" maxlength="10">
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="password">密码：</label>
        <input type="password" id="password" class="form-control" placeholder="请输入密码" maxlength="16">
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="passwordAgain">再次输入密码：</label>
        <input type="password" id="passwordAgain" class="form-control" placeholder="请再次输入密码" maxlength="16">
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="birthday">出生日期：</label>
        <input type="date" id="birthday" class="form-control">
    </div>

    <div class="form-label-group">
        <span class="text-danger">*</span>
        <label for="email">email：</label>
        <input type="email" id="email" class="form-control" placeholder="请输入您的Email">
    </div>

    <div class="form-label-group mb-3">
        <span class="text-danger">*</span>
        <label for="telNumber">联系电话：</label>
        <input type="tel" id="telNumber" class="form-control" placeholder="请输入您的联系电话">
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="button" onclick="register()">注册</button>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script>
    function register() {
        let username = $("#username").val();
        let password = $("#password").val();
        let passwordAgain = $("#passwordAgain").val();
        let birthday = $("#birthday").val();
        let email = $("#email").val();
        let telNumber = $("#telNumber").val();
        if (username===""||password===""||passwordAgain===""||birthday===""||email===""||telNumber==="") {
            alert("请输入完整信息");
        }else if (password!==passwordAgain) {
            alert("两次输入密码不同");
        }else {
            let user = {
                username:username,
                password:password,
                birthday:birthday,
                email:email,
                telNumber:telNumber
            };
            $.ajax({
                url:"${pageContext.request.contextPath}/register.do",
                type:"POST",
                data:user,
                dataType:"json",
                success:function (response) {
                    if (response.success){
                        alert(response.message);
                        window.location.href="${pageContext.request.contextPath}/";
                    }else {
                        alert(response.message);
                    }
                }
            })
        }
    }
</script>
</body>
</html>
