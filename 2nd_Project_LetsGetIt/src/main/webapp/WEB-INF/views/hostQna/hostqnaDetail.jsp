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
		<div id="DetailForm">
			<table>
					<tr>
						<td colspan="2" id="writeFirstLine">
							글 내용
						</td>
					</tr>
					<tr>
						<td class="content" id="qWriter">
							작성자
						</td>
						<td class="content">
							${hostQna.qWriter}
						</td>
					</tr>
					<tr>
						<td class="content" id="qTitle">
							제목
						</td>
						<td class="content">
							${hostQna.qTitle }
						</td>
					</tr>
					<tr>
						<td class="content" id="qContent">
							글 내용
						</td>
						<td class="content" style="height:400px;" >
							${hostQna.qContent }
						</td>
					</tr>
					<c:if test="${not empty hostQna.qImg }">
						<tr>
							<td class="content" id="qFile">
								첨부파일
							</td>
							<td class="content" id="title">
								${hostQna.qImg }
							</td>
						</tr>	
					</c:if>
					<tr>
						<td colspan="2" style="text-align:center;">
							<c:if test="${hostQna.qWriter == member.mId || hostQna.qWriter==host.hId }">
								<button onclick="location.href='${conPath}/hostQnaModifyForm.do?pageNum=${param.pageNum }&qId=${hostQna.qId}&writeActid=${hostQna.actId }'">수정하기</button>			
							</c:if>
							<button onclick="location.href='${conPath}/hostQnaList.do?pageNum=${param.pageNum }'">목록으로</button>
							<c:if test="${not empty host }">
								<button onclick="location.href='${conPath}/hostQnaReplyForm.do?qId=${hostQna.qId }&pageNum=${param.pageNum }'">답변작성</button>
							</c:if>
						</td>
					</tr>
				</table>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>