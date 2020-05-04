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
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){	
		
	});
</script>
<link href="${conPath }/css/activityCheckList.css" rel="stylesheet">
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="activityCheckList">
		<h2>예약 관리</h2>
		<c:if test="${checkList == '[]' }">
			<div id="none">
				<p>종료일이 지난 액티비티가 존재하지 않습니다</p>
			</div>
		</c:if>
		<table>
			<c:forEach items="${checkList }" var="list">
				<tr onclick="location.href='${conPath}/activityCheck.do?eNo=${list.eNo }&pageNum=${paging.currentPage }&hId=${list.hId }'">
					<td class="img">
						<img src="${conPath }/actImg/${list.actImg}">
					</td>
					<td class="name">
						${list.actName }<br>
						<fmt:formatDate value="${list.actStartdate }" pattern="yyyy-MM-dd"/> - 
						<fmt:formatDate value="${list.actEnddate }" pattern="yyyy-MM-dd"/>
					</td>
					<td class="right">
						>
					</td>
				</tr>
			</c:forEach>
		</table>
		<button id="btn" onclick="location.href='${conPath}/main.do'">뒤로가기</button>
		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize }">
				[ <a href="${conPath }/myActivityCheckList.do?hId=${host.hId }&pageNum=${paging.startPage-1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					[ <b> ${i }</b> ]
				</c:if>
				<c:if test="${paging.currentPage!=i }">
					[ <a href="${conPath }/myActivityCheckList.do?hId=${host.hId }&pageNum=${i}"> ${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/myActivityCheckList.do?hId=${host.hId }&pageNum=${paging.endPage+1}">다음</a> ]
			</c:if>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>