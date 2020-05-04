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
<link href="${conPath}/css/admin.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<section>
		<div id="adminLoginForm">
			<div id="Wrap">
				<form action="${conPath }/adminLogin.do" method="post">
					<table>
						<tr>
							<td colspan="2" class="title">
								관리자 로그인
							</td>			
						</tr>
						<tr>
							<td class="firstTd">
								<input type="text" name="aId" required="required" value="admin">
							</td>
						</tr>
						<tr>
							<td class="otherTd">
								<input type="password" name="aPw" class="aPw" placeholder="비밀번호" required="required">
							</td>
						</tr>
						<tr>
							<td class="btn">
								<input type="submit" value="로그인하기">
							</td>
						</tr>
					</table>
				</form>
			</div>			
		</div>
</section>
<jsp:include page="../main/footer.jsp" />
</body>
</html>