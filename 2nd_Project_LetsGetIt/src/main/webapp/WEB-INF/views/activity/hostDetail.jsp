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
<link href="${conPath}/css/activityDetail.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#likeBtn").click(function(){
		   location.href="${conPath}/memberLikeHost.do?hId=${hostInfo.hId}";
	   });
});
function tdClicked(actId){
	location.href='${conPath }/activityDetail.do?actId='+actId;
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<c:if test="${not empty likeResultMsg }">
<script>
	alert('${likeResultMsg}');
</script>
</c:if>
<div id="wrap">
	<div class="block">
		<div id="hostInfo">
			<table>
				<tr>
					<th colspan="2" >
						호스트
					</th>
				</tr>
				<tr>
					<td id="hPhoto">
						<c:if test="${empty host.hPhoto}">
							<img src="${conPath }/upload/hPhotoDefault120x120.jpg" alt="호스트이미지">
						</c:if>
						<c:if test="${not empty host.hPhoto}">
							<img src="${conPath }/img/${hostInfo.hPhoto}" alt="호스트이미지">
						</c:if>
					</td>
					<td class="text">
						<span class="bold">${hostInfo.hName }</span> &nbsp; 
						<span class="small">좋아요  ${hostInfo.hCntLike }개</span>
						
					</td>
					<td class="text">
						<span class="likeBtn">
							<c:if test="${ not empty member && checkResult==0}">
								<img src="${conPath }/img/like_before.png" alt="좋아하기버튼" id="likeBtn">						
							</c:if>
							<c:if test="${ not empty member && checkResult!=0}">
								<img src="${conPath }/img/like_after.png" alt="좋아하기버튼" id="likeBtn">						
							</c:if>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="block">
		<div class="list">
			<div class="content">
				<div id="title">
					<span>이 호스트의 액티비티</span>
				</div>
				<div id="list">
					<div class="activity">
						<c:forEach var="act" items="${hostActivityList }">
							<div class="tr" onclick="tdClicked(${act.actId})">
								<div class="actImg">
									<img src="${conPath }/actImg/${act.actImg}" alt="대표이미지">
								</div>
								<div class="actName">
									<span>${act.actName }</span>
								</div>
								<div class="actPrice">
									<c:if test="${act.actDiscount!=0 }">
										<span class="discountPrice">
											<c:set var="discountPrice" value="${act.actPrice*(1-(act.actDiscount/100)) }"/>
											<fmt:formatNumber value="${discountPrice }" pattern="#,###,###" />원
										</span>
										<span class="originalPrice">
											<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>
										</span>
									</c:if>
									<c:if test="${act.actDiscount==0 }">
										<span class="discountPrice">
											<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>원
										</span>				
									</c:if>
								</div>
								<div class="actGrade">
									<span id="star">★</span>
									<span><fmt:formatNumber value="${act.actGrade }" pattern="#.#"/>점</span>
								</div>	
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>