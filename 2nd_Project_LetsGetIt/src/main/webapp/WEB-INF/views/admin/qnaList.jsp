<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${conPath}/css/admin.css" rel="stylesheet">
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/admin.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/admin.css" />
<link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
});
function trClicked(qId){
	location.href='${conPath}/adminQnaDetail.do?qId='+qId+'&pageNum=${paging.currentPage}';
}
</script>
</head>
<body>
<c:if test="${not empty resultMsg }">
	<script>
		alert('${resultMsg }');
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="qnaList">
		<div id="wrap">
			<div id="title">
				QnA
			</div>
			<div id="search">
				<form action="${conPath }/adminQnaList.do" class="form">
					<input type="text" name="searchText" placeholder="예) 환불 방법" value="${param.searchText }">
					<input type="submit" value="">
				</form>	
			</div>
			<c:if test="${not empty member || not empty host || not empty admin }">
				<div id="write">
					<button id="writeBtn" onclick="location.href='${conPath}/adminQnaWriteForm.do'">문의 작성</button>
				</div>
			</c:if>
			<c:if test="${empty member && empty host && empty admin }">
				<div id="loginPlz">
					<button id="beforeLogin" onclick="location.href='${conPath}/main.do'">1:1 문의 작성은 로그인 후 가능합니다.</button>
				</div>
			</c:if>
			<div id="list">
				<c:set var="iNum" value="${paging.inverseNum }"/>
				<table>
					<tr>
						<td class="title" id="qnaNo">
							no.
						</td>
						<td class="title" id="qnaTitle">
							제목
						</td>
						<td class="title" id="qnaWriter">
							작성자
						</td>
						<td class="title" id="qnaRdate">
							작성일
						</td>
						<td class="title" id="qnaHit">
							조회수
						</td>
					</tr>
					<c:if test="${paging.total==0 }">
						<tr>
							<td colspan="5">
								작성된 문의가 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${paging.total!=0 }">
						<c:forEach var="adminQna" items="${adminQnaList }" >
							<tr onclick="trClicked(${adminQna.qId})">
								<td class="content">
									${iNum }
								</td>
								<td class="content" id="left">
									<c:forEach var="i" begin="1" end="${adminQna.qIndent }">
										<c:if test="${i==adminQna.qIndent }">
											&nbsp;└─
										</c:if>
										<c:if test="${i!=adminQna.qIndent }">
											&nbsp; &nbsp; &nbsp;
										</c:if>
									</c:forEach>
									${adminQna.qTitle }
								</td>
								<td class="content">
									${adminQna.qWriter }
								</td>
								<td class="content">
									<fmt:formatDate value="${adminQna.qRdate }"
										pattern="YY/MM/dd(E)"/>
								</td>
								<td class="content">
									${adminQna.qHit }
								</td>
							</tr>
							<c:set var="iNum" value="${iNum-1 }"/>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div id="paging">
				<c:if test="${paging.startPage>paging.blockSize }">
					<a href="${conPath }/adminQnaList.do?pageNum=${paging.startPage-1}&searchText=${adminQna.searchText}">
						<span class="next">〈</span>				
					</a>
				</c:if>
				<c:forEach var ="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }">
						<span id="currentPage">${i }</span>				
					</c:if>
					<c:if test="${paging.currentPage!=i }">
						<a href="${conPath }/adminQnaList.do?pageNum=${i}">
							<span>${i }</span>
						</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					<a href="${conPath }/adminQnaList.do?pageNum=${paging.endPage+1}&searchText=${adminQna.searchText}">
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