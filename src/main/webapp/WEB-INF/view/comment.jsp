<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card card-body">
    <ul>
        <c:forEach items="${comments.list}" var="comment">
            <li class="row">
                <span>
                    <a class="text-primary">${comment.username}</a>:
                    <c:if test="${comment.cforId!=comment.cinId}">
                        回复<a class="text-primary">${comment.cforUsername}</a> :
                    </c:if>
                        ${comment.content}
                </span>
                <div class="flex-grow-1 d-flex justify-content-end mr-3">
                    <span class="time"><fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd hh:mm"/></span>
                    <a class="ml-1 time" onclick="toCommentFor(${cinId},${comment.id},'${comment.username}')" href="javascript:void(0)">回复</a>
                </div>
            </li>
        </c:forEach>
    </ul>
    <c:if test="${!empty comments.list && comments.list.size() > 0}">
        <nav aria-label="Page navigation example" class="mt-3 ml-4 mb-1">
            <ul class="pagination pagination-sm">
                <c:choose>
                    <c:when test="${comments.prePage < 1}">
                        <li class="page-item disabled" data-toggle="tooltip" data-placement="left" title="没有上一页">
                            <a class="page-link" aria-label="Previous" href="javascript:void(0)">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" onclick="showComment(${cinId},${comments.prePage},null)" aria-label="Previous" href="javascript:void(0)">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="index" begin="1" end="${comments.pages}">
                    <c:choose>
                        <c:when test="${index eq comments.pageNum}">
                            <li class="page-item active"><a class="page-link" onclick="showComment(${cinId},${index},null)" href="javascript:void(0)">${index}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" onclick="showComment(${cinId},${index},null)" href="javascript:void(0)">${index}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${comments.pageNum >= comments.nextPage}">
                        <li class="page-item disabled" data-toggle="tooltip" data-placement="right" title="没有下一页">
                            <a class="page-link" aria-label="Next" href="javascript:void(0)">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" onclick="showComment(${cinId},${comments.nextPage},null)" aria-label="Next" href="javascript:void(0)">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </c:if>
    <form>
        <span></span>
        <textarea rows="1" maxlength="100" class="w-100 mt-1 mb-1"></textarea>
        <input name="publishButton" type="button" value="回复" onclick="publishComment(${cinId})">
    </form>
</div>