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
<style>
	#couponPayments {
		width:900px;
		height:729px;
		margin:0 atuo;
	}
	#couponPayments h2 {
		margin:30px;
	}
	#couponPayments table {
		margin:30px auto;
		width:500px;
	}
	#couponPayments table caption {
		font-size:1.3em;
		font-weight:bold;
	}
	#couponPayments table tr th {
		margin:20px 0;
		width:300px;
		height:40px;
		line-height:40px;
		font-weight:bold;
		font-size:1.1em;
		text-align:center;
	}
	#couponPayments table tr td {
		width:300px;
		height:40px;
		text-align:center;
		font-size:0.9em;
	}
	#couponPayments table tr .long {
		width:750px;
	}
	#couponPayments table tr td input {
		width:200px;
		height:35px;
		line-height:35px;
		font-size:1.1em;
		margin:10px;
		padding-left:10px;
	}
	#couponPayments table tr td select {
		width:200px;
		height:30px;
		line-height:30px;
		text-align:center;
		padding-left:10px;
	}
	#couponPayments table tr td #btn .btn {
		text-align:center;
		font-size:1.1em;
		width:180px;
		height:40px;
		line-height:40px;
		cursor:pointer;
		padding:0;
		margin-top:30px;
	}
	#couponPayments table tr td #btn input[type=submit] {
		background-color:black;
		color:white;
	}
</style>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="couponPayments">
		<h2>쿠폰 지급</h2>
		<table>
			<tr>
				<th>순차번호</th>
				<th>일련번호</th>
				<th class="long">쿠폰 이름</th>
				<th>할인율</th>
				<th>유효기간</th>
			</tr>
			<tr>
				<td>${coupon.cId }</td>
				<td>${coupon.cCode }</td>
				<td class="long">${coupon.cName }</td>
				<td>${coupon.cDiscount }%</td>
				<c:if test="${coupon.cDate == 1 }">
					<td>1개월</td>
				</c:if>
				<c:if test="${coupon.cDate == 2 }">
					<td>3개월</td>
				</c:if>
				<c:if test="${coupon.cDate == 3 }">
					<td>6개월</td>
				</c:if>
				<c:if test="${coupon.cDate == 4 }">
					<td>1년</td>
				</c:if>
				<c:if test="${coupon.cDate == 5 }">
					<td>무기한</td>
				</c:if>
			</tr>
		</table>
		<form action="${conPath }/couponPayments.do" method="post">
			<input type="hidden" name="cId" value="${coupon.cId }">
			<input type="hidden" name="cDate" value="${coupon.cDate }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<tr>
					<th>지급 대상</th>
					<td>
						<select name="mId">
							<option value="1">전체회원</option>
							<option value="2">생일자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="btn">
							<input class="btn" type="submit" value="쿠폰 지급">
							<input class="btn" type="button" value="취소" onclick="history.go(-1)">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>