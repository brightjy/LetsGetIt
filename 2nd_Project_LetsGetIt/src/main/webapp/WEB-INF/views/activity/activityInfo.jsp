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
<link href="${conPath }/css/activityInfo.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('actInfo1', {
			filebrowserUploadUrl: '${conPath}/activityInfoUpload.do',
			width:"750px",
			height:"300px"
		});
	});
	function chk() {
		var actInfo = CKEDITOR.instances.actInfo1.getData();
		$('#actInfo').val(actInfo);
		return true;
	};
	CKEDITOR.on('dialogDefinition', function (ev) {
        var dialogName = ev.data.name;
        var dialog = ev.data.definition.dialog;
        var dialogDefinition = ev.data.definition;
        if (dialogName == 'image') {
            dialog.on('show', function (obj) {
                this.selectPage('Upload'); //업로드텝으로 시작
            });
            dialogDefinition.removeContents('Link'); // 링크탭 제거
        }
    });
</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="activityInfo">
		<h3>액티비티 만들기</h3>
		<form action="activityCheck.do" method="post" onsubmit="return chk()">
			<input type="hidden" name="actCno" value="${activity.actCno }">
			<input type="hidden" name="actName" value="${activity.actName }">
			<input type="hidden" name="actImg" value="${activity.actImg }">
			<input type="hidden" name="actPrice" value="${activity.actPrice }">
			<input type="hidden" name="actDiscount" value="${activity.actDiscount }">
			<input type="hidden" name="actAddress1" value="${activity.actAddress1 }">
			<input type="hidden" name="actAddress2" value="${activity.actAddress2 }">
			<input type="hidden" name="actSchedule" value="${activity.actSchedule }">
			<input type="hidden" name="actPolicy" value="${activity.actPolicy }">
			<input type="hidden" name="actInclude" value="${activity.actInclude }">
			<input type="hidden" name="actExclude" value="${activity.actExclude }">
			<input type="hidden" name="actMinMember" value="${activity.actMinMember }">
			<input type="hidden" name="actMaxMember" value="${activity.actMaxMember }">
			<input type="hidden" name="hId" value="${host.hId }">
			<input type="hidden" name="actInfo" id="actInfo">
			<input type="hidden" name="actOption" value="${activity.actOption }">
			<div id="left">
				<h3>액티비티 소개</h3>
				<textarea name="actInfo1" id="actInfo1"></textarea>
			</div>
			<div id="right">
				<ul>
					<li>
						액티비티에 대해 소개해주세요.
					</li>
					<li>&nbsp;</li>
					<li class="space">
						[필수]
						<ul>
							<li>
								이미지 5장 이상 (이미지별 콘텐츠 설명 1~2줄)
							</li>
							<li>
								진행 장소에 대한 소개
							</li>
							<li>
								세부적인 일정에 대한 설명
							</li>
							<li>
								티켓 수령 및 사용 방법
							</li>
							<li>
								입장 또는 참여 가능 나이<br>
								(ex. 대인, 소인, 무료입장 가능 나이 등)
							</li>
							<li>
								티켓 유효기간이 정해져 있다면 기재해주세요.
							</li>
						</ul>
					</li>
					<li class="space">
						[선택]
						<ul>
							<li>
								강사 소개나 자격증은 신뢰도를 높일 수 있어요
							</li>
							<li>
								정규 클래스/다회차 클래스일 경우 각 회차별 세부 커리큘럼을 기재해주세요.
							</li>
						</ul>
					</li>
					<li class="space">
						개인 연락처, 카카오톡 ID, 오픈카톡, SNS 주소, 외부링크 등은 기재가 불가합니다.
					</li>
					<li class="space">
						Let's Get It를 통해서가 아닌 외부로 접근한 대원이 호스트님과 직접<br>
						 현장결제 혹은 구매할 경우, 보호할 수 없으니 참고 부탁드립니다.<br>
						(* 대원이 사이트를 통해 상품을 확인하고 결제하면,<br>
						 호스트 관리페이지를 통해 확인 및 원활한 운영이 가능하니 참고 부탁드립니다)
					</li>
					<li class="space">
						사용하는 사진은 저작권 및 상표권에 문제가 없어야 합니다.
					</li>
					<li class="space">
						너무 많은 사진과 텍스트는 가독성이 떨어져 액티비티 매력도가 떨어집니다.<br>
						 사진 10장 이내, 적당한 텍스트 기재를 추천 드립니다.
					</li>
					<li class="space">
						텍스트 컬러, 배경색 컬러는 불가하오니, 텍스트는 검정색으로 통일 부탁드립니다.
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