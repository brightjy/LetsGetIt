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
	$("#deleteBtn").click(function(){
		var qPw = $("#qPwModify").val();
		var pageNum = $("#pageNum").val();
		var qId = $("#qId").val();
		if(qPw==""){
			alert('비밀번호를 입력해주세요.');
			$("#qPwModify").focus();
			return false;
		}else{
			location.href = "${conPath}/adminQnaDelete.do?pageNum="+pageNum+"&qId="+qId+"&qPw="+qPw;
		}		
	});
	$("#modifyBtn").click(function(){
		var qPw = $("#qPwModify").val();
		if(qPw==""){
			alert('비밀번호를 입력해주세요.');
			$("#qPwModify").focus();
			return false;
		}
	});
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="wrap">
		<div id="WriteForm">
			<form action="${conPath }/adminQnaModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum }" id="pageNum">
			<input type="hidden" name="qId" value="${adminQna.qId }" id="qId">
				<table>
					<tr>
						<td colspan="2" id="writeFirstLine">
							1:1 문의 수정
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
							<c:if test="${not empty member }">
								<input type="hidden" name="qWriter" readonly="readonly" value="${member.mId }">
								<input type="text" readonly="readonly" value="${member.mName }">
							</c:if>
							<c:if test="${not empty admin }">
								<input type="hidden" name="qWriter" readonly="readonly" value="${admin.aId }">
								<input type="text" readonly="readonly" value="${admin.aName }">
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="content" id="qTitle">
							제목
						</td>
						<td class="content" id="title">
							<input type="text" name="qTitle" value="${adminQna.qTitle }">
						</td>
					</tr>
					<tr>
						<td class="content" id="qContent">
							문의 내용
						</td>
						<td class="content" id="title">
							<textarea rows="20" name="qContent">${adminQna.qContent }</textarea>
						</td>
					</tr>
					<tr>
						<td class="content" id="qFile">
							첨부파일
						</td>
						<td class="content" id="title">
							<input type="file" name="file">
						</td>
						<c:if test="${not empty adminQna.qFile }">
							<span>기존 첨부 파일 : ${adminQna.qFile }</span>
						</c:if>
					</tr>
					<tr class="lastRow">
						<td class="content" id="qPw">
							비밀번호
						</td>
						<td class="content" id="title">
							<input type="password" name="qPw" placeholder="4자리 이상 영어 대소문자/숫자 가능" id="qPwModify">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="button" value="목록으로" onclick="location.href='${conPath}/adminQnaList.do?pageNum=${param.pageNum }'">
							<c:if test="${adminQna.qWriter == member.mId || adminQna.qWriter==host.hId || adminQna.qWriter==admin.aId }">
								<input type="submit" value="수정하기" id="modifyBtn">
								<input type="button" value="삭제하기" id="deleteBtn">		
							</c:if>
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