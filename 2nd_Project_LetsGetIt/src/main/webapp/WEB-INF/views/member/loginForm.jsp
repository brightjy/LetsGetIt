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
<link href="${conPath}/css/member.css" rel="stylesheet">
<style>
h1 {
font-family: "campton", "Apple SD Gothic Neo", NanumBarunGothic, "나눔바른고딕", Malgun Gothic, "맑은 고딕", dotum, sans-serif;
margin: 0;
padding: 0;
margin-bottom: 20px;
color: #000;
font-size: 45px;
font-weight: 500;
text-align: center;}
.btn{
font-family: "campton", "Apple SD Gothic Neo", NanumBarunGothic, "나눔바른고딕", Malgun Gothic, "맑은 고딕", dotum, sans-serif;
padding: 0;
outline: none;
vertical-align: top;
box-sizing: border-box;
display: inline-block;
position: relative;
text-align: center;
cursor: pointer;
border: 1px solid #000;
width: 300px;
height: 60px;
margin: 30px 0;
background: #000;
color: #fff;
font-size: 16px;
line-height: 60px;
font-weight: 500;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="loginForm">
		<div class="login">
				<form action="${conPath }/login.do" method="post">
					<h1>로그인</h1>
						<table>
							<tr>
								<th>
									ID
								</th>
								<td>
									<input type="text" name="mId" placeholder="아이디" class="mId" >
								</td>
							</tr>
							<tr>
								<th>
									PW
								</th>
								<td>
									<input type="password" name="mPw" placeholder="비밀번호" class="mPw" >
								</td>
							</tr>
							<tr>
								<td rowspan="2">
									<input type="submit" value="로그인" class="btn"> 
								</td>
							</tr>
						</table>								
				</form>
			</div>
		<button onclick="location.href='${conPath}/memberJoin.do'">회원가입 </button>
		<button onclick="location.href='${conPath}/idCkForm.do'">아이디 찾기</button>
		<button onclick="location.href='${conPath}/pwCk.do'">비밀번호 찾기</button>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>