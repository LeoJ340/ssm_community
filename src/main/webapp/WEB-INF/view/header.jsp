<%@ page contentType="text/html;charset=UTF-8"%>
<header class="bg-dark container">
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark rounded">
        <a class="navbar-brand mr-auto mr-lg-0" href="${pageContext.request.contextPath}/">首页</a>
        <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <form class="form-inline my-2 my-lg-0 ml-auto" action="${pageContext.request.contextPath}/search">
                <input class="form-control mr-sm-2" type="text" placeholder="搜索你想要找的社区" aria-label="Search">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">搜索</button>
            </form>
            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${sessionScope.userStatus}">
                        <li class="nav-item active dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="userInfo"
                               data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">${sessionScope.username}</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userInfo">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/${sessionScope.userId}">个人中心</a>
                                <a class="dropdown-item" href="#">
                                    收到回复
                                </a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">注销</a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/register">注册</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</header>
