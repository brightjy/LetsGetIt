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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function chk() {
	if($('#rPw').val() != $('#pw2').val()) {
		alert('비밀번호를 확인해주세요');
		return false;
	};
}
</script>
<link href="${conPath }/css/reviewDelete.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="reviewDelete">
		<form action="${conPath }/activityReviewDelete.do" method="post" onsubmit="return chk()">
			<input type="hidden" name="actId" value="${review.actId }">
			<input type="hidden" name="rId" value="${review.rId }">
			<input type="hidden" name="pw" value="${review.rPw }" id="pw2">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table>
				<caption>후기 삭제</caption>
				<tr>
					<th>후기 제목</th>
					<td>
						${review.rTitle }
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="rPw" required="required" id="rPw">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="btn">
							<input class="btn" type="submit" value="후기 삭제">
							<input class="btn" type="button" value="취소" onclick="history.go(-1)">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>