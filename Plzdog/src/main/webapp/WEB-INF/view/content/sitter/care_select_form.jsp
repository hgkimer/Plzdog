<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
});

function popupEditCare(careId){
	var url = '${initParam.rootPath}/sitter/select_care_careId.do?careId='+careId;
	window.open(url,"newCareEditForm","width = 1000, height = 800");
}

function deleteCare(careId ,resId){
	if(confirm("돌봄일지를 삭제 하시겠습니까?")){
		var url = '${initParam.rootPath}/sitter/delete_care.do?careId='+careId+'&resId='+resId;
		location.href=url; 
	} else{ 
		return false;
	} 
}

</script>
</head>
<body>
<c:choose>
	<c:when test="${empty requestScope.careList }">
		<h2 style="color: tomato; text-align: center;">아직 작성된 돌봄일지가 없습니다</h2>
					<p style="text-align: center">
						<strong>첫 돌봄일지를 등록해 주세요!</strong>
					<p>
		<div class="col-md-4"></div>
		<div class="col-md-4">
		<a href="${initParam.rootPath }/sitter/care_register_form.do"
							class="btn btn-info btn-block btn-sm">돌봄일지 등록하기</a>
							</div>
		<div class="col-md-4"></div>
			
	</c:when>
	<c:otherwise>
		<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>돌봄일지 조회</h2>
			<hr style="border: solid 1px black;">
				<div class="row">
					<c:forEach items="${requestScope.careList}" var="care" varStatus="status">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-md-4">
									<img src="${initParam.rootPath }/careImage/${care.careImage[0].imageName }" style="width: 180px">
								</div>
								<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
								<div class="col-md-8">
									<div class="col-md-8">
										<p></p>
											<span class="glyphicon glyphicon-user"></span><label>작성자 :
											<sec:authentication property="principal.memberName"/></label>
									</div>
									<div class="col-md-8">
										<p></p>
										<p>
											 <span class="glyphicon glyphicon-calendar"></span><label>작성일
											<fmt:formatDate value="${care.careDate}" pattern="yyyy-MM-dd"/></label>
										</p>
									</div>
								</div>
								<div class="row">
								<!-- 다음 줄 시작 -->
									<div class="col-md-7"></div>
									<div class="col-md-5">
										<p></p>
										<p></p>
										<button type="button" class="btn btn-info btn-xs"
											data-toggle="collapse" data-target="#${care.careId }">상세보기</button>
										<button type="button" class="btn btn-info btn-xs" id='editCareId' onclick='popupEditCare(${care.careId})'>돌봄일지수정</button>
										<button type="button" class="btn btn-info btn-xs" id='deleteCareId' onclick='deleteCare(${care.careId},${care.resId })'>돌봄일지삭제</button>
									</div>
								</div>
							</div> <!-- END OF panel 헤드 -->
							<div class="panel-body">
								<div class="collapse" id="${care.careId }">
									<div class="row">
										<div class="col-md-6">
												<c:forEach items="${care.careImage }" var="CareImage">
													<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="200px"><br>
												</c:forEach>
										</div>
										<div class="col-md-6">
											<label>식사 :</label><br>
											 ${care.careMeal }
										</div>
										<div class="col-md-6">
											<label>산책 : </label><br>
											${care.careWalking }
										</div>
										<div class="col-md-6">
											<label>배변활동 : </label><br>
											${care.careBowelMovement }
										</div>
										<div class="col-md-6">
											<label>돌봄 : </label><br>
											${care.careReview }
										</div>
									</div>
								</div>
							</div> <!-- panel 바디 -->
						</div><!-- panel 폼-->
						
					</c:forEach><!-- 전체 예약 객체 ForEach문 끝 -->
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	</c:otherwise>
</c:choose>	
</body>
</html>