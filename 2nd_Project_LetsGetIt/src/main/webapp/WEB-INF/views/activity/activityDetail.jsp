<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" media="(min-width:640px)" href="${conPath }/css/activityDetail.css" />
<link rel="stylesheet" media="(max-width:640px)" href="${conPath }/css/activityDetail.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
<script>
$(document).ready(function(){
   $("#likeBtn").click(function(){
	   location.href="${conPath}/activityLike.do?actId=${activity.actId}";
   });
});
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvFiptnQcE-C2ASnwE_yQhp-hNI6m1lZU&callback=initMap">
</script>
<script>
	function initMap() {
	var map = new google.maps.Map(document.getElementById('map'));;
    var geocoder = new google.maps.Geocoder();
    	geocodeAddress(geocoder, map);
	function geocodeAddress(geocoder, resultMap) {
	    geocoder.geocode({'address': '${activity.actAddress2 }'}, function(result, status) {
	        if (status === 'OK') {	
	            resultMap.setCenter(result[0].geometry.location);
	            resultMap.setZoom(18);
	            var marker = new google.maps.Marker({
	                map: resultMap,
	                position: result[0].geometry.location
	            });
	        } else {
	            alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
	        }
	    });
	}
}
	
function tdClicked(actId){
	location.href='${conPath }/activityDetail.do?actId='+actId+'&pageNum=${paging.currentPage}';
}

function clickDate(index){
	
	$("#actDate").val($("#input_date_"+index).val());
	$("#a_Qty").val("1");
	if($("#input_maxQty_"+index).val() == "0"){
		$("#commit").hide();
		$("#MAX_QTY").val("0");
		$("#deadline").show();
	}else{
		$("#MAX_QTY").val($("#input_maxQty_"+index).val());
		$("#commit").show();
		$("#deadline").hide();
	}
	
	
	$("#eNo").val($("#input_eNo_"+index).val());
	var color = "#F0FFF0"; //배경색
	
	for(var i=1; i <= ${fn:length(actEventDate)}; i++) {
		document.getElementById('a_date_'+i).style.backgroundColor  =  "";
	}
	
	document.getElementById('a_date_'+index).style.backgroundColor  =  color;

}
function QtyControl(flag) {
	var qty = parseInt($("#input_oQty").val());
	var maxQty = parseInt($("#MAX_QTY").val());
	
	if(qty != maxQty && maxQty != 0 || (flag == "-" && qty != 1)){
		switch(flag){
			case "-":
				qty = qty - 1;
				if(qty <= 0){
					qty = 1;
				}
				break;
				
			case "+":
				qty = qty + 1;
				break;
		}
		$("#a_Qty").val(qty);
		$("#input_oQty").val(qty);
	}
}

</script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
function shareKaKaotalk(){
	Kakao.init("92d44bde3b76e4a839662cabb5193dc9");
	Kakao.Link.sendDefault({
		objectType:"feed",
		content:{
			title:"${activity.actName}",
			description:"${activity.actLike} 명이 좋아한 액티비티를 만나보세요.",
			imageUrl:"../img/${activity.actImg}",
			link:{
				mobileWebUrl:"http://localhost:8181/pj/activityDetail.do?actId=${activity.actId}",
			}
		},
		buttons:[
            {
                title:"액티비티 보러가기!",
              	link: {
                    mobileWebUrl:"http://localhost:8181/pj/activityDetail.do?actId=${activity.actId}",
                  	webUrl:"http://localhost:8181/pj/activityDetail.do?actId=${activity.actId}"
              }
          }
      ]
	});
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<c:if test="${not empty result }">
<script>
	alert('${result}');
</script>
</c:if>
<c:if test="${not empty likeResultMsg }">
<script>
	alert('${likeResultMsg}');
</script>
</c:if>
<div id="wrap">
	<div id="top">
		<div id="left">
			<div id="actImg">
				<img src="${conPath }/actImg/${activity.actImg}" alt="대표이미지">
			</div>
			<div id="notImg">
				<div class="block">
					<div id="actName">
						${activity.actName }
					</div>
					<div class="likeShareBtn">
						<c:if test="${ not empty member && checkResult==0}">
							<img src="${conPath }/img/like_before.png" alt="좋아하기버튼" id="likeBtn">						
						</c:if>
						<c:if test="${ not empty member && checkResult!=0}">
							<img src="${conPath }/img/like_after.png" alt="좋아하기버튼" id="likeBtn">						
						</c:if>
						<img src="${conPath }/img/share.png" alt="공유하기버튼" id="shareBtn" onClick="shareKaKaotalk();">
					</div>
					<div id="actPrice">
						<c:if test="${activity.actDiscount!=0 }">
							<span class="discountPrice">
								<c:set var="discountPrice" value="${activity.actPrice*(1-(activity.actDiscount/100)) }"/>
								<fmt:formatNumber value="${discountPrice }" pattern="#,###,###" />원
							</span>
							<span class="originalPrice">
								<fmt:formatNumber value="${activity.actPrice }" pattern="#,###,###"/>
							</span>
						</c:if>
						<c:if test="${act.actDiscount==0 }">
							<span class="originalPrice">
								<fmt:formatNumber value="${activity.actPrice }" pattern="#,###,###"/>원
							</span>				
						</c:if>
					</div>
				</div>
				<div class="block">
					<div id="summary">
						<table>
							<tr>
								<td class="img">
									<img src="${conPath }/img/like_after.png" alt="좋아하기">
								</td>
								<td class="text">
									${activity.actLike }명이 좋아한 액티비티								
								</td>
							</tr>
							<tr>
								<td class="img">
									<img src="${conPath }/img/place.png" alt="장소">
								</td>
								<td class="text">
									${activity.actAddress2 }							
								</td>
							</tr>
							<tr>
								<td class="img">
									<img src="${conPath }/img/star.png" alt="별">
								</td>
								<td class="text">
									평점 
									<fmt:formatNumber value="${activity.actGrade }" pattern="0.0"/>													
								</td>
							</tr>
							<tr>
								<td class="img">
									<img src="${conPath }/img/user.png" alt="유저">
								</td>
								<td class="text">
									최소 인원 
									${activity.actMinMember }명
									~
									최대 인원
									${activity.actMaxMember }명										
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="hostInfo">
						<table>
							<tr>
								<th colspan="2" >
									호스트
								</th>
							</tr>
							<tr>
								<td id="hPhoto">
									<c:if test="${empty activity.hPhoto}">
										<img src="${conPath }/upload/hPhotoDefault120x120.jpg" alt="호스트이미지">
									</c:if>
									<c:if test="${not empty activity.hPhoto}">
										<img src="${conPath }/upload/${activity.hPhoto}" alt="호스트이미지">
									</c:if>
								</td>
								<td class="text">
									<span class="bold">${activity.hName }</span> &nbsp; 
									<span class="small">좋아요  ${activity.hCntLike }개</span>
								</td>
							</tr>
						</table>
						<button onclick="location.href='${conPath}/hostDetail.do?hId=${activity.hId}'">호스트 상세 보기</button>
					</div>
				</div>
				<c:if test="${reviewCnt!=0 }">
					<div class="block">
						<div id="hostInfo">
							<table>
								<tr>
									<th colspan="2" >
										후기
									</th>
								</tr>
								<tr>
									<td>
									 	<jsp:include page="../activity/reviewList.jsp"/>
										<button onclick="location.href='${conPath }/activityReviewAllList.do?actId=${activity.actId}&hId=${activity.hId }'">${reviewCnt }개 후기 모두 보기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</c:if>
				<div class="block">
					<div id="activityInfo">
						<table>
							<tr>
								<th>
									액티비티 소개
								</th>
							</tr>
							<tr>
								<td class="text">
									${activity.actInfo }
								</td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="actInclude">
						<table>
							<tr>
								<th>
									포함사항
								</th>
							</tr>
							<tr>
								<td class="text">
									${activity.actInclude }
								</td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="actExclude">
						<table>
							<tr>
								<th>
									불포함사항
								</th>
							</tr>
							<tr>
								<td class="text">
									${activity.actExclude }
								</td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="actSchedule">
						<table>
							<tr>
								<th>
									세부일정
								</th>
							</tr>
							<tr>
								<td class="text">
									${activity.actSchedule }
								</td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="actPolicy">
						<table>
							<tr>
								<th>
									기타 유의사항
								</th>
							</tr>
							<tr>
								<td class="text">
									${activity.actPolicy }
								</td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="actPlace">
						<table>
							<tr>
								<th>
									진행 장소
								</th>
							</tr>
							<tr>
								<td class="text">
									<span id="address">${activity.actAddress2 }</span>
									<div id="map"></div>							   
								</td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="block">
					<div id="hostInfo">
						<table>
							<tr>
								<th colspan="2" class="hostQna">
<%-- 									<a href="${conPath }/hostQnaList.do?&actId=${activity.actId}">문의 하기 &nbsp; 〉</a> --%>
									<button onclick="location.href='${conPath }/hostQnaList.do?&actId=${activity.actId}'">문의 하기</button>
								</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
				<div id="right">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		 $( function() {
		   $( "#accordion" ).accordion({
			   heightStyle: "content"
		   });
		   
		   $( "#datepicker" ).datepicker({ onSelect: function(dateText) { 
			   var date_Array = this.value.split("/");
			   
		 	}});
		   });
		 
		</script>
			<form action="${conPath }/addOrder.do">
				<input type="hidden" id="actDate" value=""> 
				<input type="hidden" name ="eNo"id="eNo"  value="">
				<input type="hidden" name="actImg"id="input_actImg" value="${activity.actImg}">
				<input type="hidden" name="oPrice"id="input_actPrice" value="${actEventDate[0].actPrice}">
				<input type="hidden" name="oQty"id="input_oQty" value="1">
				<input type="hidden" name="actId"id="input_actId" value="${actEventDate[0].actId}">
				<input type="hidden" name="actName"id="input_actName" value="${activity.actName}">
				<input type="hidden" name="MAX_QTY"id="MAX_QTY" value="">
				<input type="hidden" name="hId" value="${activity.hId }">
				<input type="hidden" name="mId" value="${member.mId }">
			<div id="accordion">
				<h3>일정 <span>| 달력에서 보기</span></h3>
				<div>
					<p><div id="datepicker"></div></p>
				</div>
				<h3>일정 <span>| 리스트로 보기</span></h3>
 				<div id="eventDate">
					<c:forEach var="date" items="${actEventDate}" varStatus="status">
						<input type="hidden" id="input_maxQty_${status.count}" value="${date.MAX_QTY}">
						<input type="hidden" id="input_date_${status.count}" value="${date.actStartdate}">
						<input type="hidden" id="input_eNo_${status.count}" value="${date.eNo}">
						<a id ="a_date_${status.count}" onclick="clickDate('${status.count}');"><fmt:formatDate value="${date.actStartdate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></a>	
					</c:forEach>
				</div>
				<h3>참가비 <span>| 기본옵션</span></h3>
				
				<div id="eventDate">
					<div style="display:inline; width:541px;">
						<a >
							<fmt:formatNumber value="${actEventDate[0].actPrice}" pattern="#,###,###" />원						
						</a>
					</div>
					<input type="button" value="-" onclick="QtyControl('-');" >
					<input type="text" id = "a_Qty" value="1" disabled />
					<input type="button" value="+" onclick="QtyControl('+');" >
				</div>
			</div>
			<input type="submit" id="commit" value="참여하기" style="display:none">
	 		<div id="eventDate" >
	 			<div id="deadline" style="display:none">
		 		<a>마감
		 		</a>
		 		</div>
	 		</div>
			</form>
		</div>
	</div>
	<div id="bottom">
		<table>
			<tr>
				<th>
					이런 액티비티는 어때요?
				</th>
			</tr>
			<tr>
				<td class="text">
					<div class="content">
						<div id="list">
							<div class="activity">
								<c:forEach var="act" items="${activitySameCate3List }" begin="0" end="3">
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
											<span><fmt:formatNumber value="${act.actGrade }" pattern="#.#"/>점</span>
										</div>	
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
<%-- 		<table class="activity">
			<tr>
				<c:forEach var="act" items="${activitySameCate3List }" begin="0" end="3">
					<td onclick="tdClicked(${act.actId})">
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
								<span class="originalPrice">
									<fmt:formatNumber value="${act.actPrice }" pattern="#,###,###"/>원
								</span>				
							</c:if>
						</div>
						<div class="actGrade">
							<span id="star">★</span>
							<span>${act.actGrade }</span>
						</div>
					</td>		
				</c:forEach>
			</tr>
		</table> --%>

	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>