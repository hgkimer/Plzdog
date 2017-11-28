<%@ page contentType="text/html; charset=UTF-8"%>

<h2>회원 가입폼</h2>
<form action="${initParam.rootPath }/member/join_member.do" method="post">
	<div class="form-group">
		<label for="pId">Email : </label>
		<input type="text" name="email" id="pId" class="form-control">
	</div>
	<div class="form-group">
		<label for="pName">이름 : </label> 
		<input type="text" name="memberName" id="pName" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">비밀번호 : </label>
		<input type="text" name="password" id="pPwd" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">기본주소 : </label>
		<input type="text" name="mainAdderss" id="pMain" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">상세주소 : </label>
		<input type="text" name="subAddress" id="pSub" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">우편번호 : </label>
		<input type="text" name="zipcode" id="pZip" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">이미지 : </label>
		<input type="text" name="memberImage" id="pMember" class="form-control">
	</div>
	<div class="form-group">
		<label for="pPrice">전화번호 : </label>
		<input type="text" name="phoneNum" id="pPhone" class="form-control">
	</div>
	<input type="submit" value="전송" class="btn btn-default">
</form>
