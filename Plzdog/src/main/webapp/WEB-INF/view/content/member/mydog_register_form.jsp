<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mydog_register</title>
</head>
<body>
<form action="${initParam.rootPath }/" method="post">
	<sec:csrfInput/>
	<div class="form-group">
		<label for="dogName">이름 : </label>
		<input type="text" name="name" id="dogName" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="species">견종 : </label>
		<input type="text" name="species" id="species" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="gender">성별 : </label>
		<label><input type="radio" name="gender" id="gendermale" class="form-controller"/>수컷</label>
		<label><input type="radio" name="gender" id="genderfemale" class="form-controller"/>암컷</label>
	</div>
	<div class="form-group">
		<label for="weight">몸무게 : </label>
		<input type="number" name="species" id="species" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="birthday">생년월일 : </label>
		<input type="date" name="birthday" id="birthday" class="form-controller" required="required"/>
	</div>
	<div class="form-group">
		<label for="dogimage">강아지이미지 : </label>
		<input type="file" name="dogimage" id="dogimage" class="form-controller" required="required"/>
	</div>
	<input type="submit" value="전송" class="btn btn-default">
</form>
</body>
</html>