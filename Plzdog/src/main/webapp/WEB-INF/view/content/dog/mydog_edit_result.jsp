<%@page import="com.plzdog.vo.DogImage"%>
<%@page import="com.plzdog.vo.DogInfo"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
#mySidebar {
	display: none;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h3 style="text-align: center">강아지 수정 결과</h3>
			<label for="dogImageId">강아지 이미지 : </label><br>
			<c:forEach items="${requestScope.dog.dogImage }" var="dogImage">
				<img src="${initParam.rootPath }/dogImage/${dogImage.dogImage }"
					width="400px" class="img-circle">
				<br>
			</c:forEach>
			<label for="dogName">이름 : ${dog.dogName }</label><br> <label
				for="species">견종 : ${dog.species } </label><br> <label
				for="gender">성별 : ${dog.gender }</label><br> <label
				for="weight">몸무게 : ${dog.weight }</label><br> <label
				for="birthday">생년월일 : <fmt:formatDate value='${dog.birth }'
					type="date" /></label><br> <label for="dogImageId">강아지 상세정보 :
			</label><br>
			<c:forEach items="${codeList }" var="code">
			${code.codeName } (O)<br>
			</c:forEach>
			<div class="row" style="margin-top : 20px;">
			<div class="col-lg-12">
				<a href="${initParam.rootPath }/dog/select_dog.do?email=<sec:authentication property="principal.email"/>" class="btn btn-warning btn-block">내 강아지 목록으로 돌아가기</a>
			</div>
		</div>
		</div>
	</div>
</div>