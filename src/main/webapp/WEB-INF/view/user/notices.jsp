<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${notices}" var="notice" >
    <li class="list-group-item d-flex flex-column">
        <div class="d-flex">
            <a href="#">${notice.get("username")}:${notice.get("content")}</a>
            <span class="flex-grow-1 d-flex justify-content-end time">
                <fmt:formatDate value="${notice.get('time')}" pattern="yyyy-MM-dd"/>
            </span>
        </div>
        <div class="d-flex mt-3 text-secondary" style="font-size: 13px">
            回复我的帖子：
            <span>${notice.get("invitation")} > ${notice.get("community")}社区</span>
        </div>
    </li>
</c:forEach>