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

	// 비밀번호 유효성 체크
	$("#hPw").keyup(function(){
		var hPw = $("#hPw").val();
		var hPwPattern = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);			
		if(hPw!="" && !hPwPattern.test(hPw)){
			$("#pwConfirmMsg").html("형식이 맞지 않습니다.");
		}
	});
	$("#hPwChk").keyup(function(){
		var hPw = $("#hPw").val();
		var hPwChk = $("#hPwChk").val();
		if(hPwChk!="" && hPw!=hPwChk){
			$("#pwConfirmMsg").html("비밀번호가 일치하지 않습니다.");
		}else{
			$("#pwConfirmMsg").html("");
		}
	});
	// 최종 유효성 체크
	$("#submit").click(function(){
		var hPw = $("#hPw").val();
		var hPwChk = $("#hPwChk").val();
		var hEmail = $("#hEmail").val();
		var hPost = $("#hPost").val();
		var hAddress = $("#hAddress").val();
		
		if(hPw==""){
			alert('사용할 비밀번호를 입력해주세요.');
			$("#hPw").focus();
			return false;
		}
		if(hPwChk==""){
			alert('비밀번호 확인을 해주세요.');
			$("#hPwChk").focus();
			return false;
		}		
		if(hPw!=hPwChk){
			alert('비밀번호가 일치하지 않습니다.');
			$("#hPwChk").focus();
			return false;
		}		
		if(hEmail==""){
			alert('이메일을 입력해주세요.');
			$("#hEmail").focus();
			return false;
		}
		if(hPost==""){
			alert('우편번호 찾기를 해주세요.');
			return false;
		}
	});
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="joinWrap">
		<form action="${conPath }/hostModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hId" value="${host.hId }">
			<table>
				<tr>
					<td colspan="2" class="title">
						호스트 정보수정
					</td>			
				</tr>
				<tr>
					<td class="content" id="hPhoto">
						<c:if test="${empty host.hPhoto}">
							<div id="img_preview">
								<img src="${conPath }/img/hPhotoDefault120x120.jpg" style="border:1px solid lightgrey; border-radius: 120px; width: 120px; height: 120px" id="hPhotoPreview">
							</div>
						</c:if>
						<c:if test="${not empty host.hPhoto }">
							<img src="${conPath }/upload/${host.hPhoto}" style="border:1px solid lightgrey; border-radius: 120px; width: 120px; height: 120px">
						</c:if>
						<br>
						<input type="file" name="file" id="file">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>비밀번호</span>&nbsp;&nbsp;<span id="pwConfirmMsg" class="msg"></span>
						<input type="password" id="hPw" name="hPw" placeholder="영문 대소문자+숫자+특수문자 / 8자이상25자이하" value="${host.hPw }">
					</td>
				</tr>
				<tr>
					<td class="hPwhChk">
						<input type="password" name="hPwChk" id="hPwChk" placeholder="비밀번호를 다시 한번 입력해주세요.">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>이름</span>&nbsp;&nbsp;<span id="nameConfirmMsg" class="msg"></span>
						<input type="text" id="hName" name="hName" placeholder="한글 2자 이상 6자 이하" value="${host.hName }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>핸드폰 번호</span>&nbsp;&nbsp;<span id="phoneConfirmMsg" class="msg"></span>
						<input type="text" id="hPhone" name="hPhone" placeholder="예시) 010-1234-5678" value="${host.hPhone }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>이메일</span>&nbsp;&nbsp;<span id="emailConfirmMsg" class="msg"></span>
						<input type="text" id="hEmail" name="hEmail" placeholder="예시) example@example.com" value="${host.hEmail }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p class="postSearch" >
							우편번호
						</p>
						<input onclick="sample4_execDaumPostcode()" type="text" id="sample4_postcode" name="hPost" placeholder="우편번호(클릭!)" value="${host.hPost }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p>주소</p>
						<input type="text" id="sample4_roadAddress" name="hAddress" placeholder="도로명주소" value="${host.hAddress }">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="submit" value="수정하기" id="submit">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>