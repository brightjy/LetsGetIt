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
$(document).ready(function(){
	
});
</script>
<link href="${conPath }/css/reviewWrite.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="reviewWrite">
		<form action="${conPath }/activityReviewWrite.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="actId" value="${actId }">
			<c:if test="${not empty member }">
				<input type="hidden" name="rWriter" value="${member.mId }">
				<input type="hidden" name="mId" value="${member.mId }">
			</c:if>
			<c:if test="${not empty host }">
				<input type="hidden" name="rWriter" value="${host.hId }">
				<input type="hidden" name="hId" value="${host.hId }">
			</c:if>
			<table>
				<caption>후기 작성</caption>
				<tr>
					<th>후기 제목</th>
					<td>
						<input type="text" name="rTitle" required="required">
					</td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<textarea name="rContent" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부 이미지</th>
					<td>
						<input type="file" name="rImgstr" accept=".gif, .jpg, .png">
					</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>
						<select name="rGrade">
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
						<input type="password" name="rPw" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="btn">
							<input class="btn" type="submit" value="후기 작성">
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