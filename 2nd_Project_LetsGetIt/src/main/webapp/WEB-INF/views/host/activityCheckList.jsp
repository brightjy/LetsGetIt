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
<link href="${conPath}/css/host.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<link href="${conPath }/css/activityCheckListForm.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty check }">
	<script>
		alert('${check}');
	</script>
</c:if>
<c:if test="${not empty errorMsg }">
	<script>
		alert('${errorMsg}');
		history.go(-1);
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
	<div id="activityCheckList">
		<h2>예약자 확인</h2>
		<table id="date">
			<tr>
				<th>예약자명</th>
				<th>생년월일</th>
				<th class="tel">연락처</th>
				<th>예약날짜</th>
				<th>상태</th>
				<th>출석체크</th>
			</tr>
			<c:if test='${checkList == "[]"}'>
				<tr>
					<td colspan="6">
						예약인원이 없습니다
					</td>
				</tr>
			</c:if>
			<c:if test='${checkList != "[]" }'>
				<c:forEach items="${checkList }" var="list">
					<tr>
						<td>${list.mName }</td>
						<td>
							<fmt:formatDate value="${list.mBirth }" pattern="yyyy-MM-dd"/>
						</td>
						<td class="tel">
							${list.mPhone }
						</td>
						<td>
							<fmt:formatDate value="${list.arRdate }" pattern="yyyy-MM-dd"/>
						</td>
						<c:if test="${list.arCheck == 0 }">
							<td>
								미사용
							</td>
							<td>
								<button class="btn" onclick="location.href='${conPath}/actCheck.do?arId=${list.arId }&pageNum=${param.pageNum }&eNo=${param.eNo }&hId=${host.hId }'">출석체크</button>
							</td>
						</c:if>
						<c:if test="${list.arCheck == 1 }">
							<td>
								사용
							</td>
							<td class="time">
								<fmt:formatDate value="${list.arCheckDate }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<button id="btn" onclick="location.href='${conPath}/myActivityCheckList.do?hId=${host.hId }&pageNum=${param.pageNum }&eNo=${param.eNo }'">뒤로가기</button>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>