<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	.group {
		width:800px;
		height:300px;
		box-shadow:10px 10px 20px black;
		margin-top:20px;
		margin-bottom:20px;
		border-radius:10px;
	}
	
	.every {
		width:700px;
		height:500px;
		margin-top:30px;
	}
	
	.form-group {
		border:1px solid #e3e3e3;
		width:400px;
		height:50px;
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
		float:left;
	}
	
	#certification {
		width:250px;
	}
</style>
</head>
<body >
<div class="every">
	<form action="${initParam.rootPath }/member/insert_sitter.do" method="post" class="every" enctype="multipart/form-data">
		<sec:csrfInput/>
		<input type="hidden" name="email" value="<sec:authentication property="principal.email"/>">
		<div class="form-group">
			<label for="school">학교이름 : </label>
			<input type="text" name="school" id="school" class="form-controller" required="required">
		</div>
		<div class="form-group">
			<label for="certificate" style="float:left;">증명서/면허증 : </label>
			<input style="float:left; height:46px;" type="file" name="certificationImage" id="certification" class="form-controller" id="file" required="required"/>
		</div>
		<div class="form-group">
			<label for="serviceAddress">서비스 가능지역 : </label>
			<input type="text" name="serviceAddress" id="serviceAddress" class="form-controller" required="required">
		</div>
		<div class="form-group">
			<label for="visitPrice">방문 돌봄 희망 가격</label>
			<input type="number" name="visitPrice" id="visitPrice" class="form-controller" required="required">
		</div>
		<div class="form-group">
			<label for="givePrice">위탁 돌봄 희망 가격</label>
			<input type="number" name="givePrice" id="givePrice" class="form-controller" required="required">
		</div>
		<div class="form-check" style="float:right; font-size:15px; font-weight:bold; line-height:30px; margin-bottom:20px;">
			<label class="form-check-label">보유 기술 목록 : </label><br>
			<c:forEach var="skill" items="${applicationScope.skillList }">
			<input type="checkbox" name="skill" value="${skill.code }" class="form-check-input">${skill.codeName }<br>	
		</c:forEach>
		</div>
		<div class="form-check">
			<label class="form-check-label">보유 환경 목록 : </label><br>
			<c:forEach var="en" items="${applicationScope.enList }">
			<input type="checkbox" name="skill" value="${en.code }" class="form-check-input">${en.codeName }<br>	
		</c:forEach>
		</div>
		<input type="hidden" name="sitterRate" value="0">
		<div class="btn">
			<input type="submit" value="전송" id="sitterBtn" name="sitterBtn" class="btn btn-default">
		</div>
	</form>
</div>
</body>
</html>