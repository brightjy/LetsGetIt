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
<link href="${conPath }/css/activityClude.css" rel="stylesheet">
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="activityClude">
		<h3>액티비티 만들기</h3>
		<form action="activityPolicy.do" method="post">
			<input type="hidden" name="actCno" value="${activity.actCno }">
			<input type="hidden" name="actName" value="${activity.actName }">
			<input type="hidden" name="actImg" value="${activity.actImg }">
			<input type="hidden" name="actPrice" value="${activity.actPrice }">
			<input type="hidden" name="actDiscount" value="${activity.actDiscount }">
			<input type="hidden" name="actAddress1" value="${activity.actAddress1 }">
			<input type="hidden" name="actAddress2" value="${activity.actAddress2 }">
			<input type="hidden" name="actMinMember" value="${activity.actMinMember }">
			<input type="hidden" name="actMaxMember" value="${activity.actMaxMember }">
			<input type="hidden" name="actOption" value="${activity.actOption }">
			<div id="left">
				<h3>포함사항</h3>
				<textarea name="actInclude" placeholder="포함사항을 입력해주세요" required="required"></textarea>
				<h3>불포함사항</h3>
				<textarea name="actExclude" placeholder="불포함사항을 입력해주세요" required="required"></textarea>
			</div>
			<div id="right">
				<ul>
					<li id="clude">
						액티비티 상세 페이지에 나올 포함/불포함사항을 입력해주세요
					</li>
					<li>&nbsp;</li>
					<li>
						예시
						<ul>
							<li class="space">
								가이드비 / 장비 대여비 / 장소 이용료 / 안전 보험료 / 차량 / 식사 / 입장료
							</li>
							<li class="space">
								물 / 간식 / 주차장 / 간식비 / 탈의실 / 샤워실 / 운동복 / 짐 보관 / 숙소
							</li>
							<li class="space">
								픽업 / 리프트권 / 행동식 / 기념품 / 안주 / 음료 / 완주증
							</li>
							<li class="space">
								기록 측정 / 운동화 / 기사비 / 차량 보험료 / 교재비 / 컨설팅 등
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="btn">
				<input class="btn" type="button" value="이전" onclick="history.go(-1)">
				<input class="btn" type="submit" value="다음">
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>