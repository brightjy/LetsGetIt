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
<link  rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function (){

	$('#body').ready(function realTime(){
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		
		hours=addZero(hours);
		minutes=addZero(minutes);
		seconds=addZero(seconds);
		
		$('#clock').html(hours+":"+minutes+":"+seconds);
		$('#clock').css('float','right');
		
		setTimeout(function(){
			realTime();
		},500);
		
		function addZero(i){
			if(i<10){
				i="0"+i;
			}
			return i;
		}
	});	
});
function tdClicked(actId){
	location.href='${conPath }/activityDetail.do?actId='+actId+'&pageNum=${paging.currentPage}';
}
</script>
</head>
<c:if test="${not empty result }">
	<script>
		alert('${result}');
	</script>
</c:if>
<c:if test="${not empty modifyResult }">
	<script>
		alert('프로필이 수정되었습니다.');
	</script>
</c:if>
<body id="body">
<jsp:include page="header.jsp"/>
	<div id="main">
		<div class="left">
			<div class="title">
				실시간 <span>BEST</span>
				<span id="clock"> </span>
			</div>
			<div class="content">
				<table>
					<c:set var="i" value="1"/>
					<c:forEach var="act" items="${activityLikeBestList }">
					<tr>
						<th>
							${i}
						</th>
						<td onclick="tdClicked(${act.actId})">
							${act.actName }
						</td>
					</tr>
					<c:set var="i" value="${i+1 }"/>				
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="right">
			<div class="nav">
			 	인기 카테고리
			</div>
			<div class="category">
				<table>
					<tr>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="어학">
								<input type="submit" value="" id="firstSubmitBtn">
							</form>
						</td>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="요리">
								<input type="submit" value="" id="secondSubmitBtn">
							</form>
						</td>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="아웃도어">
								<input type="submit" value="" id="thirdSubmitBtn">
							</form>
						</td>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="공예ㆍDIY">
								<input type="submit" value="" id="firthSubmitBtn">
							</form>
						</td>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="스포츠">
								<input type="submit" value="" id="fifthSubmitBtn">
							</form>
						</td>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="음악ㆍ예술">
								<input type="submit" value="" id="sixthSubmitBtn">
							</form>
						</td>
						<td>
							<form action="${conPath }/activityBestCateList.do" method="get">
								<input type="hidden" name="actCategory3" value="투어ㆍ관람">
								<input type="submit" value="" id="seventhSubmitBtn">
							</form>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${conPath }/cate1.do">
			 					어학
			 				</a>
						</td>
						<td>
							<a href="${conPath }/cate2.do">
			 					요리
			 				</a>
						</td>
						<td>
							<a href="${conPath }/cate3.do">
			 					아웃도어
			 				</a>
						</td>
						<td>
							<a href="${conPath }/cate4.do">
			 					공예·DIY
			 				</a>
						</td>
						<td>
							<a href="${conPath }/cate5.do">
			 					스포츠
			 				</a>
						</td>
						<td>
							<a href="${conPath }/cate6.do">
			 					예술
			 				</a>
						</td>
						<td>
							<a href="${conPath }/cate7.do">
			 					투어
			 				</a>
						</td>
					</tr>
				</table>
			</div>
			<c:if test="${not empty member }">		
			<div class="list">
				<div class="nav">
			 		관심 추천 액티비티	
			 		<c:if test="${customizedTotal==0 }">
			 		</c:if>
			 		<c:if test="${customizedTotal!=0 }">
			 			<span><a href="${conPath }/memberCustomizedActListAll.do">전체보기</a></span>	
			 		</c:if>		
				</div>
				<div class="content">
					<div id="list">
						<div class="activity">
 							<c:if test="${customizedTotal==0 }">
								관심사를 설정해보세요! 회원님께 꼭 맞는 액티비티를 추천해드립니다. 
 							</c:if>
							<c:if test="${customizedTotal!=0 }">
								<c:forEach var="act" items="${memberCustomizedActList }" begin="0" end="3">
									<div class="tr" onclick="tdClicked(${act.actId})">
										<div class="actImg">
											<img src="${conPath }/actImg/${act.actImg}" alt="대표이미지">
										</div>
										<div class="actName">
											<span>${act.actName }</span>
										</div>
										<div class="actPrice">
											<c:if test="${act.actDiscount!=0 }">
												<span class="discountPrice">
													<c:set var="discountPrice" value="${act.actPrice*(1-(act.actDiscount/100)) }"/>
													<fmt:formatNumber value="${discountPrice }" pattern="#,###,###" />원
												</span>
												<span class="originalPrice">
													<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>
												</span>
											</c:if>
											<c:if test="${act.actDiscount==0 }">
												<span class="discountPrice">
													<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>원
												</span>				
											</c:if>
										</div>
										<div class="actGrade">
											<span id="star">★</span>
											<span><fmt:formatNumber value="${act.actGrade }" pattern="0.0"/>점</span>
										</div>	
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			<div class="list">
				<div class="nav">
			 		NEW 신규 액티비티	
			 		<c:if test="${actTotal!=0 }">
			 			<span><a href="${conPath }/activityNewList.do">전체보기</a></span>			
			 		</c:if>
			 		<c:if test="${actTotal==0 }">
			 		</c:if>
				</div>
				<div class="content">
					<div id="list">
						<div class="activity">
							<c:forEach var="act" items="${activityNewList }" begin="0" end="3">
								<div class="tr" onclick="tdClicked(${act.actId})">
									<div class="actImg">
										<img src="${conPath }/actImg/${act.actImg}" alt="대표이미지">
									</div>
									<div class="actName">
										<span>${act.actName }</span>
									</div>
									<div class="actPrice">
										<c:if test="${act.actDiscount!=0 }">
											<span class="discountPrice">
												<c:set var="discountPrice" value="${act.actPrice*(1-(act.actDiscount/100)) }"/>
												<fmt:formatNumber value="${discountPrice }" pattern="#,###,###" />원
											</span>
											<span class="originalPrice">
												<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>
											</span>
										</c:if>
										<c:if test="${act.actDiscount==0 }">
											<span class="discountPrice">
												<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>원
											</span>				
										</c:if>
									</div>
									<div class="actGrade">
										<span id="star">★</span>
										<span><fmt:formatNumber value="${act.actGrade }" pattern="0.0"/>점</span>
									</div>	
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="list">
			 	<div class="nav">
			 		BEST 호스트 액티비티
			 		<c:if test="${actTotal!=0 }">
			 			<span><a href="${conPath }/activityBestHostList.do">전체보기</a></span>
			 		</c:if>
			 		<c:if test="${actTotal==0 }">
			 		</c:if>
				</div>
				<div class="content">
					<div id="list">
						<div class="activity">
							<c:forEach var="act" items="${activityBestHostList }" begin="0" end="3">
								<div class="tr" onclick="tdClicked(${act.actId})">
									<div class="actImg">
										<img src="${conPath }/actImg/${act.actImg}" alt="대표이미지">
									</div>
									<div class="actName">
										<span>${act.actName }</span>
									</div>
									<div class="actPrice">
										<c:if test="${act.actDiscount!=0 }">
											<span class="discountPrice">
												<c:set var="discountPrice" value="${act.actPrice*(1-(act.actDiscount/100)) }"/>
												<fmt:formatNumber value="${discountPrice }" pattern="#,###,###" />원
											</span>
											<span class="originalPrice">
												<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>
											</span>
										</c:if>
										<c:if test="${act.actDiscount==0 }">
											<span class="discountPrice">
												<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>원
											</span>				
										</c:if>
									</div>
									<div class="actGrade">
										<span id="star">★</span>
										<span><fmt:formatNumber value="${act.actGrade }" pattern="0.0"/>점</span>
									</div>	
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>