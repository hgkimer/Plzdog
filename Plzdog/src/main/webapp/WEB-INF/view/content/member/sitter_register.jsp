<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/sitter/insert_sitter.do" method="post">
	<div class="form-group">
		<label for="schoolName">학교이름 : </label>
		<input type="text" name="schoolName" id="schoolName" class="form-controller" required="required">
	</div>
	<div class="form-group">
		<label for="certificate">증명서/면허증 : </label>
		<input type="file" name="certificate" id="certificate" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="serviceAddress">서비스 가능지역 :</label>
		<input type="text" name="serviceAddress" id="serviceAddress" class="form-controller" required="required">
	</div>
	<input type="hidden" name="authority" value="member">
	<input type="submit" value="전송" id="sitterBtn" name="sitterBtn" class="btn btn-default">
</form>
</body>
</html>