<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<c:forEach items="${requestScope.list }" var="res">
					<div class="panel panel-default">
						<div class="panel-heading">
							강아지 사진: <img alt="dog"
								src="${initParam.rootPath }/dogImage/ ${res.resDogList[0].dogImage[0]}">

							<!-- 하나의 예약에 묶여 있는 강아지 리스트 반복 출력-->
							<p>강아지 이름 : 
							<c:forEach items="${res.resDogList }" var="dog">
								${dog.dogName }								
							</c:forEach>
							</p>
							
							<p>강아지 성별 :${dog.gender }
							<c:forEach items="${res.resDogList }" var="dog">
								${dog.gender }								
							</c:forEach>
							</p>
							<p>시작 날짜: ${res.resSDate }</p> 
							<p>종료 날짜 : ${res.resEDate }</p>
							<button type="button" class="btn btn-info" data-toggle="collapse"
								data-target="#${res.resId }">상세보기</button>
						</div>
						<div class="panel-body">
							<div class="collapse" id="${res.resId }">안뇽</div>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>
	</div>

</body>
</html>