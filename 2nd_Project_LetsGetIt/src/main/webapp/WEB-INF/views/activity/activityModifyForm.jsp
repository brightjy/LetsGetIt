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
</head>
<link href="${conPath }/css/activityModifyForm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	$('#minDecrease').click(function() {
		var min = $('#min').val()-1;
		if(min >= 1) {
			$('#min').val(min);
		}
	});
	$('#minIncrease').click(function() {
		var min = $('#min').val();
		if(min < 999) {
			min++;
			$('#min').val(min);
		}
	});
	$('#maxDecrease').click(function() {
		var max = $('#max').val()-1;
		if(max >= 1) {
			$('#max').val(max);
		}
	});
	$('#maxIncrease').click(function() {
		var max = $('#max').val();
		if(max < 999) {
			max++;
			$('#max').val(max);
		}
	});
});
function chk() {
	var min = $('#min').val();
	var max = $('#max').val();
	if(max < min) {
		alert('최대인원은 최소인원보다 작을 수 없습니다');
		return false;
	}
}
</script>
<script>
	$(function(){	
		CKEDITOR.replace('actInfo', {
			filebrowserUploadUrl: '${conPath}/activityInfoUpload.do'
		});
	});
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
        }
    }).open();
}
</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="activityModify">
		<h2>액티비티 수정</h2>
		<form action="activityModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hId" value="${activity.hId }">
			<input type="hidden" name="actId" value="${activity.actId }">
			<input type="hidden" name="actImg" value="${activity.actImg }">
			<input type="hidden" name="actCno" value="${activity.actCno }">
           	<table>
           		<tr>
           			<th>액티비티명</th>
           			<td>
           				<input type="text" name="actName" required="required" value="${activity.actName }">
           			</td>
           		</tr>
           		<tr>
           			<th>대표 이미지</th>
           			<td>
           				<input type="file" name="actImgstr">
           			</td>
           		</tr>
           		<tr>
           			<th>액티비티 소개글</th>
           			<td>
           				<textarea name="actInfo" id="actInfo" required="required">${activity.actInfo }</textarea>
           			</td>
           		</tr>
           		<tr>
           			<th>진행 장소</th>
           			<td id="address">
           				<input type="text" id="sample6_postcode" name="actAddress1" placeholder="우편번호" value="${activity.actAddress1 }" readonly="readonly" required="required">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" name="actAddress2" readonly="readonly" value="${activity.actAddress2 }" placeholder="주소" required="required"><br>
						<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
           			</td>
           		</tr>
           		<tr>
           			<th>일정별 인원</th>
           			<td id="cnt">
           				<div class="cnt">
							<p>최소</p>
							<div id="minDecrease" class="div">-</div>
							<div>
								<input type="number" name="actMinMember" min="1" max="999" value="${activity.actMinMember }" id="min">
							</div>
							<div id="minIncrease" class="div">+</div>
						</div>
						<div class="cnt">
							<p>최대</p>
							<div id="maxDecrease" class="div">-</div>
							<div>
								<input type="number" name="actMaxMember" min="1" max="999" value="${activity.actMaxMember }" id="max">
							</div>
							<div id="maxIncrease" class="div">+</div>
						</div>
						<div id="clear">
							<p>구매옵션</p>
							<input type="text" name="actOption" value="${activity.actOption }"><br>
							<input type="number" id="price" name="actPrice" min="1000" max="999999" placeholder="1,000~999,999원까지" required="required" value="${activity.actPrice }">원<br>			
							할인율 : <input type="number" id="dis" name="actDiscount" min="0" max="100" value="${activity.actDiscount }">%
						</div>
           			</td>
           		</tr>
           		<tr>
           			<th>포함사항</th>
           			<td>
           				<textarea name="actInclude" placeholder="포함사항을 입력해주세요" required="required">${activity.actInclude }</textarea>
           			</td>
           		</tr>
           		<tr>
           			<th>불포함사항</th>
           			<td>
           				<textarea name="actExclude" placeholder="불포함사항을 입력해주세요" required="required">${activity.actExclude }</textarea>
           			</td>
           		</tr>
           		<tr>
           			<th>준비물</th>
           			<td>
           				<textarea name="actSchedule" placeholder="준비물을 입력해주세요">${activity.actSchedule }</textarea>
           			</td>
           		</tr>
           		<tr>
           			<th>유의사항</th>
           			<td>
           				<textarea name="actPolicy" placeholder="유의사항을 입력해주세요" required="required">${activity.actPolicy }</textarea>
           			</td>
           		</tr>
           	</table>
           	<div id="btn">
	            <input class="btn" type="submit" value="액티비티 수정">
	            <input class="btn" type="button" value="돌아가기" onclick="history.go(-1)">
           	</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>