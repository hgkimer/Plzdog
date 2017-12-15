<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="javascript/css">

</script>
<style type="text/css">
.gores {
	width: 500px;
	height: 100px;
	margin-top: 50px;
}

.move {
	width: 200px;
	height: 100px;
	float: left;
	font-size: 20px;
	text-align: center;
	border-radius: 30px;
	font-weight: bold;
	margin: 20px;
	background-color: #009688;
	color: white;
	line-height: 100px;
	cursor: pointer;
}

.move a:hover {
	color: white;
	text-decoration: none;
}

.sbtn {
	border: none;
	width: 200px;
	height: 100px;
	font-size: 20px;
	font-weight: bold;
	margin: 20px;
	border-radius: 30px;
	background-color: #009688;
	color: white;
	float: left;
}

#mySidebar {
	display:none;
}
</style>
</head>
<body>

	<div class="gores">
		<div class="move1">
			<div class="move">
				<ul>
					<li>
						<a href="${initParam.rootPath }/member/reservation_add_form.do">시터추천 받기</a>
					</li>
				</ul>
			</div>	
				<form action="${initParam.rootPath }/member/select_all_sitter.do" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="email" value='<sec:authentication property="principal.email"/>'>
					<button type="submit" class="sbtn">시터 검색</button>
				</form>
		</div>
	</div>

</body>
</html>