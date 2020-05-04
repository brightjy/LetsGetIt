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
<link href="${conPath}/css/host.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<link href="${conPath }/css/activityReserveList.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="activityReserveList">
		<h2>예약 관리</h2>
		<table>
			<c:forEach items="${ActivityList }" var="activity">
				<tr onclick="location.href='${conPath}/activityReserve.do?actId=${activity.actId }&pageNum=${paging.currentPage }'">
					<td class="img">
						<img src="${conPath }/actImg/${activity.actImg}">
					</td>
					<td class="name">
						${activity.actName }
					</td>
					<td class="right">
						>
					</td>
				</tr>
			</c:forEach>
		</table>
		<button id="btn" onclick="history.go(-1)">뒤로가기</button>
	</div>
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize }">
			[ <a href="${conPath }/myActivityReserveList.do?hId=${host.hId }&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentPage!=i }">
				[ <a href="${conPath }/myActivityReserveList.do?hId=${host.hId }&pageNum=${i}"> ${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a href="${conPath }/myActivityReserveList.do?hId=${host.hId }&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>