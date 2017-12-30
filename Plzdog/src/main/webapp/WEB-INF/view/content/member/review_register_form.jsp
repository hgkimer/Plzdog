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

</head>
<body>

<script type="text/javascript">

var number;

$(document).ready(function(){
	$("#selectReviewScoreId").on("change", function(){
		number = $("#selectReviewScoreId").val();
		document.registerReviewForm.reviewRate.value=number;
	});
});

function pClose(){
	
	window.close();
	
	opener.parent.location="/WEB-INF/view/content/member/profile.jsp";
	opener.parent.location.reload();
	
}
</script>
</head>
<body>

<!-- onsubmit="return pSubmit()" -->
<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
		
<form name="registerReviewForm" action="${initParam.rootPath }/member/insert_review.do" method="post" >
	<sec:csrfInput/><%-- csrf 토큰 --%>
	<input type="hidden" name="sitterEmail" value="${param.sitterEmail }" />
	<input type="hidden" name="reviewId" value=0 />
	<div class="col-lg-6">
		<div class="form-group">
			<span class="glyphicon glyphicon-calendar"></span><label for="pId"> 작성일 </label>
			<input type="date" name="reviewDate" class="form-control" required="required"/><br>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-user"></span><label for="pName"> 작성자 </label>
			<sec:authentication property="principal.memberName"/>
			<input type="hidden" name="memberEmail" class="form-control" value='<sec:authentication property="principal.email"/>' required="required">
		</div>
		<div class="form-group" >
			<span class="glyphicon glyphicon-pancil"></span><label for="pName"> 별점 </label>
			<select name="selectReviewScore" id="selectReviewScoreId">
				<option value="">별점을 선택하세요</option>
				<c:forEach var="i" begin="1" end="5" >
					<option value="<c:out value='${i}'/>"><c:out value="${i}"/></option>
				</c:forEach>
			</select><br>
			<input type="hidden" name="reviewRate" value=""/>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-pencil"></span><label for="pPwd"> 내용 </label>
			<textarea rows="5" cols="30" id="reviewContents" name="reviewContents" class="form-control" required="required"></textarea>
		</div>
	</div>
	<div class="form-group">
		<input type="submit" value="전송" class="btn btn-info btn-sm" id="btn" >
	</div>
</form>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>

</body>
</html>