<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄일지</title>
</head>
<body>
<h2>회원 가입폼</h2>
<form action="${initParam.rootPath }/join_member.do" method="post">
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
		<input type="text" name="memberImage" id="pMember" class="form-control" required="required">
	</div>
	<div class="form-group">
		<label for="pPhone">전화번호 : </label>
		<input type="text" name="phoneNum" id="pPhone" class="form-control" required="required">
	</div>
	<input type="submit" value="전송" class="btn btn-default">
</form>
</body>
</html>