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
<%-- <link href="${conPath}/css/activity.css" rel="stylesheet"> --%>
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){	
		$(document).ready(function(){
			$('#actCategory2').change(function() {
				var category2 = $('#actCategory2').val();
				location.href='${conPath}/activityCategory.do?actCategory=${param.actCategory}&actCategory2='+category2;
			});
			$('#actCategory3').change(function() {
				var category3 = $('#actCategory3').val();
				location.href='${conPath}/activityCategory.do?actCategory=${param.actCategory}&actCategory2=${param.actCategory2}&actCategory3='+category3;
			});
			$('#actCategory4').change(function() {
				var category4 = $('#actCategory4').val();
				location.href='${conPath}/activityCategory.do?actCategory=${param.actCategory}&actCategory2=${param.actCategory2}&actCategory3=${param.actCategory3}&actCategory4='+category4;
			});
		});
	});
</script>
<link href="${conPath }/css/activityWrite.css" rel="stylesheet">
<script>
$(function () {
	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	var actCategory = getParameterByName('actCategory');
	if(actCategory=="일상") {
		$('#c1').css({
		    color:"#52A4DA",
	    	border:"1px solid #52A4DA"
		});
	} else if(actCategory=="여행") {
		$('#c2').css({
		    color:"#52A4DA",
		    border:"1px solid #52A4DA"
		});
	}
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="activityWrite">
		<h3>액티비티 만들기</h3>
		<form action="${conPath }/activityTitle.do" method="post" onsubmit="return chk()">
			<input type="hidden" name="actCategory" id="actCategory" value="${param.actCategory }">
			<div id="left">
				<p>카테고리를 선택해 주세요.</p>
				<div class="category" id="c1" onclick="location.href='${conPath}/activityCategory.do?actCategory=일상'">
					일상<br>
					<p class="text">
						일상 속에서 경험할 수 있는<br>
						원데이클래스, 액티비티 등
					</p>
				</div>
				<div class="category" id="c2" onclick="location.href='${conPath}/activityCategory.do?actCategory=여행'">
					여행<br>
					<p class="text">
						가이드 투어, 서핑/스키,<br>
						여행 관련 통신/교통/입장권 등
					</p>
				</div><br>
				<b>세부 카테고리</b><br>
				<select name="actCategory2" id="actCategory2" required>
						<option value="" selected disabled hidden>2차 카테고리</option>
						<c:forEach items="${aCategory2 }" var="category">
							<c:if test="${category.actCategory2.equals(param.actCategory2) }">
								<option value="${category.actCategory2 }" selected="selected">${category.actCategory2 }</option>
							</c:if>
							<c:if test="${!category.actCategory2.equals(param.actCategory2) }">
								<option value="${category.actCategory2 }">${category.actCategory2 }</option>
							</c:if>
						</c:forEach>
				</select>
				<select name="actCategory3" id="actCategory3" required>
						<option value="" selected disabled hidden>3차 카테고리</option>
						<c:forEach items="${aCategory3 }" var="category">
							<c:if test="${category.actCategory3.equals(param.actCategory3) }">
								<option value="${category.actCategory3 }" selected="selected">${category.actCategory3 }</option>
							</c:if>
							<c:if test="${!category.actCategory3.equals(param.actCategory3) }">
								<option value="${category.actCategory3 }">${category.actCategory3 }</option>
							</c:if>
						</c:forEach>
				</select>
				<select name="actCategory4" id="actCategory4" required>
						<option value="" selected disabled hidden>4차 카테고리</option>
						<c:forEach items="${aCategory4 }" var="category">
							<c:if test="${category.actCategory4.equals(param.actCategory4) }">
								<option value="${category.actCategory4 }" selected="selected">${category.actCategory4 }</option>
							</c:if>
							<c:if test="${!category.actCategory4.equals(param.actCategory4) }">
								<option value="${category.actCategory4 }">${category.actCategory4 }</option>
							</c:if>
						</c:forEach>
				</select>
				<c:if test='${aCategory5 != null }'>
					<select name="actCategory5" id="actCategory5" required>
						<option value="" selected disabled hidden>5차 카테고리</option>
						<c:forEach items="${aCategory5 }" var="category">
							<option value="${category.actCategory5 }">${category.actCategory5 }</option>
						</c:forEach>
					</select>
				</c:if>
			</div>
			<div id="right">
				<ul>
					<li>
						다음과 같은 경우, 오픈이 어렵습니다.
						<ul>
							<li>
								소개팅 / 남녀 만남 주선 클래스
							</li>
							<li>
								드라이브, 안전이 보장되지 않은 장소에서 진행하는 클래스
							</li>
							<li>
								개인 판매 또는 타 플랫폼과 금액 차이가 나는 클래스
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="btn">
				<input class="btn" type="button" value="이전" onclick="location.href='${conPath}/main.do'">
				<input class="btn" type="submit" value="다음">
			</div>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>