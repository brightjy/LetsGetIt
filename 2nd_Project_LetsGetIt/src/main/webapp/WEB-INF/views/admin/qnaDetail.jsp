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
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="wrap">
		<div id="DetailForm">
			<table>
					<tr>
						<td colspan="2" id="writeFirstLine">
							1:1 문의 내용
						</td>
					</tr>
					<tr>
						<td class="content" id="qWriter">
							작성자
						</td>
						<td class="content">
							${adminQna.qWriter }
						</td>
					</tr>
					<tr>
						<td class="content" id="qTitle">
							제목
						</td>
						<td class="content">
							${adminQna.qTitle }
						</td>
					</tr>
					<tr>
						<td class="content" id="qContent">
							문의 내용
						</td>
						<td class="content" style="height:400px;" >
							${adminQna.qContent }
						</td>
					</tr>
					<c:if test="${not empty adminQna.qFile }">
						<tr>
							<td class="content" id="qFile">
								첨부파일
							</td>
							<td class="content" id="title">
								${adminQna.qFile }
							</td>
						</tr>	
					</c:if>
					<tr class="lastRow">
						<td class="content" id="qIp">
							작성자 ip
						</td>
						<td class="content">
							${adminQna.qIp }
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<c:if test="${adminQna.qWriter == member.mId || adminQna.qWriter==host.hId || adminQna.qWriter==admin.aId }">
								<button onclick="location.href='${conPath}/adminQnaModifyForm.do?pageNum=${param.pageNum }&qId=${adminQna.qId}'">수정하기</button>			
							</c:if>
							<button onclick="location.href='${conPath}/adminQnaList.do?pageNum=${param.pageNum }'">목록으로</button>
							<c:if test="${not empty admin }">
								<button onclick="location.href='${conPath}/adminQnaReplyForm.do?qId=${adminQna.qId }&pageNum=${param.pageNum }'">답변작성</button>
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