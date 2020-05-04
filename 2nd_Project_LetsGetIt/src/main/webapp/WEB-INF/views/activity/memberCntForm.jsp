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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<link href="${conPath }/css/memberCntForm.css" rel="stylesheet">
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="memberCnt">
		<h3>액티비티 만들기</h3>
		<form action="activityClude.do" onsubmit="return chk()" method="post">
			<input type="hidden" name="actCno" value="${actCno }">
			<input type="hidden" name="actName" value="${actName }">
			<input type="hidden" name="actImg" value="${actImg }">
			<div id="left">
				<h3>일정별 인원</h3>
				<div class="cnt">
					<p>최소</p>
					<div id="minDecrease">-</div>
					<input type="number" name="actMinMember" min="1" max="999" value="1" id="min">
					<div id="minIncrease">+</div>
				</div>
				<div class="cnt">
					<p>최대</p>
					<div id="maxDecrease">-</div>
					<input type="number" name="actMaxMember" min="1" max="999" value="10" id="max">
					<div id="maxIncrease">+</div>
				</div>
				<div class="clear">
					<h3>구매옵션</h3>
					<input type="text" name="actOption" value="참가비(1인)"><br>
					<input type="number" name="actPrice" min="1000" max="999999" placeholder="1,000~999,999원까지" required="required"><p>원</p><br>			
					<p id="num">할인율 : </p><input type="number" id="dis" name="actDiscount" min="0" max="100" value="0"><p>%</p>
				</div>
				<div id="address">
					<h3>액티비티 진행지</h3>
					<input type="text" id="sample6_postcode" name="actAddress1" placeholder="우편번호" readonly="readonly" required="required">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="actAddress2" readonly="readonly" placeholder="주소" required="required"><br>
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
				</div>
			</div>
			<div id="right">
				<ul>
					<li class="bold">
						일정별 인원
					</li>
					<li>&nbsp;</li>
					<li class="ex">
						예) 액티비티의 인원을 일정별로<br>
						최소 1명 ~ 최대 10명으로 설정하여<br>
						해당 일정에 구매 옵션 상관없이<br>
						10명의 신청을 받을 수 있습니다.
					</li>
					<li>&nbsp;</li>
					<li class="bold">
						옵션명
					</li>
					<li class="ex">
						예) 참가비 (1인) / 참가비(2인)<br>
						기본 옵션 / 선물 포장<br>
						헬스장 이용권 / 헬스장 이용+PT 10회
					</li>
					<li>&nbsp;</li>
					<li class="bold">
						가격
					</li>
					<li class="ex">
						가격은 추가 금액이 아닌 최종 결제 금액입니다.<br>
						예) 1회 이용권 | 30,000원<br>
						10회 이용권 | 280,000원
					</li>
				</ul>
			</div>
			<div id="btn">
				<input class="btn" type="button" value="이전" onclick="history.go(-1)">
				<input class="btn" type="submit" value="다음">
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>