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
<link href="${conPath}/css/hostQna.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="wrap">
		<div id="WriteForm">
			<form action="${conPath }/hostQnaReply.do" method="post">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="qGroup" value="${hostQna.qGroup }">
				<input type="hidden" name="qStep" value="${hostQna.qStep }">
				<input type="hidden" name="qIndent" value="${hostQna.qIndent }">
				<input type="hidden" name="actId" value="${hostQna.actId }">
				<input type="hidden" name="qId" value="${hostQna.qId }">
				<table>
					<tr>
						<td colspan="2" id="writeFirstLine">
							글 답변 작성
						</td>
					</tr>
					<tr>
						<td class="content" id="qWriter">
							작성자
						</td>
						<td class="content">
							<c:if test="${not empty host }">
								<input type="hidden" name="qWriter" readonly="readonly" value="${host.hId }">
								<input type="text" readonly="readonly" value="${host.hName }">
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="content" id="qTitle">
							제목
						</td>
						<td class="content" id="title">
							<input type="text" name="qTitle" value="${hostQna.qTitle}&nbsp;&nbsp;[re]: " required="required">
						</td>
					</tr>
					<tr>
						<td class="content" id="qContent">
							답변 내용
						</td>
						<td class="content" id="title">
							<textarea rows="20" name="qContent"></textarea>
						</td>
					</tr>
					<tr class="lastRow">
						<td class="content" id="qPw">
							비밀번호
						</td>
						<td class="content" id="title">
							<input type="password" name="qPw" placeholder="4자리 이상 영어 대소문자/숫자 가능">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="button" value="취소" onclick="location.href='${conPath}/hostQnaList.do?pageNum=${param.pageNum }'">
							<input type="submit" value="등록">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>