<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h2>시터 프로필</h2>
<h1>${requestScope.profile.memberName }</h1>
<p>이메일 : ${requestScope.profile.email }</p>
<p>프로필 사진 : <img src="${initParam.rootPath }/memberImage/${member.memberImage }" width="350px"><br>
<p>우편번호 : ${requestScope.profile.zipcode }</p>
<p>주소 : ${requestScope.profile.mainAddress }</p>
<p>전화번호 : ${requestScope.profile.phoneNum }</p>
<p>개 :<br>
	<c:forEach items="${requestScope.profile.dogList }" var="dog" >
		 강아지 이름 : ${dog.dogName}<br>
		 강아지 종 : ${dog.species }<br>
		 강아지 성별 : ${dog.gender }<br>
		 강아지 몸무게 : ${dog.weight }<br>
		 강아지 생년월일 : ${dog.birth }<br>
		 <c:forEach items="${dog }" var="dogInfo">
		 	<c:forEach items="${dogInfo }" var="dogImage">
		 		강아지 이미지 : <img src="${initParam.rootPath }/memberImage/${dogImage.dogImage }" width="350px"><br>
		 	</c:forEach>
		 </c:forEach>
	</c:forEach>
</p>

<h1>Sitter 정보</h1>
<p>학교 : ${requestScope.profile.sitter.school }</p>
<p>서비스지역 : ${requestScope.profile.sitter.serviceAddress }</p>
<p>시터평점 : ${requestScope.profile.sitter.sitterRate }</p>
<p>방문돌봄금액 : ${requestScope.profile.sitter.visitPrice }</p>
<p>위탁돌봄금액 : ${requestScope.profile.sitter.givePrice }</p>

<p>스킬 리스트 : <br>
	<c:forEach var="code" items="${requestScope.profile.skillList }">
		★${code.codeName }<br>
	</c:forEach></p>

<sec:authentication property="principal.email"/>
<form action="${initParam.rootPath }/member/reservation_add_form.do">
	<input type="text" value="${requestScope.profile.email }" name="sitterEmail"/>
	<button type="submit">예약 신청</button>
</form>
