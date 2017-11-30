<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>정보 수정 가입</h2>
<c:if test="${not empty requestScope.errorMessage}">
	<div class="well text-danger">
		${requestScope.errorMessage }
	</div>
</c:if>
<form id="updateForm" action="${initParam.rootPath }/member/updateMember.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="id">Email</label>
		<input type="text" name="email" id="id" class="form-control" value='<sec:authentication property="principal.email"/>' required="required">
	</div>
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" name="memberName" id="name" class="form-control" value='<sec:authentication property="principal.memberName"/>' required="required">
	</div>
	<div class="form-group">
		<label for="oldPassword">기존 패스워드</label>
		<input type="password" name="oldMemberPassword" id="oldPassword" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="password">변경할 패스워드</label>
		<input type="password" name="password" id="password" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pMain">기본주소 : </label>
		<input type="text" name="mainAddress" id="pMain" class="form-control" value='<sec:authentication property="principal.mainAddress"/>' required="required">
	</div>
	<div class="form-group">
		<label for="pSub">상세주소 : </label>
		<input type="text" name="subAddress" id="pSub" class="form-control" value='<sec:authentication property="principal.subAddress"/>' required="required">
	</div>
	<div class="form-group">
		<label for="pZip">우편번호 : </label>
		<input type="number" name="zipcode" id="pZip" class="form-control" value='<sec:authentication property="principal.zipcode"/>' required="required">
	</div>
	<div class="form-group">
		<label for="pPhone">전화번호 : </label>
		<input type="text" name="phoneNum" id="pPhone" class="form-control" value='<sec:authentication property="principal.phoneNum"/>' required="required">
	</div>
	<input type="hidden" name="memberEnable" value='<sec:authentication property="principal.memberEnable"/>'/>
	 
	<div class="row">
		<div class="col-sm-12">
			<span id="changeSpan">
				<button id="imgChangeBtn" type="button" class="btn btn-success">사진변경</button>
				<img id="memberImage" src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.memberImage'/>" class="img-responsive" width="350px">
			</span>
			<span id="cancelSpan" style="display: none;">
				<button id="cancelImgChangeBtn" type="button" class="btn btn-success">사진변경취소</button>
				<input type='file' name='imageMember' id='imageMember' class='form-control'>
			</span>
		</div>
	</div>
	<button type="submit" class="btn btn-default">정보수정</button>
	<sec:csrfInput/><%-- csrf 토큰 --%>
</form>

<script>
//사진 변경 처리
$(document).ready(function(){
	$("#imgChangeBtn").on("click", function(){
		$("#changeSpan").hide().next().show();
	});
	$("#cancelImgChangeBtn").on("click", function(){
		$("#memberImage").val("").parent().hide().prev().show();
	});
});
</script>
