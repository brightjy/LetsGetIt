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
<link href="${conPath}/css/member.css" rel="stylesheet">
<style></style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script> 





<script>
$( function() {
	   $( ".datepicker" ).datepicker({
		   dateFormat : 'yy-mm-dd',
		   monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		   showMonthAferYear : true,
	   	   yearSuffix : "년",
	   	   showOtherMonths : true,
	   	   dayNamesMin : ['일','월','화','수','목','금','토']
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
	<div id="Wrap">
		<form action="${conPath}/modify.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td class="title">
						회원 정보 수정
					</td>
				</tr>										
				<tr>
					<td class="content">
					<span>아이디</span>&nbsp;&nbsp;
					${member.mId }
					</td>
				</tr>				
				<tr>
					<td class="content">
						<span>비밀번호</span>
						<input type="password" name="mPw" class="mPw" value="${member.mPw }">
					</td>
				</tr>
				<tr>
					<td class="content">
							<span>비밀번호 확인</span>&nbsp;&nbsp; <span id="pwChkResult"></span>
							<input type="password" name="mPwchk" class="mPwchk" value="${member.mPw }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>이름</span>
						<input type="text" name="mName" class="mName" value="${member.mName }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>전화 번호</span>
						<input type="text" name="mPhone" class="mPhone" value="${member.mPhone }">
					</td>
				</tr>
<!-- 				<tr>
					<td>이메일</td>
					<td>
						${member.mEmail }
					<input type="button" class="modifyEmail" value="변경하기">
					</td>
				</tr> -->
				<tr>
					<td class="content">
						<span>이메일</span>&nbsp;&nbsp;<span id="emailConfirmMsg"></span>
						<input type="text" name="mEmail" class="mEmail" value="${member.mEmail }">
						<input type="button" class="emailconfirm" value="중복확인"><br>
						<input type="hidden" id="emailConfirmALLMsg">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p class="postSearch">우편번호</p> 
						<input type="text" id="sample4_postcode" name="mPost" class="text_box"  placeholder="우편번호" value="${member.mPost }">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p>주소</p>
						<input type="text" id="sample4_roadAddress" name="mAddress" class="mAddress" placeholder="도로명주소" value="${member.mAddress }">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td class="content">
						<p>생년월일</p>
						<input type="text" name="mBirth" class="datepicker" value="${member.mBirth }">
					</td>
				</tr>
				<tr>
					<td class="content">
						<p>프로필 사진</p>
						<input type="file" name="file" id="file">
					</td>
				</tr>
				<%-- <tr>
					<td class="content" id="mImg"><c:if test="${empty member.mImg}">
							<div id="img_preview">
								<img src="${conPath }/img/hPhotoDefault120x120.jpg"
									style="border: 1px solid lightgrey; border-radius: 120px; width: 120px; height: 120px"
									id="hPhotoPreview">
							</div>
						</c:if> <c:if test="${not empty member.mImg}">
							<img src="${conPath }/memberUpload/${member.mImg}"
								style="border: 1px solid lightgrey; border-radius: 120px; width: 120px; height: 120px">
						</c:if> <br> <input type="file" name="file" id="file"></td>
				</tr> --%>
				<tr>
					<td colspan="2" class="content">
						<input type="submit" value="정보 수정하기" class="submit">
						<input type="button" value="취소" class="resetbtn" onclick="location.href='${conPath}/main/main.jsp'">			
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>