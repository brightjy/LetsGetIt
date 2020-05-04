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
function trClicked(qId){
	location.href='${conPath}/hostQnaDetail.do?qId='+qId+'&pageNum=${paging.currentPage}'+'&writeActid=${writeActid}';
}
function goWrite(){
	location.href='${conPath}/hostqnaWriteForm.do?writeActid=${writeActid}';
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="qnaList">
		<div id="wrap">
			<div id="title">
				QnA
			</div>
			<div id="search">
				<form action="${conPath }/hostQnaList.do" class="form">
					<input type="text" name="searchText" placeholder="검색사항 입력하세요" value="${param.searchText }">
					<input type="submit" value="">
				</form>	
			</div>
			<c:if test="${not empty member}">
				<div id="write"> 
					<button id="writeBtn" onclick="goWrite()">글 작성</button>
				</div>
			</c:if>
			<c:if test="${empty member}">
				<div id="loginPlz">
					<button id="beforeLogin" onclick="location.href='${conPath}/memberLoginForm.do'">글 작성은 로그인 후 가능합니다.</button>
				</div>
			</c:if>
			<div id="list">
				<c:set var="iNum" value="${paging.inverseNum }"/>
				<table>
					<tr>
						<td class="title" id="hostqnaNo">
							no.
						</td>
						<td class="title" id="hostqnaTitle">
							제목
						</td>
						<td class="title" id="hostqnaWriter">
							작성자
						</td>
						<td class="title" id="hostqnaRdate">
							작성일
						</td>
					</tr>
					<c:if test="${paging.total==0 }">
						<tr>
							<td colspan="4">
								작성된 글이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${paging.total!=0 }">
						<c:forEach var="hostQna" items="${hostQnaList }" >
							<tr onclick="trClicked(${hostQna.qId})">
								<td class="content">
									${iNum }
								</td>
								<td class="content" id="left">
									<c:forEach var="i" begin="1" end="${hostQna.qIndent }">
										<c:if test="${i==hostQna.qIndent }">
											&nbsp;└─
										</c:if>
										<c:if test="${i!=hostQna.qIndent }">
											&nbsp; &nbsp; &nbsp;
										</c:if>
									</c:forEach>
									${hostQna.qTitle }
								</td>
								<td class="content">
									${hostQna.qWriter }
								</td>
								<td class="content">
									<fmt:formatDate value="${hostQna.qRdate }"
										pattern="YY/MM/dd(E)"/>
								</td>
							</tr>
							<c:set var="iNum" value="${iNum-1 }"/>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div id="paging">
				<c:if test="${paging.startPage>paging.blockSize }">
					<a href="${conPath }/hostQnaList.do?pageNum=${paging.startPage-1}&searchText=${hostQna.searchText}">
						<span class="next">〈</span>				
					</a>
				</c:if>
				<c:forEach var ="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<span id="currentPage">${i }</span>				
					</c:if>
					<c:if test="${paging.currentPage!=i }">
						<a href="${conPath }/hostQnaList.do?pageNum=${i}">
							<span>${i }</span>
						</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					<a href="${conPath }/hostQnaList.do?pageNum=${paging.endPage+1}&searchText=${hostQna.searchText}">
						<span class="next">〉</span>			
					</a>
				</c:if>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>