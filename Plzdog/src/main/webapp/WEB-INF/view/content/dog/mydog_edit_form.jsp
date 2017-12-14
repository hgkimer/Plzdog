<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#mySidebar {
	display:none;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<h2 style="text-align: center">강아지 정보 수정</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="updateForm" action="${initParam.rootPath }/dog/update_dog.do" method="post" enctype="multipart/form-data">
	<div class="col-lg-6">
			<span id="changeSpan">
			<c:forEach items="${requestScope.dog.dogImage }" var = "dogImage">
				<img id="dogImage" src="${initParam.rootPath }/dogImage/${dogImage.dogImage}" class="img-responsive" width="350px">
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
			</c:forEach>
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='imageDog' id='imageDog' class='form-control'>
			</span>
	</div>
	<div class="col-lg-6">
		<div class="form-group">
			<span class="glyphicon glyphicon-user"></span><label for="dogName">이름</label>
			<input type="text" name="dogName" id="dogName" class="form-control" value="${requestScope.dog.dogName }" required="required">
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-tags"></span><label for="species">견종</label>
			<input type="text" name="species" id="species" class="form-control" value="${requestScope.dog.species }" required="required">
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-dashboard"></span><label for="oldPassword">몸무게</label>
			<input type="number" name="weight" id="weight" class="form-control" value="${requestScope.dog.weight }" required="required">
		</div>
		<div class="form-group">
			<span class="	glyphicon glyphicon-heart-empty"></span><label for="password">성별</label>
			<label><input type="radio" name="gender" value="수컷" id="gendermale" class="radio-inline" />수컷</label> 
			<label><input type="radio" name="gender" value="암컷" id="genderfemale" class="radio-inline" />암컷</label>
		</div>
		<div class="form-group">
			<span class="glyphicon glyphicon-time"></span><label for="oldPassword">생년월일</label>
			<input type="date" name="birth" id="dDate" class="form-control" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${requestScope.dog.birth }'/>" required="required">
		</div>
		
		<input type="hidden" name="dogId" value="${requestScope.dog.dogId }"/>
	 </div>
	 
		<c:forEach items="${applicationScope.dogInfoList }" var="code">
			<%--String[] 배열로 값이 전달. --%>
			<label><input type="checkbox" name="dogCodeList" id="code" value="${code.code }"> ${code.codeName }</label><br>
		</c:forEach>
	
	<div class="form-group">
		<button type="submit" class="btn btn-default btn-block">정보수정</button>	
	</div>
	
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>


<script>
//사진 변경 처리
$(document).ready(function(){
	$("#imgChangeBtn").on("click", function(){
		$("#changeSpan").hide().next().show();
	});
	$("#cancelImgChangeBtn").on("click", function(){
		$("#dogImage").val("").parent().hide().prev().show();
	});
});
</script>