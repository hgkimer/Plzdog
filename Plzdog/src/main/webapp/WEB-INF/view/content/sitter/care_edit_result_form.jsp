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

</script>
</head>
<body>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">

	<div class="col-lg-6">
		<div class="form-group">
			<span class="glyphicon glyphicon-calendar"></span><label for="pId"> 작성일 </label>
			<input type="date" id="careDate" name="careDate" class="form-control" value="${requestScope.care.careDate }" readOnly required="required"/><br>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-user"></span><label for="pName"> 작성자 </label>
			<input type="text" name="sitterName" id="pName" class="form-control" value='<sec:authentication property="principal.memberName"/>' required="required" readOnly>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 식사 </label>
			<textarea rows="5" cols="30" id="careMeal" name="careMeal" class="form-control" readOnly>${requestScope.care.careMeal }</textarea>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 산책 </label>
			<textarea rows="5" cols="30" id="careWalking" name="careWalking" class="form-control" readOnly>${requestScope.care.careWalking }</textarea>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 배변활동 </label>
			<textarea rows="5" cols="30" id="careBowelMovement" name="careBowelMovement" class="form-control" readOnly>${requestScope.care.careBowelMovement }</textarea>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 돌봄 후기 </label>
			<textarea rows="5" cols="30" id="careReview" name="careReview" class="form-control" readOnly>${requestScope.care.careReview }</textarea>
		</div>
	</div>
	<div class="col-lg-6">
			<c:forEach items="${requestScope.care.careImage }" var = "careImage">
				<img id="careImage" src="${initParam.rootPath }/careImage/${careImage.imageName }" class="img-responsive" width="200px">
			</c:forEach>
	</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>
</body>
</html>