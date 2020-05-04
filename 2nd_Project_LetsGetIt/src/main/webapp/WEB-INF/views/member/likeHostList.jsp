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
<link href="${conPath}/css/likeHostList.css" rel="stylesheet">
<link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
});
function trClicked(hId){
	location.href='${conPath }/hostDetail.do?hId='+hId+'&pageNum=${paging.currentPage}';
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div id="activityAllList">
	<div id="title">
		<span>내가 좋아한 호스트</span>
		<span id="total">${paging.total }</span>
	</div>
	<div id="list">
		<table>
		<c:if test="${paging.total==0 }">
			<tr>
				<td colspan="4">
					좋아한 호스트가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${paging.total!=0 }">
		<c:forEach var="host" items="${memberLikeHostList }">
			<tr onclick="trClicked('${host.hId}')">
				<td id="hPhoto">
					<c:if test="${empty host.hPhoto}">
						<img src="${conPath }/upload/hPhotoDefault120x120.jpg" alt="호스트이미지">
					</c:if>
					<c:if test="${not empty host.hPhoto}">
						<img src="${conPath }/upload/${host.hPhoto}" alt="호스트이미지">
					</c:if>			
				</td>
				<td id="hName">
					${host.hName }
				</td>
				<td id="hEmail">
					${host.hEmail }
				</td>
				<td id="hPhone">
					${host.hPhone }
				</td>
			</tr>			
		</c:forEach>
		</c:if>		
		</table>
	</div>
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize }">
			<a href="${conPath }/memberlikeHostList.do?pageNum=${paging.startPage-1}">
				<span class="next">〈</span>				
			</a>
		</c:if>
		<c:forEach var ="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				<span id="currentPage">${i }</span>				
			</c:if>
			<c:if test="${paging.currentPage!=i }">
				<a href="${conPath }/memberlikeHostList.do?pageNum=${i}">
					<span>${i }</span>
				</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/memberlikeHostList.do?pageNum=${paging.endPage+1}">
				<span class="next">〉</span>			
			</a>
		</c:if>
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>