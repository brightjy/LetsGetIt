<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/main.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/main.css" />
<style>
nav, #nav, #navv, #navvv { position: fixed; top: 0; left: -100%; height: 100%; width: 100%; background-color: rgba( 0, 0, 0, 0.5 ); z-index: 99999; transition: .5s;}
nav.open, #nav.open, #navv.open, #navvv.open {position: fixed;top: 0;left: 0;height: 100%;width: 100%;background-color: rgba( 0, 0, 0, 0.5 );z-index: 99999;transition: .5s;}
#close_nav, #close_nav2, #close_nav3, #close_nav4 {position: absolute;top: 10px;right: 10px;float: left;width: 30px;height: 30px;cursor: pointer;color:white;}
#close_nav span, #close_nav2 span, #close_nav3 span, #close_nav4 span {position: absolute;width: 100%;height: 2px;top: 14px;background: white;display: block;font-weight:bold;}
#close_nav span:first-child, #close_nav2 span:first-child, #close_nav3 span:first-child, #close_nav4 span:first-child {transform: rotate(45deg);}
#close_nav span:last-child, #close_nav2 span:last-child, #close_nav3 span:last-child, #close_nav4 span:last-child {transform: rotate(-45deg);}
#nav_gnb, #nav_gnb2, #nav_gnb3, #nav_gnb4{position: absolute;width:50%;padding:5% 0;text-align: center;border:5px solid white;top:50%;left:50%;transform:translate(-50%, -50%);}
#nav_gnb a, #nav_gnb2 a, #nav_gnb3 a, #nav_gnb4 a {color: white;font-size: 1.5em;font-weight:bold;display:block;margin: 10px 0;}
</style>
<link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function (){
	$("#lnb_menubtn").click(function(){
		$('nav').addClass('open');
	});
	$("#close_nav").click(function(){
		$('nav').removeClass('open');
	});
	$("#lnb_menubtn2").click(function(){
		$('#nav').addClass('open');
	});
	$("#close_nav2").click(function(){
		$('#nav').removeClass('open');
	});
	$("#lnb_menubtn3").click(function(){
		$('#navv').addClass('open');
	});
	$("#close_nav3").click(function(){
		$('#navv').removeClass('open');
	});
	$("#lnb_menubtn4").click(function(){
		$('#navvv').addClass('open');
	});
	$("#close_nav4").click(function(){
		$('#navvv').removeClass('open');
	});
});
</script>
</head>
<body>
<header>
	<div id="top">
		<div class="left">
			<a href="${conPath }/main.do"><span>¡</span>Let's get it!</a>			
		</div>
		<div class="center">
			<form action="${conPath }/activityAllList.do" method="get" class="form">
				<input type="text" name="searchText" placeholder="하고 싶은 액티비티를 검색해보세요 :D" value="${param.searchText }">
				<input type="submit" value="">
			</form>
		</div>
		<div class="right">
			<div class="dropAll">
			<div class="drop">
				<c:if test="${empty member && empty host && empty admin }">
					<a class="topMenu" href="${conPath }/memberLoginForm.do">멤버 로그인</a>
				</c:if>
				<c:if test="${not empty member }">
					<a href="#" id="lnb_menubtn">${member.mName }님</a>
				</c:if>	
				<c:if test="${not empty host }">
					<a href="#" id="lnb_menubtn3">${host.hName }님</a>
				</c:if>	
				<c:if test="${not empty admin }">
					<a href="#" id="lnb_menubtn4">${admin.aName }님</a>
				</c:if>
			</div>
			<c:if test="${empty member && empty host && empty admin }">
				<div class="drop">
					<a class="topMenu" href="${conPath }/hostLoginForm.do">호스트 로그인</a>
				</div>
			</c:if>
			<div class="drop">
				<a href="#" id="lnb_menubtn2">고객센터</a>				
			</div>
				<c:if test="${not empty member }">
					<div class="drop">
						<a class="topMenu" href="${conPath }/memberLogout.do">로그아웃</a>
					</div>
				</c:if>
				<c:if test="${not empty host }">
					<div class="drop">
						<a class="topMenu" href="${conPath }/hostLogout.do">로그아웃</a>
					</div>
				</c:if>
				<c:if test="${not empty admin }">
					<div class="drop">
						<a class="topMenu" href="${conPath }/adminLogout.do">로그아웃</a>
					</div>
				</c:if>
		</div>
		</div>
	</div>
</header>
<nav>
	<div id="close_nav">
		<span></span>
		<span></span>
	</div>
	<div id="nav_gnb">
		<a href="${conPath }/memberModify.do">프로필 수정하기</a>
		<a href="${conPath }/memberLikeActCateForm.do">관심사 설정하기</a>
		<a href="${conPath }/likeactivityList.do">좋아한 액티비티</a>
		<a href="${conPath }/memberlikeHostList.do">좋아한 호스트</a>
		<a href="${conPath }/myActivityList.do?mId=${member.mId}">예약한 액티비티</a>
		<a href="${conPath }/myCouponList.do?mId=${member.mId}">쿠폰함 보기</a>
		<a href="${conPath }/myReviewList.do?mId=${member.mId}">후기 보기</a>
	</div>
</nav>
<div id="nav">
	<div id="close_nav2">
		<span></span>
		<span></span>
	</div>
	<div id="nav_gnb2">
		<a href="${conPath }/noticeAllList.do">공지/이벤트 </a>
		<a href="${conPath }/adminQnaList.do">QnA</a>
	</div>
</div>
<div id="navv">
	<div id="close_nav3">
		<span></span>
		<span></span>
	</div>
	<div id="nav_gnb3">
		<a href="${conPath }/hostModifyForm.do">프로필 수정하기</a>
		<a href="${conPath }/activityWriteForm.do">액티비티 만들기</a>
		<a href="${conPath }/hostActivityList.do?hId=${host.hId}">내 액티비티 보기</a>
		<a href="${conPath }/myActivityReserveList.do?hId=${host.hId}">예약 관리하기</a>
		<a href="${conPath }/myActivityCheckList.do?hId=${host.hId}">출석 관리하기</a>
	</div>
</div>
<div id="navvv">
	<div id="close_nav4">
		<span></span>
		<span></span>
	</div>
	<div id="nav_gnb4">
		<a href="${conPath }/couponWriteForm.do">쿠폰 생성 하기</a>
		<a href="${conPath }/couponList.do">쿠폰 리스트 보기</a>
		<a href="${conPath }/adminQnaList.do">QnA 관리 하기</a>
		<a href="${conPath }/noticeList.do">공지사항 관리하기</a>
		<a href="${conPath }/eventList.do">이벤트 관리하기 </a>	
	</div>
</div>

</body>
</html>