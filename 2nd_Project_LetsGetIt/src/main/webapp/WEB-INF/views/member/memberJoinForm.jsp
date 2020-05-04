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

<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/member.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/member.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- jquery CDN -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script>
/*  $( function() {
	   $("#mBirth").datepicker({
		   dateFormat : 'yy-mm-dd',
		   monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   showMonthAferYear : true,
	   	   yearSuffix : "년",
	   	   showOtherMonths : true,
	   	   dayNamesMin : ['일','월','화','수','목','금','토'] 
	   });
	}); */ 
	$(document).ready(function(){
		$('.member_idconfirm').click(function(){
			var mId =  $('.mId').val();
			$.ajax({
	            async: true,
	            type : 'POST',
	            data : mId,
	            url : '${conPath}/member_idconfirm.do',
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
				success : function(data, status){
					var textColor = "";	//메세지 글자색
					
					if(data.idConfirm == 1){
						$('#idConfirmMsg').text("중복된 ID입니다. 사용불가");
						textColor = "red";
					}else{
						$('#idConfirmMsg').text("사용가능한 ID입니다");
						textColor = "black";
					}
					//글자색 바꾸기
					$('#idConfirmMsg').css("color",textColor)
				},
	            error : function(error) {
	            	console.log(error);
	            }
			});
		});
		
		$('form').submit(function(){
			var idConfirmResult = $('#idConfirmMsg').text().trim();
			console.log(idConfirmResult);
			
			if(idConfirmResult!='사용가능한 ID입니다'){
				alert('사용가능한 ID인지 중복확인후 가입가능');
				$('input[name="mId"]').focus();
				return false;
			}
		});
	});
	$(document).ready(function(){
		$('.member_emailconfirm').click(function(){
			var mEmail =  $('.mEmail').val();
			$.ajax({
	            async: true,
	            type : 'POST',
	            data : mEmail,
	            url : '${conPath}/member_emailconfirm.do',
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
				success : function(data, status){
					var textColor = "";	//메세지 글자색
					
					if(data.emailConfirm == 1){
						$('#emailConfirmMsg').text("중복된 EMAIL입니다. 사용불가");
						textColor = "red";
					}else{
						$('#emailConfirmMsg').text("사용가능한 EMAIL입니다");
						textColor = "black";
					}
					//글자색 바꾸기
					$('#emailConfirmMsg').css("color",textColor)
				},
	            error : function(error) {
	            	console.log(error);
	            }
			});
		});
		
		$('form').submit(function(){
			var emailConfirmResult = $('#emailConfirmMsg').text().trim();
			console.log(emailConfirmResult);
			
			if(emailConfirmResult!='사용가능한 EMAIL입니다'){
				alert('사용가능한 EMAIL인지 중복확인후 가입가능');
				$('input[name="mEmail"]').focus();
				return false;
			}
		});
	});
	$(document).ready(function(){
		
		/* $('.mId').keyup(function(){
			var mId = $('.mId').val();
			
			$.ajax({
				url : '${conPath}/idConfirm.do',
				dataType : 'html',
				data : "mId="+mId,
				success : function(data){
						$('#idConfirmResult').html(mId+data);
				}
			});
		}); */
		
		$('.mPwchk').keyup(function(){
			var mPw = $('.mPw').val();
			var mPwchk = $(this).val();
			if(mPw == mPwchk){
				$('#pwChkResult').html('비밀번호 일치');
			}else{
				$('#pwChkResult').html('비밀번호 불일치');
			}
		});
		
		$('form').submit(function(){
			 var idPattern = /^[a-zA-Z0-9]{4,12}$/;
		     var pwPattern = /^[a-zA-Z0-9]{4,12}$/;
		     var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		     var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		   
		       if($('.mId').val()==''){
		           alert("ID를 입력하세요");
		           $('.mId').focus();
		           return false;
		       }
		       if(!idPattern.test($('.mId').val())) {
		           alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력");
		           $('.mId').focus();
		           return false;
		       }
		       if($('.mPw').val()==''){
			       alert("비밀번호를 입력하세요");
			       $('.mPw').focus();
			       return false;
			   }
		       if($('.mPwchk').val()==''){
			       alert("비밀번호를 입력하세요");
			       $('.mPwchk').focus();
			       return false;
			   }
		       if($('.mPw').val()!=$('.mPwchk').val()){
		    	   alert("비밀번호가 다릅니다.");
		    	   $('.mPwchk').focus();
			       return false;
		       }
		       if(!pwPattern.test($('.mPw').val())){
		    	   alert("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력 ");
		    	   $('.mPw').focus();
			       return false;
		       }
		       if($('.mEmail').val()==''){
			       alert("e-mail 를 입력하세요");
			       $('.mEmail').focus();
			       return false;
			   }
		       if(!emailPattern.test($('.mEmail').val())){
		    	   alert("e-mail을 잘못입력하셨습니다 ");
		    	   $('.mEmail').focus();
			       return false;
		       }
		       if($('.mPhone').val()==''){
			       alert("전화번호를 입력하세요");
			       return false;
			       $('.mPhone').focus();
			   }
		       if(!phonePattern.test($('.mPhone').val())){
		    	   alert("전화번호(-)빼고 입력 ");
		    	   $('.mPhone').focus();
			       return false;
		       }
		       if($('.mName').val()==''){
			       alert("이름을 입력하세요");
			       return false;
			       $('.mName').focus();
			   }
		       
		});
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<section style="height:2000px;">
	<div id="joinWrap">
			<form action="${conPath}/join.do" method="post" enctype="multipart/form-data">
			<div id="joinTop">
				<table>
					<tr>
						<td colspan="2" class="title">
							회원가입
						</td>
					</tr>				
				</table>
			</div>
			<div id="joinLeft" style="width:100%;">
				<table>
					<tr>
						<td class="content">
							<span>아이디</span>&nbsp;&nbsp;<span id="idConfirmMsg" class="msg"></span>
							<input type="text" name="mId" class="mId" placeholder="(4~12자의 영문자와 숫자로만 입력)">
							<input type="button" class="member_idconfirm" value="중복확인"><br>
							<input type="hidden" id="idConfirmALLMsg">
						</td>
					</tr>
					<tr>
						<td class="content">
							<span>비밀번호</span>
							<input type="password" name="mPw" class="mPw">
						</td>
					</tr>
					<tr>
						<td class="content">
							<span>비밀번호 확인</span>&nbsp;&nbsp; <span id="pwChkResult"></span>
							<input type="password" name="mPwchk" class="mPwchk">
						</td>
					</tr>
					<tr>
						<td class="content">
							<span>이름</span>
							<input type="text" name="mName" class="mName">
						</td>
					</tr>
					<tr>
						<td class="content">
							<span>전화 번호</span>
							<input type="text" name="mPhone" class="mPhone" >
						</td>
					</tr>
					<tr>
						<td class="content">
							<span>이메일</span>&nbsp;&nbsp;<span id="emailConfirmMsg"></span>
							<input type="text" name="mEmail" class="mEmail" >
							<input type="button" class="member_emailconfirm" value="중복확인"><br>
							<input type="hidden" id="emailConfirmALLMsg">
						</td>
					</tr>
					<tr>
						<td class="content">
							<p class="postSearch">우편번호</p> 
							<input type="text" id="sample4_postcode" name="mPost" class="text_box"  placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td class="content">
							<p>주소</p>
							<input type="text" id="sample4_roadAddress" name="mAddress" class="mAddress" placeholder="도로명주소">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide"></span>
						</td>
					</tr>
					
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
 $( function() {
	   $("#mBirth").datepicker({
		   dateFormat : 'yy-mm-dd',
		   changeYear:true,
		   monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   showMonthAferYear : true,
	   	   yearSuffix : "년",
	   	   showOtherMonths : true,
	   	   dayNamesMin : ['일','월','화','수','목','금','토'] 
	   });
	}); 
 </script>
					<tr>
						<td class="content">
							<p>생년월일</p>
							<input type="text" name="mBirth" id="mBirth" class="datepicker" >
						</td>
					</tr>				
				</table>
			</div>
			<input type="submit" value="회원가입" id="submit">
			<input type="button" value="취소" class="resetbtn" onclick="location.href='${conPath}/main.do'">	
			</form>
		</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>