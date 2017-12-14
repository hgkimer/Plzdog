<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>

<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>

<script type="text/javascript">
$(document).ready(function(){
	$("#addImage").on("click",function(){
		$("#imageCare").siblings().last().after("<input type='file' name='careImageList' id='imageCare'/><br>");
	});	
	$("#imgChangeBtn").on("click", function(){
		$("#changeSpan").hide().next().show();
	});
	$("#cancelImgChangeBtn").on("click", function(){
		$("#memberImage").val("").parent().hide().prev().show();
	});
});

</script>
</head>
<body>
<h3>돌봄일지 수정하기</h3>
<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h2></h2>
<form id="addCare" action="${initParam.rootPath }/sitter/insert_care.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
	<input type="hidden" id="resId" name="resId" value="${requestScope.care.resId }" required="required"/><br>
	<div class="form-group">
		<span class="glyphicon glyphicon-calendar"></span><label for="pId"> 작성일 </label>
		<input type="date" id="careDate" name="careDate" class="form-control" value="${requestScope.care.careDate }" required="required"/><br>
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-user"></span><label for="pName"> 작성자 </label>
		<input type="text" name="sitterName" id="pName" class="form-control" value='<sec:authentication property="principal.memberName"/>' required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 식사 </label>
		<textarea rows="5" cols="30" id="careMeal" name="careMeal" class="form-control">${requestScope.care.careMeal }</textarea>
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 산책 </label>
		<textarea rows="5" cols="30" id="careWalking" name="careWalking" class="form-control">${requestScope.care.careWalking }</textarea>
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 배변활동 </label>
		<textarea rows="5" cols="30" id="careBowelMovement" name="careBowelMovement" class="form-control">${requestScope.care.careBowelMovement }</textarea>
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 돌봄 후기 </label>
		<textarea rows="5" cols="30" id="careReview" name="careReview" class="form-control">${requestScope.care.careReview }</textarea>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<span class="glyphicon glyphicon-picture"></span><label for="pPwd"> 돌봄 이미지 </label>
			<c:forEach items="${care.careImage }" var="CareImage">
					<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
			</c:forEach>
		</div>
		<div class="col-lg-6">
			<div class="form-group">
				<button id="addImage" type="button" class="btn btn-info">이미지 추가</button>
			</div>
		</div>
		<div class="col-lg-6">
			<span id="changeSpan">
				<img id="careImage" src="${initParam.rootPath }/careImage/${CareImage.imageName }" class="img-responsive" width="350px">
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='imageMember' id='imageMember' class='form-control'>
			</span>
		</div>
	</div>
	<div class="form-group">
		<input type="submit" value="돌봄일지수정" class="btn-lg btn-block" id="btn">
	</div>
</form>
	</div>
		<div class="col-lg-4"></div>
	</div>
</div>
</body>
</html>