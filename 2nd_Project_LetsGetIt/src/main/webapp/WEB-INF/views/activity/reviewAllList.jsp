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
<link href="${conPath}/css/activity.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
<link href="${conPath }/css/reviewAllList.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty reviewModify }">
	<script>
		alert('${reviewModify}');
	</script>
</c:if>
<c:if test="${not empty reviewDelete }">
	<script>
		alert('${reviewDelete}');
	</script>
</c:if>
<c:if test="${not empty reviewReply }">
	<script>
		alert('${reviewReply}');
	</script>
</c:if>
<c:if test="${not empty errorMsg }">
	<script>
		alert('${errorMsg}');
		history.go(-1);
	</script>
</c:if>
<c:set var="chk" value="0" />
<jsp:include page="../main/header.jsp"/>
	<c:set var="num" value="${paging.total - paging.startRow + 1 }" />
	<div id="reviewAllList">
		<h3>호스트 후기 ${paging.total }</h3>
		<div id="totGrade">
			<c:forEach begin="1" end="5" var="i" >
					<c:if test="${reviewGrade >= i }">
						★
					</c:if>
					<c:if test="${reviewGrade < i }">
						☆
					</c:if>
			</c:forEach>
			<span id="totNum">
				<fmt:formatNumber value="${reviewGrade }" pattern="0.00" /><br>
			</span>
		</div>
		<hr color="lightgray">
		<c:forEach items="${reviewList }" var="review" varStatus="status">
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
			<c:if test="${not empty member }">
					<a class="like" href="activityReviewAllLike.do?rId=${review.rId}&actId=${review.actId}&pageNum=${paging.currentPage }&rlNo=${reviewLikeList[status.index].rlNo }&rlCheck=${reviewLikeList[status.index].rlCheck }&mId=${member.mId}">도움이 됐어요${review.rLike }</a>
			</c:if>
			<c:if test="${review.rImg != null }">
				<img src="${conPath }/reviewImg/${review.rImg }" alt="후기 이미지"><br>
			</c:if>
			<c:if test="${not empty member || not empty host }">
				<div class="btn">
					<c:if test="${review.mId.equals(member.mId) || review.hId.equals(host.hId) }">
						<a class="bt" href="${conPath }/activityReviewModifyForm.do?rId=${review.rId}&pageNum=${paging.currentPage }">후기 수정 |</a>
						<a class="bt" href="${conPath }/activityReviewDeleteForm.do?rId=${review.rId}&pageNum=${paging.currentPage }">후기 삭제 |</a>
					</c:if>
					<a class="bt" href="${conPath }/activityReviewReplyForm.do?rId=${review.rId}&pageNum=${paging.currentPage }">후기 답변</a>
				</div>
			</c:if>
			<hr color="lightgray" class="last">
		</c:forEach>
	</div>
	<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize }">
			[ <a href="${conPath }/activityReviewAllList.do?actId=${actId }&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentPage!=i }">
				[ <a href="${conPath }/activityReviewAllList.do?actId=${actId }&pageNum=${i}"> ${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			[ <a href="${conPath }/activityReviewAllList.do?actId=${actId }&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>