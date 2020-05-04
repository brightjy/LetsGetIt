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
<link href="${conPath }/css/activityReserve.css" rel="stylesheet">
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="activityReserveList">
		<h2>일정 확인</h2>
		<table>
			<tr>
				<th>액티비티명</th>
				<th>최소참여인원</th>
				<th>최대참여인원</th>
			</tr>
			<tr>
				<td>${activity.actName }</td>
				<td>${activity.actMinMember }명</td>
				<td>${activity.actMaxMember }명</td>
			</tr>
		</table>
		<table id="date">
			<tr>
				<th>액티비티 시작일</th>
				<th>액티비티 종료일</th>
				<th>예약인원 확인</th>
			</tr>
			<c:if test='${activityDate == "[]" }'>
				<tr>
					<td colspan="3">
						액티비티 일정이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test='${activityDate != "[]" }'>
				<c:forEach items="${activityDate }" var="date">
					<tr>
						<td>
							<fmt:formatDate value="${date.actStartdate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<fmt:formatDate value="${date.actEnddate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<button onclick="location.href='${conPath}/reserveList.do?eNo=${date.eNo }&pageNum=${param.pageNum }'">예약인원 확인</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<button id="btn" onclick="history.go(-1)">뒤로가기</button>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>