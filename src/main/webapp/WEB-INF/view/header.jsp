<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<header class="bg-dark">
    <div class="container d-flex">
        <a href="${pageContext.request.contextPath}/index">首页</a>
        <div class="flex-grow-1 d-flex justify-content-end">
            <form class="d-flex flex-wrap align-content-center m-0">
                <input type="text" placeholder="搜索你想要找的社区">
                <input type="submit">
            </form>
            <a href="">登录</a>
            <a href="">注册</a>
        </div>
    </div>
</header>
</body>
</html>
