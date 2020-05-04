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
<link href="${conPath}/css/admin.css" rel="stylesheet">
<style></style>
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
</script>
<style>
	#couponWriteForm {
		width:700px;
		height:699px;
		margin:0 atuo;
	}
	#couponWriteForm table {
		margin:30px auto;
		width:500px;
	}
	#couponWriteForm table caption {
		font-size:1.3em;
		font-weight:bold;
	}
	#couponWriteForm table tr th {
		margin:20px 0;
		width:100px;
		height:40px;
		line-height:40px;
		font-weight:bold;
		font-size:1.1em;
		text-align:center;
	}
	#couponWriteForm table tr td {
		width:300px;
		height:40px;
	}
	#couponWriteForm table tr td input {
		width:200px;
		height:35px;
		line-height:35px;
		font-size:1.1em;
		margin:10px;
		padding-left:10px;
	}
	#couponWriteForm table tr td .btn {
		text-align:center;
		font-size:1.1em;
		border:1px solid gray;
		width:140px;
		height:40px;
		line-height:40px;
		cursor:pointer;
		padding:0;
	}
	#couponWriteForm table tr td input[type=submit] {
		background-color:black;
		color:white;
	}
	#couponWriteForm table tr td select {
		width:200px;
		height:25px;
		line-height:25px;
		text-align:center;
		margin-left:10px;
	}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="couponWriteForm">
		<form action="${conPath }/couponWrite.do" method="post" onsubmit="return chk()">
			<table>
				<caption>새로운 쿠폰 생성</caption>
				<tr>
					<th>쿠폰 이름</th>
					<td>
						<input type="text" name="cName" id="name" required="required" placeholder="33글자 이내 작성"><br>
					</td>
				</tr>
				<tr>
					<th>할인율</th>
					<td>
						<input type="number" name="cDiscount" id="discount" required="required" value="0"><br>
					</td>
				</tr>
				<tr>
					<th>유효기간</th>
					<td>
						<select name="cDate">
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
						<input class="btn" type="submit" value="쿠폰 생성">
						<input class="btn" type="button" value="취소" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>