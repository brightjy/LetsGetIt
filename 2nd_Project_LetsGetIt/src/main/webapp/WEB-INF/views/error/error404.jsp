<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%  response.setStatus(404); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#error {
		width:1000px;
		height:729px;
		margin:0 auto;
		text-align:center;
	}
	#error p {
		font-size:1.3em;
		padding:250px 0;
	}
	#error button {
		width:200px;
		height:50px;
		line-height:50px;
		font-size:1.1em;
		background-color:black;
		color:white;
	}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="error">
		<p>죄송합니다. 해당 페이지는 점검중입니다</p>
		<button onclick="location.href='main.do'">메인페이지로 가기</button>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>