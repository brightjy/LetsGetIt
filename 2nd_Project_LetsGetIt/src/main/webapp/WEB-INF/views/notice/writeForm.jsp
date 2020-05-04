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
<link href="${conPath}/css/hostQna.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="wrap">
		<div id="WriteForm">
			<form action="${conPath }/noticeWrite.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td colspan="2" id="writeFirstLine">
							글 작성
						</td>
					</tr>
					<tr>
					<td class="content" id="qType">
						글 타입
					</td>
						<td >
							<input type="radio" name="nType" checked="checked" value="notice">공지사항
							<input type="radio" name="nType" value="event">이벤트
							<input type="radio" name="nType" value="announce">발표
						</td>
					</tr>	
					<tr>
						<td class="content" id="nTitle">
							제목
						</td>
						<td class="content" id="title">
							<input type="text" name="nTitle">
						</td>
					</tr>
					<tr>
						<td class="content" id="nContent">
							글 내용
						</td>
						<td class="content" id="title">
							<textarea rows="20" name="nContent"></textarea>
						</td>
					</tr>
					<tr>
						<td class="content" id="nImg">
							첨부파일
						</td>
						<td class="content" id="title">
							<input type="file" name="file">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" value="등록">
							<input type="button" value="취소" onclick="location.href='${conPath}/hostQnaList.do'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>