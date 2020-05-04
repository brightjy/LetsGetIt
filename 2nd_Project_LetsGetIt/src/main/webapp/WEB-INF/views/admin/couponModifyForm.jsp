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
function chk() {
	var name = $('#name').val().length;
	var discount =  $('#discount').val();
	if(name > 33) {
		alert('쿠폰명은 33글자 이내만 가능합니다');
		return false;
	} else if(discount < 0 || discount > 100) {
		alert('할인율은 0 ~ 100 이내의 숫자만 가능합니다');
		return false;
	}
}
$(document).ready(function(){
	  $("select option").each(function(){
	    if($(this).val()=="${coupon.cDate}"){
	      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	    }
	});
});
</script>
<style>
	#couponModifyForm {
		width:700px;
		height:699px;
		margin:0 atuo;
	}
	#couponModifyForm table {
		margin:30px auto;
		width:450px;
	}
	#couponModifyForm table caption {
		font-size:1.3em;
		font-weight:bold;
	}
	#couponModifyForm table tr th {
		margin:20px 0;
		width:100px;
		height:40px;
		line-height:40px;
		font-weight:bold;
		font-size:1.1em;
		text-align:center;
	}
	#couponModifyForm table tr td {
		width:350px;
		height:40px;
	}
	#couponModifyForm table tr td input {
		height:35px;
		line-height:35px;
		font-size:1.1em;
		margin:10px;
		padding-left:10px;
	}
	#couponModifyForm table tr td input[type=text] {
		width:350px;
		padding-top:5px;
	}
	#couponModifyForm table tr td input[type=number] {
		width:150px;
		margin-right:-30px;
		padding-right:30px;
	}
	#couponModifyForm table tr td select {
		width:200px;
		height:30px;
		line-height:30px;
		text-align:center;
		margin-left:10px;
		padding-left:10px;
		font-size:11pt;
	}
	#couponModifyForm table tr td #btn .btn {
		text-align:center;
		font-size:1.1em;
		width:150px;
		height:40px;
		line-height:40px;
		cursor:pointer;
		padding:0;
		margin-top:30px;
		margin-left:50px;
	}
	#couponModifyForm table tr td #btn input[type=submit] {
		background-color:black;
		color:white;
	}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="couponModifyForm">
		<form action="${conPath }/couponModify.do" method="post" onsubmit="return chk()">
			<input type="hidden" name="cId" value="${coupon.cId }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<caption>${coupon.cId }번 쿠폰 수정</caption>
				<tr>
					<th>쿠폰 이름</th>
					<td>
						<input type="text" name="cName" id="name" required="required" value="${coupon.cName }"><br>
					</td>
				</tr>
				<tr>
					<th>할인율</th>
					<td>
						<input type="number" name="cDiscount" id="discount" required="required" value="${coupon.cDiscount }">%<br>
					</td>
				</tr>
				<tr>
					<th>유효기간</th>
					<td>
						<select name="cDate">
						<c:if test="${coupon.cDate == 1 }"></c:if>
							<option value="1" selected="selected">1개월</option>
							<option value="2">3개월</option>
							<option value="3">6개월</option>
							<option value="4">1년</option>
							<option value="5">무기한</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="btn">
							<input class="btn" type="submit" value="쿠폰 수정">
							<input class="btn" type="button" value="취소" onclick="history.go(-1)">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>