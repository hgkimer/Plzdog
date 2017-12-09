<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<h2>시터 등록</h2>
				<form action="${initParam.rootPath }/member/insert_sitter.do"
					method="post" enctype="multipart/form-data">
					<sec:csrfInput />
					<input type="hidden" name="email"
						value="<sec:authentication property="principal.email"/>">
					<div class="form-group">
						<label for="school">소속이름 : </label> <input type="text"
							name="school" id="school" class="form-control"
							required="required">
					</div>
					<div class="form-group">
						<label for="certificate" style="float: left;">증명서/면허증 : </label> <input
							type="file" name="certificationImage" id="certification"
							class="form-control" id="file" required="required" />
					</div>
					<div class="form-group">
						<label for="serviceAddress">서비스 가능지역 : </label> <input type="text"
							name="serviceAddress" id="serviceAddress" class="form-control"
							required="required">
					</div>
					<div class="form-group">
						<label for="visitPrice">(시간당)방문 돌봄 희망 가격</label> <input
							type="number" name="visitPrice" id="visitPrice"
							class="form-control" required="required">
					</div>
					<div class="form-group">
						<label for="givePrice">(시간당)위탁 돌봄 희망 가격</label> <input
							type="number" name="givePrice" id="givePrice"
							class="form-control" required="required">
					</div>
					<div class="form-group">
						<label>보유 기술 목록 :</label>
						<div class="checkbox">
							<c:forEach var="skill" items="${applicationScope.skillList }">
								<label><input type="checkbox" name="skill"
									value="${skill.code }" class="form-check-input">${skill.codeName }
								</label>
								<br>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label>보유 환경 목록 : </label>
						<div class="checkbox">
							<c:forEach var="en" items="${applicationScope.enList }">
								<label><input type="checkbox" name="skill"
									value="${en.code }" class="form-check-input">${en.codeName }</label>
								<br>
							</c:forEach>
						</div>
					</div>
					<input type="hidden" name="sitterRate" value="0">
					<div class="clear"></div>
					<div class="btn">
						<input type="submit" value="전송" id="sitterBtn" name="sitterBtn"
							class="btn btn-default">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>