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
  $( function() {
    
  });
  </script>
<link href="${conPath }/css/activityDateModify.css" rel="stylesheet">
<body>
	<c:if test="${not empty activityDate }">
		<script>
			alert('${activityDate}');
		</script>
	</c:if>
	<c:if test="${not empty errorMsg }">
		<script>
			alert('${errorMsg}');
			history.go(-1);
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="activityDateModify">
		<h3>액티비티 일정 수정</h3>
		<table>
			<caption>일정</caption>
			<tr>
				<th>일정 시작일</th>
				<th>일정 종료일</th>
				<th>일정 관리</th>
			</tr>
			<c:if test="${actDate eq '[]' }">
				<tr>
					<td colspan="3">등록된 일정이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${actDate ne '[]' }">
				<c:forEach items="${actDate }" var="date">
					<tr>
						<td>
							<fmt:formatDate value="${date.actStartdate }" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td>
							<fmt:formatDate value="${date.actEnddate }" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td>
							<button class="btn" onclick='location.href="${conPath}/activityDateModify.do?eNo=${date.eNo }&actId=${date.actId }&hId=${hId }&pageNum=${pageNum }"'>일정 수정</button>
							<button class="btn" onclick='location.href="${conPath}/activityDateDelete.do?eNo=${date.eNo }&actId=${date.actId }&hId=${hId }&pageNum=${pageNum }"'>일정 삭제</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div id="btn">
			<button onclick='location.href="${conPath}/hostActivityList.do?hId=${hId }&pageNum=${pageNum }"'>내 액티비티 리스트</button>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>