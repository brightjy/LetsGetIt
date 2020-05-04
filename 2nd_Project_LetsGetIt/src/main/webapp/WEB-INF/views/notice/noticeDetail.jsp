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
							${noticeDetail.nType }
						</td>
					</tr>
					<tr>
						<td class="content" id="qTitle">
							제목
						</td>
						<td class="content">
							${noticeDetail.nTitle }
						</td>
					</tr>
					<tr>
						<td class="content" id="qContent">
							글 내용
						</td>
						<td class="content" style="height:400px;" >
							${noticeDetail.nContent }
						</td>
					</tr>
					<c:if test="${not empty noticeDetail.nImg }">
						<tr>
							<td class="content" id="qFile">
								첨부파일
							</td>
							<td class="content" id="title">
								${noticeDetail.nImg }
							</td>
						</tr>	
					</c:if>
					<tr>
						<td colspan="2" style="text-align:center;">
							<c:if test="${nList.nNo==admin.nNo }">
								<button onclick="location.href='${conPath}/noticeModifyForm.do?pageNum=${param.pageNum }&nNo=${nList.nNo}'">수정하기</button>			
							</c:if>
							<button onclick="location.href='${conPath}/noticeAllList.do?pageNum=${param.pageNum }'">목록으로</button>
						</td>
					</tr>
				</table>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>