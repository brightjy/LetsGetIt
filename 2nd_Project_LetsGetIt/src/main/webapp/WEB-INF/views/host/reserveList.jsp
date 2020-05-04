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
<link href="${conPath }/css/reserveList.css" rel="stylesheet">
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="activityReserveList">
		<h2>예약자 확인</h2>
		<table id="date">
			<tr>
				<th>예약자명</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>예약날짜</th>
			</tr>
			<c:if test='${reserve == "[]"}'>
				<tr>
					<td colspan="4">
						예약인원이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test='${reserve != "[]" }'>
				<c:forEach items="${reserve }" var="list">
					<tr>
						<td>${list.mName }</td>
						<td>
							<fmt:formatDate value="${list.mBirth }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							${list.mPhone }
						</td>
						<td>
							<fmt:formatDate value="${list.arRdate }" pattern="yyyy-MM-dd"/>
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