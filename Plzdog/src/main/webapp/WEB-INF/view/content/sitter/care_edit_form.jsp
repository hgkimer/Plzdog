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


<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="editCareForm" action="${initParam.rootPath }/sitter/update_care.do" method="post" enctype="multipart/form-data">
	<input type="hidden" id="resId" name="resId" value="${requestScope.care.resId }" required="required"/><br>
	<input type="hidden" id="careId" name="careId" value="${requestScope.care.careId }" required="required"/><br>
	<div class="col-lg-6">
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
		<div class="form-group">
					<input type="file" name="careImageList" id="imageCare"/>
					<button id="addImage" type="button" class="btn btn-info">이미지 추가</button>
		</div>
	</div>
	<div class="col-lg-6">
			<span id="changeSpan">
			<c:forEach items="${requestScope.care.careImage }" var = "careImage">
				<img id="careImage" src="${initParam.rootPath }/careImage/${careImage.imageName }" class="img-responsive" width="200px">
				<%-- <input type="hidden" id="imageName" name="imageName" value="${careImage.imageName }" required="required"/><br> --%>
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
			</c:forEach>
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='imageMember' id='imageMember' class='form-control'>
			</span>
	</div>
	
	<div class="form-group">
		<input type="submit" value="돌봄일지수정" class="btn-lg btn-block" id="btn">
	</div>
	
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>

</body>
</html>