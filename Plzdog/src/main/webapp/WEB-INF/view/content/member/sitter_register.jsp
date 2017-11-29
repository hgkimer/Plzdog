<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/member/insert_sitter.do" method="post">
	<sec:csrfInput/>
	
	<div class="form-group">
		<label for="schoolName">학교이름 : </label>
		<input type="text" name="school" id="school" class="form-controller" required="required">
	</div>
	<div class="form-group">
		<label for="certificate">증명서/면허증 : </label>
		<input type="file" name="certification" id="certification" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="serviceAddress">서비스 가능지역 :</label>
		<input type="text" name="serviceAddress" id="serviceAddress" class="form-controller" required="required">
	</div>
	<input type="hidden" name="email" value="<sec:authentication property="principal.email"/>">
	<input type="hidden" name="sitterRate" value="0">
	<input type="submit" value="전송" id="sitterBtn" name="sitterBtn" class="btn btn-default">
</form>
</body>
</html>