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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<style>
	#reviewAllList {
		width:900px;
		margin:30px auto;
		padding-left:20px;
	}
	#reviewAllList h3 {
		margin-bottom:15px;
	}
	#reviewAllList #totGrade {
		margin:15px 0;
		color:lightblue;
	}
	#reviewAllList #totGrade #totNum {
		color:gray;
	}
	#reviewAllList .name {
		font-weight:bold;
	}
	#reviewAllList .grade {
		color:lightblue;
	}
	#reviewAllList .data {
		font-size:0.9em;
		color:gray;
	}
	#reviewAllList pre {
		margin:20px 0;
		font-size:1.1em;
	}
	#reviewAllList .aName {
		color:gray;
		font-size:0.8em;
	}
	#reviewAllList .like {
		font-size:0.8em;
		color:gray;
		text-align:right;
		float:right;
	}
	#reviewAllList .btn {
		clear:both;
		margin:25px 0 25px 620px;
		width:250px;
		height:35px;
		line-height:35px;
		text-align:center;
		border:1px solid lightgray;
		cursor:pointer;
		background-color:black;
	}
	#reviewAllList .btn .bt {
		color:white;
		font-size:0.9em;
	}
	#reviewAllList img {
		width:100px;
		height:100px;
		float:left;
	}
	#reviewAllList a {
		cursor:pointer;
	}
	#reviewAllList .last {
		clear:both;
	}
	#paging {
		width:900px;
		margin:0 auto;
		text-align:center;
		padding-bottom:30px;
	}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:set var="num" value="${paging.total - paging.startRow + 1 }" />
	<div id="reviewAllList">
		<h3>내가 작성한 후기 ${paging.total }</h3>
		<c:forEach items="${reviewList }" var="review">
			<c:forEach var="i" begin="1" end="${review.rIndent }">
				<c:if test="${i == review.rIndent }">
					└
				</c:if>
				<c:if test="${i != review.rIndent }">
					&nbsp; &nbsp;
				</c:if>
			</c:forEach>
			<span class="name">
				${review.rWriter }<br>
			</span>
			<span class="grade">
				<c:forEach begin="1" end="5" var="i" >
					<c:if test="${review.rGrade >= i }">
						★
					</c:if>
					<c:if test="${review.rGrade < i }">
						☆
					</c:if>
				</c:forEach>
			</span>
			<span class="data">
				<fmt:formatDate value="${review.rDate }" pattern="yyyy년 MM월 dd일 HH:mm 작성"/><br>
			</span>
			<pre>${review.rContent }</pre><br>
			<p class="aName">${review.actName }</p>
			<p class="like">도움이 됐어요${review.rLike }</p>
			<c:if test="${review.rImg != null }">
				<img src="${conPath }/reviewImg/${review.rImg }" alt="후기 이미지"><br>
			</c:if>
			<hr color="lightgray" class="last">
		</c:forEach>
	</div>
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize }">
			[ <a href="${conPath }/myReviewList.do?mId=${member.mId }&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentPage!=i }">
				[ <a href="${conPath }/myReviewList.do?mId=${member.mId }&pageNum=${i}"> ${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a href="${conPath }/myReviewList.do?mId=${member.mId }&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>