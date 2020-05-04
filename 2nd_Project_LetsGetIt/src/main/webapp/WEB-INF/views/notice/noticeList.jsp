<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/hostQna.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
});
function trClicked(nNo){
	location.href='${conPath}/noticeDetail.do?nNo='+nNo+'&pageNum=${paging.currentPage}';
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="qnaList">
		<div id="wrap">
			<div id="title">
				공지사항
			</div>
			<c:if test="${not empty amdin}">
				<div id="write">
					<button id="writeBtn" onclick="location.href='${conPath}/hostqnaWriteForm.do'">글 작성</button>
				</div>
			</c:if>
				<div>
					<span>
						<a href="${conPath }/noticeAllList.do">전체</a>
					</span> 
					<span>
						<a href="${conPath }/noticeList.do">공지</a>
						</span>
					<span>
						<a href="${conPath }/noticeEventList.do">이벤트</a>
					</span> 
					<span>
						<a href="${conPath }/announcementList.do">발표</a>
					</span>
				</div>
				<div id="list">
				<c:set var="iNum" value="${paging.inverseNum }"/>
				<table>
					<tr>
						<td class="title" id="nNo">
							type.
						</td>
						<td class="title" id="hostqnaTitle">
							제목
						</td>
						<td class="title" id="hostqnaRdate">
							작성일
						</td>
					</tr>
					<c:if test="${paging.total==0 }">
						<tr>
							<td colspan="3">
								작성된 글이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${paging.total!=0 }">
						<c:forEach var="nList" items="${nList }" >
							<tr onclick="trClicked(${nList.nNo})"> 
								<td class="content">
									${nList.nType }
								</td>
								<td class="content">
									${nList.nTitle }
								</td>
								<td class="content">
									<fmt:formatDate value="${nList.nRdate }"
										pattern="YY/MM/dd(E)"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div id="paging">
				<c:if test="${paging.startPage>paging.blockSize }">
					<a href="${conPath }/noticeList.do?pageNum=${paging.startPage-1}">
						<span class="next">〈</span>				
					</a>
				</c:if>
				<c:forEach var ="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<span id="currentPage">${i }</span>				
					</c:if>
					<c:if test="${paging.currentPage!=i }">
						<a href="${conPath }/noticeList.do?pageNum=${i}">
							<span>${i }</span>
						</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					<a href="${conPath }/noticeList.do?pageNum=${paging.endPage+1}">
						<span class="next">〉</span>			
					</a>
				</c:if>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>