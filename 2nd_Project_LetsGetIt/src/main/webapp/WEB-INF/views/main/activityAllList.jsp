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
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/main.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/main.css" />
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
function tdClicked(actId){
	location.href='${conPath }/activityDetail.do?actId='+actId+'&pageNum=${paging.currentPage}';
}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
	<div id="activityAllList">
		<div id="title">
			<span id="searchText">'${activity.searchText }'</span>
			<span>에 대한</span>
			<span id="total">${paging.total }</span>
			<span>개의 통합 검색 결과입니다.</span>
		</div>
		<div id="list">
			<div class="content">
				<div id="list">
					<div class="activity">
						<c:forEach var="act" items="${activityAllList }" begin="0" end="3">
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
		
		
		
		
		
		
		
			<%-- <table>
				<tr>
					<c:set var="idx" value="0" scope="page"/>
					<c:forEach var="act" items="${activityAllList }">
						<td onclick="tdClicked(${act.actId})">
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
									<span class="originalPrice">
										<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>원
									</span>				
								</c:if>
							</div>
							<div class="actGrade">
								<span id="star">★</span>
								<span>${act.actGrade }</span>
							</div>
						<c:set var="idx" value="${idx+1 }"/>
						</td>
						<c:if test="${idx%4==0 }">
						</tr><tr>
						</c:if>				
					</c:forEach>
				</tr>
			</table> --%>
		</div>
		<div id="paging">
			<c:if test="${paging.startPage>paging.blockSize }">
				<a href="${conPath }/activityAllList.do?pageNum=${paging.startPage-1}&searchText=${activity.searchText}">
					<span class="next">〈</span>				
				</a>
			</c:if>
			<c:forEach var ="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<span id="currentPage">${i }</span>				
				</c:if>
				<c:if test="${paging.currentPage!=i }">
					<a href="${conPath }/activityAllList.do?pageNum=${i}">
						<span>${i }</span>
					</a>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				<a href="${conPath }/activityAllList.do?pageNum=${paging.endPage+1}&searchText=${activity.searchText}">
					<span class="next">〉</span>			
				</a>
			</c:if>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>