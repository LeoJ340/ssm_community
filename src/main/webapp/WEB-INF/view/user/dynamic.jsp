<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${dynamics}" var="dynamic" >
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