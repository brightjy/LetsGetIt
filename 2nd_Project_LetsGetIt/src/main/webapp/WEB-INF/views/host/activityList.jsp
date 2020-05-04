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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<link href="${conPath }/css/activityList.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty activityDate }">
	<script>
		alert('${activityDate}');
	</script>
</c:if>
<c:if test="${not empty activityModify }">
	<script>
		alert('${activityModify}');
	</script>
</c:if>
<c:if test="${not empty activityDelete }">
	<script>
		alert('${activityDelete}');
	</script>
</c:if>
<c:if test="${not empty errorMsg }">
	<script>
		alert('${errorMsg}');
		history.go(-1);
	</script>
</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="activityList">
		<h2>내 액티비티</h2>
		<c:forEach items="${ActivityList }" var="act">
			<div class="activity">
				<img src="${conPath }/actImg/${act.actImg}" alt="대표 이미지"><br>
				<p class="name">${act.actName }</p>
				<div class="price">
					<span class="left">${act.actOption }</span>
					<span class="right"><fmt:formatNumber value="${act.actPrice }" pattern="#,###" />원</span>
				</div>
				<div class="con">
					<span class="left">액티비티 관리</span>
					<span class="right">
						<a href="${conPath }/activityModifyForm.do?actId=${act.actId}&hId=${act.hId}&pageNum=${paging.currentPage}">수정</a>
						<a href="${conPath }/activityDelete.do?actId=${act.actId}&hId=${act.hId}&pageNum=${paging.currentPage}">삭제</a>
					</span>
				</div>
				<div class="con">
					<span class="left">일정 관리</span>
					<span class="right">
						<a href="${conPath }/activityDateWriteForm.do?hId=${act.hId}&actId=${act.actId}&pageNum=${paging.currentPage}">추가</a>
						<a href="${conPath }/activityDateModifyForm.do?hId=${act.hId}&actId=${act.actId}&pageNum=${paging.currentPage}">수정</a>
					</span>
				</div>
			</div>
		</c:forEach>
		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize }">
				[ <a href="${conPath }/hostActivityList.do?hId=${hId }&pageNum=${paging.startPage-1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					[ <b> ${i }</b> ]
				</c:if>
				<c:if test="${paging.currentPage!=i }">
					[ <a href="${conPath }/hostActivityList.do?hId=${hId }&pageNum=${i}"> ${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/hostActivityList.do?hId=${hId }&pageNum=${paging.endPage+1}">다음</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>