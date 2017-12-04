<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더와 연결되어 있으므로 굳이 부트스트랩을 다시 연결해 줄 필요가 없다. -->
<%-- <link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css"> --%>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	.group {
		width:800px;
		height:300px;
		box-shadow:0px 0px 20px black;
		margin-top:20px;
		margin-bottom:20px;
		border-radius:10px;
	}
	
	.every {
		width:500px;
		height:300px;
	}
	
	.form-group {
		border:1px solid #e3e3e3;
		width:500px;
		height:50px;
		overflow:hidden;
		line-height:45px;
		float:left;
		margin-top:10px;
	}
	
	.btn {
		width:100%;
		height:50px;
		float:left;
	}
	
	#sitterBtn {
		width:100%;
		height:50px;
		font-sizeL:20px;
		font-weight:bold;
	}
</style>
</head>
<body >
<div class="every">
	<form action="${initParam.rootPath }/member/insert_sitter.do" method="post" class="every" enctype="multipart/form-data">
		<sec:csrfInput/>
		
		<div class="form-group">
			<label for="school">학교이름 : </label>
			<input type="text" name="school" id="school" class="form-controller" required="required">
		</div>
		<div class="form-group">
			<label for="certificate" style="float:left;">증명서/면허증 : </label>
			<input style="float:left; height:46px;" type="file" name="certification" id="certification" class="form-controller" id="file" required="required"/>
		</div>
		<div class="form-group">
			<label for="serviceAddress">서비스 가능지역 : </label>
			<input type="text" name="serviceAddress" id="serviceAddress" class="form-controller" required="required">
		</div>
		<div class="form-check">
			<label class="form-check-label">보유 기술 목록 : </label><br>
			<c:forEach var="skill" items="${applicationScope.skillList }">
			<input type="checkbox" name="skillList" value="${skill.code }" class="form-check-input">${skill.codeName }<br>	
		</c:forEach>
		</div>
		<div class="form-group">
			<label for="serviceAddress">방문 돌봄 희망 가격</label>
			<input type="number" name="visitPrice" id="visitPrice" class="form-controller" required="required">
		</div>
		<div class="form-group">
			<label for="serviceAddress">위탁 돌봄 희망 가격</label>
			<input type="number" name="givePrice" id="givePrice" class="form-controller" required="required">
		</div>
		<input type="hidden" name="email" value="<sec:authentication property="principal.email"/>">
		<input type="hidden" name="sitterRate" value="0">
		<div class="btn">
			<input type="submit" value="전송" id="sitterBtn" name="sitterBtn" class="btn btn-default">
		</div>
	</form>
</div>
</body>
</html>