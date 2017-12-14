<%@page import="com.plzdog.vo.CareImage"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
/* $(document).ready(function(){
	$("#registerCareId").on("click", function(){
		$(".selectCare").hide();
		$(".editCare").hide();
		$(".registerCare").show();
	});	
		
	$("#editCareId").on("click", function(){
		$(".selectCare").hide();
		$(".registerCare").hide();
		$(".editCare").show();
	});
	$("#selectCareId").on("click", function(){
		$(".editCare").hide();
		$(".registerCare").hide();
		$(".selectCare").show();
	});
}); */
</script>

</head>
<body>
	<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h2></h2>
	<div class="form-group">
		<span class="glyphicon glyphicon-calendar"></span><label for="pId"> 작성일 </label>
			<fmt:formatDate value = '${requestScope.care.careDate }' type="date"/>
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-user"></span><label for="pName"> 작성자 </label>
			${requestScope.sitterName }
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 식사 </label>
			${requestScope.care.careMeal }
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 산책 </label>
			${requestScope.care.careWalking }
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 배변활동 </label>
			${requestScope.care.careBowelMovement }
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 돌봄 후기 </label>
		${requestScope.care.careReview }
	</div>
	<div class="row">
		<div class="col-lg-6">
			<span class="glyphicon glyphicon-picture"></span><label for="pPwd"> 돌봄 이미지 </label>
			<c:forEach items="${care.careImage }" var="CareImage">
					<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
			</c:forEach>
		</div>
	</div>
	</div>
		<div class="col-lg-4"></div>
	</div>
</div>
</body>
</html>

<!-- <button type="button" class="btn btn-default" id='registerCareId' onclick='popupRegisterCare()'>돌봄일지등록결과</button>
	<button type="button" class="btn btn-default" id='editCareId' onclick='popupEditCare()'>돌봄일지수정</button>
	<button type="button" class="btn btn-default" id='deleteCareId' onclick='popupDeleteCare()'>돌봄일지삭제</button>
	<button type="button" class="btn btn-default" id='selectCareId' onclick='popupSelectCare()'>돌봄일지조회</button>
	<button type="button" class="btn btn-default" id='returnCareId' onclick="location.href='care_manage_form.do'">되돌아가기</button> -->