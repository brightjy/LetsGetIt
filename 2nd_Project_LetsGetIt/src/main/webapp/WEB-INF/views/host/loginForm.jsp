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
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/member.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/member.css" />
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<c:if test="${not empty result }">
	<script>
		alert('${result}');
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
	<section style="height:800px;">
		<div id="Wrap">
			<form action="${conPath }/hostLogin.do" method="post">
				<table>
					<tr>
						<td colspan="2" class="title">
							호스트 로그인
						</td>			
					</tr>
					<tr>
						<td class="firstTd">
							<input type="text" name="hId" placeholder="아이디" required="required" value="${hId }">
						</td>
					</tr>
					<tr>
						<td class="otherTd">
							<input type="password" name="hPw" placeholder="비밀번호" required="required" value="${hPw}">
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
					<tr>
						<td>
							<input type="button" value="회원가입" onclick="location.href='${conPath }/hostjoinForm.do'">				
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="비밀번호 재설정" onclick="location.href='${conPath }/hostSearchPwForm.do'">				
						</td>
					</tr>
<!-- 											<tr><td class="span"></td></tr>
						<tr>
							<td class="span">
								<span>
									SNS 계정으로 로그인하기
								</span>
							</td>
						</tr>
						<tr>
							<td class="btn">
								<input type="button" value="네이버로 로그인하기"
									onclick="">
							</td>
						</tr>
						<tr>
							<td class="btn">
								<input type="button" value="카카오로 로그인하기"
									onclick="">
							</td>
						</tr>
						<tr>
							<td class="btn">
								<input type="button" value="페이스북으로 로그인하기"
									onclick="">
							</td>
						</tr>  -->
				</table>
			</form>			
		</div>
	</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>