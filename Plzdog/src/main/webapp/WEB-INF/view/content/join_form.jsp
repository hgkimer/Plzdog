<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function inputCheck(){
	if(regForm.password.value !== regForm.passwordTest.value) {
		alert("비밀번호가 일치하지 않습니다!");
		regForm.password.focus();
		return false;
	}
}
</script>

<h2>회원 가입폼</h2>
<form name="regForm" action="${initParam.rootPath }/join_member.do" method="post" 
			enctype="multipart/form-data" onsubmit="return inputCheck()">
	<sec:csrfInput/>
	<div class="form-group">
		<label for="pId">Email : </label>
		<input type="text" name="email" id="pId" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pName">이름 : </label> 
		<input type="text" name="memberName" id="pName" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pPwd">비밀번호 : </label>
		<input type="password" name="password" id="pPwd" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pPwd2">비밀번호 확인 : </label>
		<input type="password" name="passwordTest" id="pPwd" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pMain">기본주소 : </label>
		<input type="text" name="mainAddress" id="pMain" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pSub">상세주소 : </label>
		<input type="text" name="subAddress" id="pSub" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pZip">우편번호 : </label>
		<input type="number" name="zipcode" id="pZip" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pMember">이미지 : </label>
		<input type="file" name="imageMember" id="pMember" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pPhone">전화번호 : </label>
		<input type="text" name="phoneNum" id="pPhone" class="form-control" required="required">
	</div>
	<input type="submit" value="전송" class="btn btn-default">
</form>