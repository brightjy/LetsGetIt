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
	#myActivityList {
		width:1500px;
		height:729px;
		margin:0 auto;
	}
	#myActivityList table caption {
		margin:20px 0;
		font-size:1.2em;
		font-weight:bold;
	}
	#myActivityList table tr {
		border-bottom:1px solid lightgray;
	}
	#myActivityList table tr .mid {
		width:200px;
		text-align:center;
	}
	#myActivityList table tr .mid button {
		background-color:black;
		color:white;
		width:150px;
		height:30px;
	}
	#myActivityList table tr .img {
		width:50px;
		height:40px;
	}
	#myActivityList table tr .left {
		width:300px;
		padding-left:10px;
	}
	#myActivityList table tr .long {
		width:150px;
		text-align:center;
		height:40px;
		line-height:40px;
	}
	#myActivityList table tr img {
		width:50px;
		height:40px;
		border:1px solid gray;
		margin-top:5px;
	}
	#myActivityList #paging {
		margin-top:20px;
	}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="myActivityList">
		<table>
			<caption>내가 예약한 액티비티</caption>
			<tr>
				<th colspan="2" class="mid">액티비티명</th>
 				<th class="long">예약날짜</th>
				<th class="long">시작날짜</th>
				<th class="long">종료날짜</th>
				<th class="mid">출석여부</th>
			</tr>
			<c:forEach items="${activityList }" var="list">
				<tr>
					<td class="img">
						<img src="${conPath }/actImg/${list.actImg}" alt="대표이미지">
					</td>
					<td class="left">
						${list.actName }
					</td>
					<td class="long">
						<fmt:formatDate value="${list.arRdate }" pattern="yyyy-MM-dd"/>
					</td>
					<td class="long">
						<fmt:formatDate value="${list.actStartdate }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td class="long">
						<fmt:formatDate value="${list.actEnddate }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<c:if test="${list.arCheck == 0 }">
						<td class="mid">미출석</td>
					</c:if>
					<c:if test="${list.arCheck == 1 }">
						<td class="mid">
							<button onclick="location.href='${conPath}/activityReviewWriteForm.do?actId=${list.actId }'">후기 작성</button>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize }">
				[ <a href="${conPath }/myActivityList.do?mId=${mId }&pageNum=${paging.startPage-1}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					[ <b> ${i }</b> ]
				</c:if>
				<c:if test="${paging.currentPage!=i }">
					[ <a href="${conPath }/myActivityList.do?mId=${mId }&pageNum=${i}"> ${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/myActivityList.do?mId=${mId }&pageNum=${paging.endPage+1}">다음</a> ]
			</c:if>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>