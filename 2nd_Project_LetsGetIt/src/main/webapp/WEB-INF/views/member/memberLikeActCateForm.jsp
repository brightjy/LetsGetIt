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
<style>
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$('button').click(function(){
		var actCate4 = $(this).html();
		location.href="${conPath}/memberLikeActCate.do?actCategory4="+actCate4;
	});	
});
</script>
</head>
<body>
<c:if test="${not empty resultMsg }">
	<script>
		alert('${resultMsg}');
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>
<section>
	<div id="LikeCateWrap">
			<table>
				<tr>
					<td class="title">
						관심사 설정하기
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>스포츠·아웃도어</span>
						<p>
							<c:forEach var="actCate" items="${ allCateList}">
								<c:if test="${actCate.actCategory2 eq '액티비티' && actCate.actCategory3 eq '스포츠' || actCate.actCategory3 eq '아웃도어' }">
									<button
										<c:set var="actCno" value="${actCate.tempActCno }"/>
 										<c:if test="${myList.indexOf(actCno)!=-1 }">class="selected"</c:if>
										<c:if test="${myList.indexOf(actCno) eq -1 }">class="unSelected"</c:if>
									>${actCate.actCategory4 }</button>
								</c:if>
							</c:forEach>
						</p>
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>요리</span>
						<p>
							<c:forEach var="actCate" items="${ allCateList}">
								<c:if test="${actCate.actCategory3 eq '요리' }">
									<button 
										<c:set var="actCno" value="${actCate.tempActCno }"/>
 										<c:if test="${myList.indexOf(actCno)!=-1 }">class="selected"</c:if>
										<c:if test="${myList.indexOf(actCno) eq -1 }">class="unSelected"</c:if>									
                                    >${actCate.actCategory4 }</button>
								</c:if>
							</c:forEach>
						</p>
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>사진ㆍ영상ㆍ미술ㆍ음악</span>
						<p>
							<c:forEach var="actCate" items="${ allCateList}">
								<c:if test="${actCate.actCategory3 eq '사진ㆍ영상' || actCate.actCategory3 eq '미술ㆍ드로잉' || actCate.actCategory3 eq '음악ㆍ예술' }">
									<button 
										<c:set var="actCno" value="${actCate.tempActCno }"/>
 										<c:if test="${myList.indexOf(actCno)!=-1 }">class="selected"</c:if>
										<c:if test="${myList.indexOf(actCno) eq -1 }">class="unSelected"</c:if>	
									>${actCate.actCategory4 }</button>
								</c:if>
							</c:forEach>
						</p>
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>공예ㆍDIY</span>
						<p>
							<c:forEach var="actCate" items="${ allCateList}">
								<c:if test="${actCate.actCategory3 eq '공예ㆍDIY' }">
									<button 
										<c:set var="actCno" value="${actCate.tempActCno }"/>
 										<c:if test="${myList.indexOf(actCno)!=-1 }">class="selected"</c:if>
										<c:if test="${myList.indexOf(actCno) eq -1 }">class="unSelected"</c:if>	
									>${actCate.actCategory4 }</button>
								</c:if>
							</c:forEach>
						</p>
					</td>
				</tr>
				<tr>
					<td class="content">
						<span>어학</span>
						<p>
							<c:forEach var="actCate" items="${ allCateList}">
								<c:if test="${actCate.actCategory3 eq '어학' }">
									<button 
										<c:set var="actCno" value="${actCate.tempActCno }"/>
 										<c:if test="${myList.indexOf(actCno)!=-1 }">class="selected"</c:if>
										<c:if test="${myList.indexOf(actCno) eq -1 }">class="unSelected"</c:if>	
									>${actCate.actCategory4 }</button>
								</c:if>
							</c:forEach>
						</p>
					</td>
				</tr>
				<tr>
					<td class="title">

					</td>
				</tr>
				<tr>
					<td class="content" style="font-size:0.8em;">
						*저장한 관심사에 맞는 추천 액티비티를 첫 화면에서 알려드립니다.
					</td>
				</tr>
			</table>				
	</div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>