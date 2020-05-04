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
				Cart
			</div>
			<div id="list">
				<c:set var="iNum" value="${paging.iNum }"/>
				<table>
					<tr>
							<th class="title" id="">
								<input type="checkbox" id="checkall">
							</th>
							<!-- <th class="title" id="">
								이미지
							</th> -->
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
						<c:forEach items="${map.list }" var="cartLists" >
						<form action="cartModify.do" method="get">
						<tr>
							<td>
								<input type="checkbox" name="cNo" class="cNo" value="${cartLists.cId }" >
							</td>
							<td style="text-align: left;">
								${cartLists.actName}
							</td>
							<td >
								<b>￦</b><fmt:formatNumber value="${cartLists.actPrice}" groupingUsed="true" /> 
								
							</td>
							<td >
								<input type="number" name="cAmount" value="${cartLists.cAmount}" min="1" max="10" style="width: 40px;">
								<input type="hidden" name="num" value="${cartLists.cId }">
								<input type="submit" value="수정">
							</td>
							<td >
								<b>￦</b><fmt:formatNumber value="${map.sumMoney}" groupingUsed="true" /> 
							</td>
						</tr>
						</form>
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align: left;">
								<img alt="delte" style="width: 80px;" src="${conPath }/img/cart/btn_delete2.gif" class="delete"> 						
								<h2 style="text-align: right;">전체 금액 :<b>￦</b><fmt:formatNumber value="${map.sumMoney}" groupingUsed="true" /> </h2>
							</td>
						</tr>
					</table>
						
						<span>
							<a href="${conPath }/orderView.do"><img alt="전체" src="${conPath }/img/cart/btn_order_all.jpg" > </a>
							<img alt="선택" class="selectbtn" src="${conPath }/img/cart/btn_order_select.jpg" >
						</span>		
			</div>
		</div>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>