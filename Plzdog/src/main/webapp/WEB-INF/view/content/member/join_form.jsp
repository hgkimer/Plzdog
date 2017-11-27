<%@ page contentType="text/html; charset=UTF-8"%>

<h2>회원 가입폼</h2>
<form action="${initParam.rootPath }/member/join.do" method="post">
	<div class="form-group">
		<label for="memberId">회원 ID : </label>
		<input type="text" name="id" id="memberId" class="form-control">
	</div>
	<div class="form-group">
		<label for="memberName">회원 이름 : </label>
		<input type="text" name="name" id="memberName" class="form-control">
	</div>
	<div class="form-group">
		<label for="memberAge">회원 나이 : </label>
		<input type="text" name="age" id="memberAge" class="form-control">
	</div>
	<input type="submit" value="가입" class="btn btn-default">
</form>
