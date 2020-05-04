<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/member.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/member.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>

</head>
<body>
	<jsp:include page="../main/header.jsp" />
<section>
		<div id="Wrap">
			<form action="${conPath }/memberLogin.do" method="post">
				<table>
					<tr>
						<td colspan="2" class="title">
							멤버 로그인
						</td>			
					</tr>
					<tr>
						<td class="firstTd">
							<input type="text" name="mId" class="mId" placeholder="아이디" required="required" value="${mId }">
						</td>
					</tr>
					<tr>
						<td class="otherTd">
							<input type="password" name="mPw" class="mPw" placeholder="비밀번호" required="required" value="${mPw}">
						</td>
					</tr>
					<tr>
						<td class="btn">
							<input type="submit" value="로그인하기">
						</td>
					</tr>
					<tr>
						<td class="fake">
						</td>
					</tr>				
					<!-- <tr>
						<td class="kakaobtn">
							<a id="kakao-login-btn">카톡으로로그인</a>
								<a href="http://developers.kakao.com/logout"></a>
							<script type='text/javascript'>
								Kakao.init('1561273ccfe4f4b133b5eaf17af21c91'); 
								Kakao.Auth.createLoginButton({
									container : '#kakao-login-btn',
									success : function(authObj) {
										alert(JSON.stringify(authObj));
									},
									fail : function(err) {
										alert(JSON.stringify(err));
									}
								});
							</script>							
						</td>
					</tr> -->
					<tr>
						<td>
							<input type="button" value="회원가입" onclick="location.href='${conPath}/memberJoinForm.do'">				
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="아이디 찾기" onclick="location.href='${conPath}/memberSearchIdForm.do'">				
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="비밀번호 찾기" onclick="location.href='${conPath}/memberSearchPwForm.do'">				
						</td>
					</tr>
				</table>
			</form>			
		</div>
</section>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>