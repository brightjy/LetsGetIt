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
<link href="${conPath}/css/member.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<link href="${conPath }/css/couponList.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="couponList">
		<h2>쿠폰 리스트</h2>
		<c:if test="${couponList != '[]' }">
			<table>
				<tr>
					<th class="shot">순차번호</th>
					<th class="long">쿠폰명</th>
					<th class="mid">유효기간</th>
					<th class="mid">사용여부</th>
				</tr>
			<c:forEach items="${couponList }" var="coupon">
				<tr>
					<td class="shot">
						${coupon.mcNo }
					</td>
					<td class="name">
						${coupon.cName }
					</td>
					<td class="mid">
						<fmt:formatDate value="${coupon.mcDate }" pattern="yyyy-MM-dd"/>
					</td>
					<td class="mid">
						사용가능
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
		<c:if test="${couponList == '[]'}">
			<table>
				<tr>
					<th class="shot">순차번호</th>
					<th class="long">쿠폰명</th>
					<th class="mid">유효기간</th>
					<th class="mid">사용여부</th>
				</tr>
				<tr>
					<td colspan="4" id="none">
						사용가능한 쿠폰이 없습니다
					</td>
				</tr>
			</table>
		</c:if>
		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize }">
				[ <a href="${conPath }/couponList.do?pageNum=${paging.startPage-1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					[ <b> ${i }</b> ]
				</c:if>
				<c:if test="${paging.currentPage!=i }">
					[ <a href="${conPath }/couponList.do?pageNum=${i}"> ${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/couponList.do?pageNum=${paging.endPage+1}">다음</a> ]
			</c:if>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>