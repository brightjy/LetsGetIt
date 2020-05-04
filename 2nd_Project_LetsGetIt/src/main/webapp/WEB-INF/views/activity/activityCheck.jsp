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
<link href="${conPath }/css/activityCheck.css" rel="stylesheet">
<body>
	<jsp:include page="../main/header.jsp" />
	<jsp:useBean id="now" class="java.util.Date" />
	<div id="activityCheck">
		<h3>액티비티 만들기</h3>
		<form action="activityWrite.do" method="post">
			<input type="hidden" name="actCno" value="${activity.actCno }">
			<input type="hidden" name="actName" value="${activity.actName }">
			<input type="hidden" name="actImg" value="${activity.actImg }">
			<input type="hidden" name="hId" value="${activity.hId }">
			<input type="hidden" name="actInfo" value='${activity.actInfo }'>
			<input type="hidden" name="actPrice" value="${activity.actPrice }">
			<input type="hidden" name="actDiscount" value="${activity.actDiscount }">
			<input type="hidden" name="actAddress1" value="${activity.actAddress1 }">
			<input type="hidden" name="actAddress2" value="${activity.actAddress2 }">
			<input type="hidden" name="actSchedule" value="${activity.actSchedule }">
			<input type="hidden" name="actPolicy" value="${activity.actPolicy }">
			<input type="hidden" name="actInclude" value="${activity.actInclude }">
			<input type="hidden" name="actExclude" value="${activity.actExclude }">
			<input type="hidden" name="actMinMember" value="${activity.actMinMember }">
			<input type="hidden" name="actMaxMember" value="${activity.actMaxMember }">
			<input type="hidden" name="actOption" value="${activity.actOption }">
			<div>
				<div id="left">
					<p id="title">최종 확인</p>
					<div id="content">
						<img src="${conPath }/actImg/${activity.actImg}" alt="대표이미지"><br>
						<p id="name">${activity.actName }</p>
						<p id="price"><fmt:formatNumber value="${activity.actPrice }" pattern="#,###" />원</p>
						<hr color="lightgray">
						<p class="like">0명이 좋아한 액티비티</p>
						<p class="like"><fmt:formatDate value="${now }" pattern="yyyy-MM-dd hh:mm"/>외 0개의 일정</p>
						<p class="like">${activity.actAddress2 }</p>
						<p class="like">액티비티 평점 ${activity.actGrade }</p>
						<hr color="lightgray">
						<h5>호스트</h5>
						<b class="host">호스트이름</b>
						<p class="host" id="self">호스트 소개글</p>
						<p id="button">호스트 프로필</p>
						<hr color="lightgray">
						<h5>호스트 후기</h5>
						<p id="review">아직 후기가 없습니다</p>
						<hr color="lightgray">
						<h5>액티비티 소개</h5>
						<div id="write_area">${activity.actInfo }</div>
						<hr color="lightgray">
						<h5>포함 사항</h5>
						<pre>${activity.actInclude }</pre>
						<hr color="lightgray">
						<h5>불포함 사항</h5>
						<pre>${activity.actExclude }</pre>
						<hr color="lightgray">
						<h5>준비물</h5>
						<pre>${activity.actSchedule }</pre>
						<hr color="lightgray">
						<h5>유의사항</h5>
						<pre>${activity.actPolicy }</pre>
						<br>
					</div>
				</div>
				<div id="right">
					사이트에서 보이는 상품 상세 레이아웃입니다.<br>
					입력한 사항을 최종 확인해 주세요.
				</div>
				<div id="btn">
					<input class="btn" type="button" value="이전" onclick="history.go(-1)">
					<input class="btn" type="submit" value="액티비티 생성">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>