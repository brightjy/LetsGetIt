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
<link href="${conPath}/css/admin.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<style>
	#couponList {
		width:700px;
		height:699px;
		margin:0 auto;
	}
	#couponList h2 {
		text-align:center;
		margin:30px 0;
	}
	#couponList table tr {
		border:1px solid lightgray;
		text-align:center;
	}
	#couponList table tr .shot {
		width:100px;
		height:40px;
		line-height:40px;
	}
	#couponList table tr .mid {
		width:100px;
	}
	#couponList table tr .long {
		width:400px;
		height:40px;
		line-height:40px;
	}
	#couponList table tr .name {
		width:400px;
		height:40px;
		line-height:40px;
		text-align:left;
		padding-left:10px;
	}
	#paging {
		width:700px;
		margin:0 auto;
		text-align:center;
	}
</style>
</head>
<body>
<c:if test="${not empty couponWrite }">
	<script>
		alert('${couponWrite}');
	</script>
</c:if>
<c:if test="${not empty couponModify }">
	<script>
		alert('${couponModify}');
	</script>
</c:if>
<c:if test="${not empty couponDelete }">
	<script>
		alert('${couponDelete}');
	</script>
</c:if>
<c:if test="${not empty couponPayments }">
	<script>
		alert('${couponPayments}');
	</script>
</c:if>
<c:if test="${not empty errorMsg }">
	<script>
		alert('${errorMsg}');
		history.go(-1);
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
	<div id="couponList">
		<h2>쿠폰 리스트</h2>
		<table>
			<tr>
				<th class="shot">순차번호</th>
				<th class="mid">일련번호</th>
				<th class="long">쿠폰명</th>
				<th class="shot">할인율</th>
				<th class="shot">유효기간</th>
				<th class="mid">쿠폰 관리</th>
			</tr>
		<c:forEach items="${couponList }" var="coupon">
			<tr>
				<td class="shot">
					${coupon.cId }
				</td>
				<td class="mid">
					${coupon.cCode }				
				</td>
				<td class="name">
					${coupon.cName }
				</td>
				<td class="shot">
					${coupon.cDiscount }
				</td>
				<td class="shot">
					<c:if test="${coupon.cDate == 1 }">1개월</c:if>
					<c:if test="${coupon.cDate == 2 }">3개월</c:if>
					<c:if test="${coupon.cDate == 3 }">6개월</c:if>
					<c:if test="${coupon.cDate == 4 }">1년</c:if>
					<c:if test="${coupon.cDate == 5 }">무기한</c:if>
				</td>
				<td class="mid">
					<a class="btn" href="${conPath }/couponModifyForm.do?cId=${coupon.cId}&pageNum=${paging.currentPage}">쿠폰 수정</a><br>
					<a class="btn" href="${conPath }/couponDelete.do?cId=${coupon.cId}&pageNum=${paging.currentPage}">쿠폰 삭제</a><br>
					<a class="btn" href="${conPath }/couponPaymentsForm.do?cId=${coupon.cId}&pageNum=${paging.currentPage}">쿠폰 지급</a>
				</td>
			</tr>
		</c:forEach>
		</table>
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