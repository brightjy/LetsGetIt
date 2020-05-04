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
<link href="${conPath }/css/activityPolicy.css" rel="stylesheet">
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="activityPolicy">
		<h3>액티비티 만들기</h3>
		<form action="activityInfo.do" method="post">
			<input type="hidden" name="actCno" value="${activity.actCno }">
			<input type="hidden" name="actName" value="${activity.actName }">
			<input type="hidden" name="actImg" value="${activity.actImg }">
			<input type="hidden" name="actPrice" value="${activity.actPrice }">
			<input type="hidden" name="actDiscount" value="${activity.actDiscount }">
			<input type="hidden" name="actAddress1" value="${activity.actAddress1 }">
			<input type="hidden" name="actAddress2" value="${activity.actAddress2 }">
			<input type="hidden" name="actInclude" value="${activity.actInclude }">
			<input type="hidden" name="actExclude" value="${activity.actExclude }">
			<input type="hidden" name="actMinMember" value="${activity.actMinMember }">
			<input type="hidden" name="actMaxMember" value="${activity.actMaxMember }">
			<input type="hidden" name="actOption" value="${activity.actOption }">
			<div id="left">
				<h3>준비물</h3>
				<textarea cols="20" rows="15" name="actSchedule" placeholder="준비물을 입력해주세요"></textarea>
				<h3>유의사항</h3>
				<textarea cols="20" rows="15" name="actPolicy" placeholder="유의사항을 입력해주세요" required="required"></textarea>
			</div>
			<div id="right">
				<ul>
					<li class="policy">
						준비물 예시
						<ul>
							<li>
								원데이 클래스에 필요한 도구
							</li>
							<li>
								필기도구
							</li>
							<li>
								필요한 복장
							</li>
							<li>
								신분증 및 자격증
							</li>
						</ul>
					</li>
					<li class="policy">
						유의사항 예시
						<ul>
							<li>
								수업 시작 5-10분 전 여유롭게 도착 부탁드립니다.
							</li>
							<li>
								날짜 변경은 3일 전까지 연락 부탁드립니다.
							</li>
							<li>
								오븐 앞에서 베이킹을 하므로 주의하시기 바랍니다.
							</li>
							<li>
								미성년자는 이용할 수 없습니다.
							</li>
							<li>
								우천으로 인한 취소 시 참가비는 전액 환불해 드립니다.
							</li>
							<li>
								참가자는 자전거를 타실 수 있는 분이어야 합니다.
							</li>
							<li>
								해당 액티비티에는 안전가이드가 동행합니다.
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