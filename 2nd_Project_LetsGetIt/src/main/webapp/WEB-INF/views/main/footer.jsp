<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/main.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/main.css" />
</head>
<body>
<footer>
	<div class="all">
		<div class="left">
			<div class="title">
				1577-1577	
			</div>
			<div class="content">
				<p>AM 10:00 ~ PM 05:00 Off-time PM 12:00 ~ PM 02:00 </p>
				<p>DAY OFF (SATURDAY. SUNDAY, HOLIDAY)</p>		
			</div>
		</div>
		<div class="right">
			<div class="title">
				<span>¡</span>Let's get it!	
			</div>
			<div class="content">
				<p>상호명:(주)함께해요 &nbsp;|&nbsp;  사업장소재지:서울특별시 강남구 선릉로93길 35 나라키움 역삼B빌딩  4층  &nbsp;|&nbsp;  팩스:070-8622-7737  &nbsp;|&nbsp; 사업자등록번호:101-86-64617  &nbsp;|&nbsp; 통신판매업신고:2019-서울강남-02774</p>
				<p>고객센터:1644-0560 평일 10:00 ~ 17:00 Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무)   &nbsp;|&nbsp;  이메일:customer@29cm.co.kr   &nbsp;|&nbsp;  대표이사:OOO   &nbsp;|&nbsp;  개인정보책임자:OOO &nbsp;|&nbsp;
				<c:if test="${empty admin && empty host && empty member }">
					<span><a href="${conPath }/adminLoginForm.do">admin</a></span>
				</c:if>
				</p>		
			</div>
		</div>
	</div>
</footer>
</body>
</html>