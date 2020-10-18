<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${invitations}" var="invitation" >
    <li class="list-group-item d-flex flex-column">
        <a>${invitation.invitationTitle}</a>
        <p class="time text-secondary m-0">
            回复于${invitation.communityName}社区
            &nbsp&nbsp
            <fmt:formatDate value="${invitation.time}" pattern="yyyy-MM-dd"/>
        </p>
    </li>
</c:forEach>