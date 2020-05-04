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
$(function() {
	$('#grade').val("${review.rGrade}").prop("selected", true);
});
</script>
<link href="${conPath }/css/reviewModify.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="reviewModify">
		<form action="${conPath }/activityReviewModify.do" method="post" onsubmit="return chk()">
			<input type="hidden" name="actId" value="${review.actId }">
			<input type="hidden" name="rId" value="${review.rId }">
			<input type="hidden" name="pw" id="pw2" value="${review.rPw }">
			<table>
				<caption>후기 수정</caption>
				<tr>
					<th>후기 제목</th>
					<td>
						<input type="text" name="rTitle" required="required" value="${review.rTitle }">
					</td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<pre><textarea name="rContent" required="required">${review.rContent }</textarea></pre>
					</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>
						<select name="rGrade" id="grade">
							<option value="0">☆☆☆☆☆</option>
							<option value="1">★☆☆☆☆</option>
							<option value="2">★★☆☆☆</option>
							<option value="3">★★★☆☆</option>
							<option value="4">★★★★☆</option>
							<option value="5">★★★★★</option>
						</select>
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
							<input class="btn" type="submit" value="후기 수정">
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