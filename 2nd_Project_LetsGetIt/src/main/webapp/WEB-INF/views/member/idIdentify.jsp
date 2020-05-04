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
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<caption>아이디 찾기 </caption>
			<tr>
				<td>
					회원님 아이디 : ${result.mId }
				</td>
			</tr>
		</table>
	</div>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>