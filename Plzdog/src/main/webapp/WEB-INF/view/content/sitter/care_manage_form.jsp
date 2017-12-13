<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<script type="text/javascript">

</script>

	<button type="button" class="btn btn-default" onclick='popupRegisterCare()'>돌봄일지등록</button>
	<button type="button" class="btn btn-default" onclick='popupRegisterCare()'>돌봄일지수정</button>
	<button type="button" class="btn btn-default" onclick='popupRegisterCare()'>돌봄일지삭제</button>
	<button type="button" class="btn btn-default" onclick='popupRegisterCare()'>돌봄일지조회</button>
</body>
</html>