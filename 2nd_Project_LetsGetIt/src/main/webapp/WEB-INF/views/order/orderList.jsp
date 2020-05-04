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
				Order
			</div>
			<div id="list">
			<form action="${conPath }/modifyOrderType.do" method="get" >
				<c:set var="iNum" value="${paging.iNum }"/>
				<table>
					<tr>
							<th class="title" id="">
								이미지
							</th>
							<th class="title" id="" >
								엑티비티 정보
							</th>
							<th class="title" id="">
								가격
							</th>
							<th class="title" id="">
								수량
							</th>
							<th class="title" id="">
								합계
							</th>
						</tr>
						<c:if test="${empty map.list }">
							<tr>
								<td colspan="5">
									장바구니가 비었습니다.
								</td>
							</tr>
						</c:if> 
						<c:forEach items="${map.list }" var="orderLists" varStatus="status">>
						<tr>
							<td>
								<img alt="상품이미지" src="${conPath }/productFileUp/${orderLists.actImg}">
							</td>
							<td style="text-align: left;">
								${orderLists.actName}
							</td>
							<td >
								<b>￦</b><fmt:formatNumber value="${orderLists.oPrice}" groupingUsed="true" /> 
								
							</td>
							<td >
								<input type="number" name="cAmount" value="${orderLists.oQty}" min="1" max="10" style="width: 40px;">
								<input type="hidden" name="num" value="${orderLists.oNo }">
								<input type="submit" value="수정">
							</td>
							<td >
								<b>￦</b><fmt:formatNumber value="${orderLists.summoney}" groupingUsed="true" /> 
								<input type="hidden" name="summoney${status.index}" value ="${orderLists.summoney}"/>
							</td>
							<td>
							<a href="${conPath }/deleteOrder.do?oNo=${orderLists.oNo }">삭제</a>
							<td>
						</tr>
						</form>
						</c:forEach>
						<tr>
							<td colspan="5" style="text-align: left;">					
								<h2 style="text-align: right;">전체 금액 :<b>￦</b><fmt:formatNumber value="${map.AllsumMoney}" groupingUsed="true" /> </h2>
							</td>
						</tr>
					</table>
					<span class="bot">
					<p>
						<input type="submit" value="주문하기" class="Btn">
					</p>
				</span>	
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>