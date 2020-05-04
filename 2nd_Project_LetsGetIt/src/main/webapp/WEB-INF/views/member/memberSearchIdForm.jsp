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
<link href="${conPath }/css/member.css" rel="stylesheet">
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
<section>
	<div id="Wrap">
		<form action="${conPath }/memberSearchId.do" method="post">
		<table>
				<tr>
					<td colspan="2" class="title">
						아이디 찾기
					</td>			
				</tr>
				<tr>
					<td class="firstTd">
						<input type="text" name="mName" placeholder="이름" required="required" value="${mName}">
					</td>
				</tr>			
				<tr>
					<td class="otherTd">
						<input type="text" name="mEmail" placeholder="이메일" required="required" value="${mEmail}">
					</td>
				</tr>
				<tr>
					<td class="btn">
						<input type="submit" value="아이디 찾기" id="submit">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>