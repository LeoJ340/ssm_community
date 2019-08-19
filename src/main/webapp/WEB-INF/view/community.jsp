<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>XX社区</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
</head>
<body>
<%@include file="header.jsp"%>
<main class="container mt-3">
    <div class="bg-light pl-3 pr-3 pt-3 mt-2">
        <div class="border bg-transparent">
            <h5>XX社区</h5>
            <p>简介</p>
        </div>
        <ul>
            <li class="d-flex flex-column border-bottom">
                <span><a href="#">xx社区</a></span>
                <span><a href="#">XXXXXXXXXXXXX</a></span>
                <span class="d-flex justify-content-end">xxx 2019-8-9</span>
            </li>
        </ul>
        <form method="post" action="">
            <input type="text" maxlength="50" placeholder="请输入标题" class="w-100 pl-3 mt-3 mb-3 title" name="title" />
            <div id="contentEidtor"></div>
            <textarea name="content" id="content" style="width: 100%;height: 75px"></textarea>
            <button type="submit" name="method" value="publish" class="mt-3 btn btn-danger">发表</button>
        </form>
    </div>
</main>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/wangEditor/wangEditor.min.js"></script>
<script>
    const E = window.wangEditor;
    const editor = new E('#contentEidtor');
    const $text1 = $('#content');
    editor.customConfig.onchange = function(html) {
        $text1.val(html)
    };
    editor.create();
    $text1.val(editor.txt.html())
</script>
</body>
</html>
