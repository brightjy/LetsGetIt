<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script >
$(document).ready(function(){
	
});
</script>
</head>
<body>
	<c:if test="${not empty result}">
		<script>alert('${result}');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/idChk.do" method="post">
		<table>
			<caption>아이디 찾기 화면</caption>
			<tr><th>이름</th><td><input type="text" name="mName" required="required" value="${mName}"></td></tr>
			<tr><th>E-mail</th><td><input type="text" name="mEmail" required="required" value="${mEmail}"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="아이디 찾기">
			</td></tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>