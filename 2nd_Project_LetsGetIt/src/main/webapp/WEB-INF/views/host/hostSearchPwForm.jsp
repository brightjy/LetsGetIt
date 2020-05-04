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
	
});
</script>
</head>
<body>
<c:if test="${not empty hostSearchPwMsg  }">
	<script>
		alert('${hostSearchPwMsg}');
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="joinWrap">
		<form action="${conPath }/hostSearchPw.do" method="get">
			<table>
				<tr>
					<td colspan="2" class="title">
						비밀번호 재설정
					</td>			
				</tr>
				<tr>
					<td class="content">
						<input type="text" name="hId" placeholder="아이디" required="required">
					</td>
				</tr>
				<tr>
					<td class="content">
						<input type="text" name="hName" placeholder="이름" required="required">
					</td>
				</tr>				
				<tr>
					<td class="content">
						<input type="text" name="hEmail" placeholder="이메일" required="required">
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="submit" value="비밀번호 재설정 메일 보내기" id="submit">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>