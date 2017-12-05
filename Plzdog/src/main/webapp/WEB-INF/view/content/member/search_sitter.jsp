<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="javascript/css">

</script>
<style type="text/css">
	.gores {
		width:800px;
		height:100px;
	}
	
	.move {
		width:200px;
		height:100px;
		float:left;
		font-size:20px;
		text-align:center;
		border-radius:30px;
		font-weight:bold;
		margin:20px;
		background-color:#0fa301;
		color:white;
		line-height:100px;
		cursor:pointer;
	}
	
	.move a:hover {
		color:white;
		text-decoration:none;
	}
	
	.sbtn {
		border:none;
		width:200px;
		height:100px;
		font-size:20px;
		font-weight:bold;
		margin:20px;
		border-radius:30px;
		background-color:#0fa301;
		color:white;
	}
</style>
</head>
<body>
<div class="gores">
	<div class="move">
		<a href="${initParam.rootPath }/member/reservation_add_form.do">도그시터 추천받기</a><br>
	</div>
	<div class="move">
		<li><a href="${initParam.rootPath }/member/select_all_sitter.do">시터 검색</a><br>
	</div>
	<div class="move1">
		<form action="${initParam.rootPath }/member/goToProfile.do" method="post">
			<sec:csrfInput/>
			<input type="hidden" value="sitter@naver.com" name="email"/>
			<button type="submit" class="sbtn">sitter@naver.com의 프로필</button> 
		</form>
	</div>	
</div>
</body>
</html>