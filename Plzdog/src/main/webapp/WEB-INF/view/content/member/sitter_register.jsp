<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	.every {
		width:800px;
		height:300px;
		box-shadow:0px 0px 20px black;
		margin-top:20px;
		margin-bottom:20px;
		border-radius:10px;
	}
	
	.form-group {
		border:1px solid gray;
		width:500px;
		height:50px;
		/* overflow:hidden; */
		line-height:45px;
	}
	
	.btn {
		width:100%;
		height:50px;
	}
	
	#sitterBtn {
		width:500px;
		height:50px;
		font-sizeL:20px;
		font-weight:bold;
	}
</style>
</head>
<body class="body">
<form action="${initParam.rootPath }/member/insert_sitter.do" method="post" class="every">
	<sec:csrfInput/>
	
	<div class="form-group">
		<label for="schoolName">학교이름 : </label>
		<input type="text" name="school" id="school" class="form-controller" required="required">
	</div>
	<div class="form-group">
		<label for="certificate">증명서/면허증 : </label>
		<input type="file" name="certification" id="certification" class="form-controller" id="file" required="required"/>
	</div>
	<div class="form-group">
		<label for="serviceAddress">서비스 가능지역 : </label>
		<input type="text" name="serviceAddress" id="serviceAddress" class="form-controller" required="required">
	</div>
	<input type="hidden" name="email" value="<sec:authentication property="principal.email"/>">
	<input type="hidden" name="sitterRate" value="0">
	<div class="btn">
		<input type="submit" value="전송" id="sitterBtn" name="sitterBtn" class="btn btn-default">
	</div>
</form>
</body>
</html>