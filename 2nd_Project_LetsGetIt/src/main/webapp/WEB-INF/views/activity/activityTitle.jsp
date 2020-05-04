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

	function checkFile(f){
		var file = f.files;
		if(!/\.(gif|jpg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.');
		else return;
		f.outerHTML = f.outerHTML;
	}
	function fileUp() {
		var actImgChk = document.getElementById("actImg").value;
		if(!actImgChk) {
			alert('대표이미지를 첨부하셔야 합니다');
			return false;
		}
	}
</script>
<link href="${conPath }/css/activityTitle.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="activityTitle">
		<h3>액티비티 만들기</h3>
		<form action="${conPath }/activityMemberCnt.do" method="post" enctype="multipart/form-data" onsubmit="return fileUp()">
			<input type="hidden" name="actCno" value="${actCno }">
			<div id="left">
				<p>액티비티명</p>
				<input type="text" name="actName" placeholder="33글자 이내 작성" required="required">
				<p>대표 이미지</p>
				<input type="file" name="actImg" accept=".gif, .jpg, .png" id="actImg" onchange='checkFile(this)'>
			</div>
			<div id="right">
				<ul>
					<li>
						자신의 액티비티 이름을 33글자 이내로 자유롭게 작성해주세요
					</li>
					<li>
						대표이미지는 자신의 액티비티 특성을<br>
						잘 나타낼 수 있는 사진으로 올려주세요
					</li>
					<li>
						첨부파일은 gif, jpg, png만 등록 가능합니다
					</li>
				</ul>
			</div>
			<div id="btn">
				<input class="btn" type="button" value="이전" onclick="history.go(-1)">
				<input class="btn" type="submit" value="다음">
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>