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
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="wrap">
		<div id="WriteForm">
			<form action="${conPath }/noticeModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum }" id="pageNum">
			<input type="hidden" name="nNo" value="${nList.nNo }" id="nNo">
				<table>
					<tr>
						<td colspan="2" id="writeFirstLine">
							글 수정
						</td>
					</tr>
					<tr>
						<td class="content" id="qTitle">
							제목
						</td>
						<td class="content" id="title">
							<input type="text" name="nTitle" value="${nList.nTitle }">
						</td>
					</tr>
					<tr>
						<td class="content" id="qContent">
							문의 내용
						</td>
						<td class="content" id="title">
							<textarea rows="20" name="nContent">${nList.nContent }</textarea>
						</td>
					</tr>
					<tr>
						<td class="content" id="qFile">
							첨부파일
						</td>
						<td class="content" id="title">
							<input type="file" name="file">
						</td>
						<c:if test="${not empty nList.nImg }">
							<span>기존 첨부 파일 : ${nList.nImg }</span>
						</c:if>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="button" value="목록으로" onclick="location.href='${conPath}/noticeAllList.do?pageNum=${param.pageNum }'">
							<input type="submit" value="수정하기" id="modifyBtn">
							<input type="button" value="삭제하기" id="deleteBtn">		
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