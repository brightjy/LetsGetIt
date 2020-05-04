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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $( function() {
	$('#start').val("${startTime}").prop("selected", true);
	$('#end').val("${endTime}").prop("selected", true);
  });
  </script>
<link href="${conPath }/css/actDateModify.css" rel="stylesheet">
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="activityDateModify">
		<h3>${activity.actName } 액티비티 일정수정</h3>
		<form action="actDateModify.do" method="post">
			<input type="hidden" name="eNo" value="${eNo }">
			<input type="hidden" name="actId" value="${actId }">
			<input type="hidden" name="hId" value="${hId }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table>
				<caption>일정</caption>
				<tr>
					<th colspan="2">일정 시작일</th>
					<th colspan="2">일정 종료일</th>
				</tr>
				<tr>
					<td>
						<input type="text" id="datepicker1" name="startDay" required="required" value="${startDate }">
					</td>
					<td>
						<select name="startTime" id="start">
							<c:forEach begin="0" end="23" var="i">
								<c:if test="${i < 10 }">
									<option value="<fmt:formatNumber value="${i }" pattern="00"/>:00:00">
										<fmt:formatNumber value="${i }" pattern="00"/>:00
									</option>
									<option value="<fmt:formatNumber value="${i }" pattern="00"/>:30:00">
										<fmt:formatNumber value="${i }" pattern="00"/>:30
									</option>
								</c:if>
								<c:if test="${i > 9 }">
									<option value="${i }:00:00">${i }:00</option>
									<option value="${i }:30:00">${i }:30</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td>
						<input type="text" id="datepicker2" name="endDay" required="required" value="${endDate }">
					</td>
					<td>
						<select name="endTime" id="end">
							<c:forEach begin="0" end="23" var="i">
								<c:if test="${i < 10 }">
									<option value="<fmt:formatNumber value="${i }" pattern="00"/>:00:00">
										<fmt:formatNumber value="${i }" pattern="00"/>:00
									</option>
									<option value="<fmt:formatNumber value="${i }" pattern="00"/>:30:00">
										<fmt:formatNumber value="${i }" pattern="00"/>:30
									</option>
								</c:if>
								<c:if test="${i > 9 }">
									<option value="${i }:00:00">${i }:00</option>
									<option value="${i }:30:00">${i }:30</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4" id="b">
						<div id="btn">
							<input class="btn" type="submit" value="일정 수정">
							<input class="btn" type="button" value="취소" onclick="history.go(-1)">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker1" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년',
    	showOtherMonths : true,
    	changeYear: true,
    	minDate : 0,
    	dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
    	onSelect: function(selected) {
    		$("#datepicker2").datepicker("option","minDate", selected)
    	}
    });
	$( "#datepicker2" ).datepicker({
		dateFormat : 'yy-mm-dd',
    	monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년',
    	showOtherMonths : true,
    	changeYear: true,
    	minDate : 0,
    	dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
    	onSelect: function(selected) {
    		$("#datepicker1").datepicker("option","maxDate", selected)
    	}
    });
  });
  </script>
</body>
</html>