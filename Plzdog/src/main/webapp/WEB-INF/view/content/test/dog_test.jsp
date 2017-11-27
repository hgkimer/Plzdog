<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄일지</title>
</head>
<body>
<form action="${initParam.rootPath }/care/select_care.do" method="post">
	<input type="number" id="id" name="id">
	<button type="submit">전송</button>
</form>

</body>
</html>