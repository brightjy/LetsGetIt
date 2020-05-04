<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" media="(min-width:640px)" href="${conPath}/css/host.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath}/css/host.css" />
<link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<style></style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(document).ready(function(){
		// 아이디 유효성 체크 + 아이디 증복체크
		$("#hId").keyup(function(){
			var hId = $("#hId").val();
			var hIdPattern = RegExp(/^[a-z0-9]{4,12}$/);
			$.ajax({
				url:'${conPath}/idConfirm.do',
				dataType:'html',
				data:"hId="+hId,
				success:function(data,status){
					$("#idConfirmMsg").html(data);
				}
			});
			if(hId!="" && !hIdPattern.test(hId)){
				$("#idConfirmMsg").html("형식이 맞지 않습니다.");
			}else{
				$("#idConfirmMsg").html("");
			}
		}); 
		// 이메일 유효성 체크 + 이메일 중복체크
		$("#hEmail").keyup(function(){
			var hEmail = $("#hEmail").val();
			var hEmailPattern = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			$.ajax({
				url:'${conPath}/emailConfirm.do',
				dataType:'html',
				data:"hEmail="+hEmail,
				success:function(data,status){
					$("#emailConfirmMsg").html(data);
				}
			});	
			if(hEmail!="" && !hEmailPattern.test(hEmail)){
				$("#emailConfirmMsg").html("형식이 맞지 않습니다.");	
			}else{
				$("#emailConfirmMsg").html("");
			}
		});
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
		// 이름 유효성 체크
		$("#hName").keyup(function(){
			var hName = $("#hName").val();
			var hNamePattern = RegExp(/^[가-힣]{2,6}$/);
			if(hName!="" && !hNamePattern.test(hName)){
				$("#nameConfirmMsg").html("형식이 맞지 않습니다.");	
			}else{
				$("#nameConfirmMsg").html("");
			}
		});	
		// 전화 번호 유효성 체크
		$("#hPhone").keyup(function(){
			var hPhone = $("#hPhone").val();
			var hPhonePattern = RegExp(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
			if(hPhone!="" && !hPhonePattern.test(hPhone)){
				$("#phoneConfirmMsg").html("형식이 맞지 않습니다.");	
			}else{
				$("#phoneConfirmMsg").html("");
			}
		});
		
		// 최종 유효성 체크
		$("#submit").click(function(){
			var hId = $("#hId").val();
			var hPw = $("#hPw").val();
			var hPwChk = $("hPwChk").val();
			var hEmail = $("#hEmail").val();
			var hPost = $("#hPost").val();
			var hAddress = $("#hAddress").val();
			
			if(hId==""){
				alert('사용할 아이디를 입력해주세요.');
				$("#hId").focus();
				return false;
			}
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
		<form action="${conPath }/hostJoin.do" method="post">
			<table>
				<tr>
					<td colspan="2" class="title">
						호스트 회원가입
					</td>			
				</tr>
				<tr>
					<td class="content">
						<span>아이디</span>&nbsp;&nbsp;<span id="idConfirmMsg" class="msg"></span>
						<input type="text" id="hId" name="hId" placeholder="영문 소문자+숫자 / 4자 이상 12자 이하">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>비밀번호</span>&nbsp;&nbsp;<span id="pwConfirmMsg" class="msg"></span>
						<input type="password" id="hPw" name="hPw" placeholder="영문 대소문자+숫자+특수문자 / 8자이상25자이하">
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
						<input type="text" id="hName" name="hName" placeholder="한글 2자 이상 6자 이하">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>핸드폰 번호</span>&nbsp;&nbsp;<span id="phoneConfirmMsg" class="msg"></span>
						<input type="text" id="hPhone" name="hPhone" placeholder="예시) 010-1234-5678">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>이메일</span>&nbsp;&nbsp;<span id="emailConfirmMsg" class="msg"></span>
						<input type="text" id="hEmail" name="hEmail" placeholder="예시) example@example.com">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p class="postSearch" >
							우편번호
						</p>
						<input onclick="sample4_execDaumPostcode()" type="text" id="sample4_postcode" name="hPost" placeholder="우편번호(클릭!)">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p>주소</p>
						<input type="text" id="sample4_roadAddress" name="hAddress" placeholder="도로명주소">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="submit" value="가입하기" id="submit">
					</td>
				</tr>
				<!-- <tr><td class="span"></td></tr>
				<tr>
					<td class="span">
						<span>
							SNS 계정으로 가입하기
						</span>
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="button" value="네이버로 가입하기"
							onclick="">
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="button" value="카카오로 가입하기"
							onclick="">
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="button" value="구글로 가입하기"
							onclick="">
					</td>
				</tr> -->
			</table>
		</form>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>