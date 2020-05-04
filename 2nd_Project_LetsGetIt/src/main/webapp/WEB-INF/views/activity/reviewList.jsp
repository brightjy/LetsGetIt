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
<%-- <link href="${conPath}/css/activity.css" rel="stylesheet"> --%>
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
<style>
/* 	#reviewList {
		width:400px;
		margin:0 auto;
	}
	#reviewList h3 {
		margin:20px 0;
	}
	#reviewList a {
		cursor:pointer;
		text-decoration:none;
		color:black;
	}
	#reviewList #grade {
		padding:0;
		color:lightblue;
		margin-bottom:20px;
	}
	#reviewList #grade #gra {
		font-size:0.9em;
	}
	#reviewList #grade #date {
		color:gray;
		font-size:0.9em;
	}
	#reviewList pre {
		font-size:1.1em;
	}
	#reviewList #name {
		font-size:0.8em;
		color:gray;
	}
	#reviewList #like {
		font-size:0.8em;
		color:gray;
		text-align:right;
		cursor:pointer;
	}
	#reviewList img {
		width:100px;
		height:100px;
		float:left;
	}
	#reviewList #btn {
		float:right;
		margin-top:25px;
		margin-bottom:15px;
		width:170px;
		height:35px;
		line-height:35px;
		text-align:center;
		border:1px solid lightgray;
		cursor:pointer;
		background-color:black;
	}
	#reviewList #btn .btn {
		color:white;
		font-size:0.9em;
	}
	#reviewList #listAll {
		clear:both;
		border:1px solid lightgray;
		width:100%;
		text-align:center;
		height:40px;
		line-height:40px;
		cursor:pointer;
	}
	#reviewList #listAll a {
		font-size:0.9em;
	} */
</style>
</head>
<body>
<section>
	<div id="reviewList">
		<div>
			<b>${review.rWriter }</b><br>
			<div id="grade">
				<span id="gra">
					<c:forEach begin="1" end="5" var="i" >
						<c:if test="${review.rGrade >= i }">
							★
						</c:if>
						<c:if test="${review.rGrade < i }">
							☆
						</c:if>
					</c:forEach>
				</span>
				<span id="date">
					<fmt:formatDate value="${review.rDate }" pattern="yyyy년 MM월 dd일 HH:mm 작성"/>
				</span>
			</div>
		</div>
		<div>
			<pre>${review.rContent }</pre><br>
			<p id="name">${review.actName }</p><br>
			<c:if test="${not empty member }">
				<p id="like" onclick="location.href='activityReviewLike.do?rId=${review.rId}&actId=${review.actId }&mId=${member.mId }&rlNo=${reviewLike.rlNo }&rlCheck=${reviewLike.rlCheck }'">도움이 됐어요${review.rLike }</p>
			</c:if>
			<c:if test="${review.rImg != null }">
				<img src="${conPath }/reviewImg/${review.rImg }"><br>
			</c:if>
			<c:if test="${review.mId.equals(member.mId) }">
				<div id="btn">
					<a class="btn" onclick="location.href='${conPath }/activityReviewModifyForm.do?rId=${review.rId}'">후기 수정 |</a>
					<a class="btn" onclick="location.href='${conPath }/activityReviewDeleteForm.do?rId=${review.rId}'">후기 삭제</a>
				</div>
			</c:if>
		</div>
	</div>
</section>
</body>
</html>