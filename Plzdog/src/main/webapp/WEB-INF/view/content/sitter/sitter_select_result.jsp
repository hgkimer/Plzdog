<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.plzdog.vo.Member"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#category").on("change", function(){
		$.ajax({
			"url" : "${initParam.rootPath}/sitter/find_sitter.do",
			"type" : "post",
			"data" : {"serviceName" : $("#category").val()},
			"dataType" : "json",
			"beforeSend":function(){
				//선택된 것이 0번 index면 전송하지 않는다.
				if($("#category option").get(0).selectedIndex==0){
					alert("서비스를 선택하세요");
					return false;
				}
			},
			"success" : function(list){
				$(list).each(function(){
					var member  = this;
					member.memberName
					$(member).each(function(){
						$
					});
				});//end of each
				$("#dogBtn").after(txt);
			},//end of success
			"error" : function(xhr, status, errorMsg){
				alert("오류가 발생헀습니다. - " + status+", "+errorMsg);
			}//end of error
		})//end of ajax
	})//end of #dogBtn event
})//end of document
</script>

<h2>시터 전체 결과</h2>

필요한 서비스 : 
<select name="CategoryId" id="category" required="required">
	<option value="">모든 서비스</option>
	<c:forEach items="${applicationScope.serviceList}" var="category">
		<option value="${category.code}">${category.codeName }</option>
	</c:forEach>
</select>

<c:forEach items="${requestScope.sitterList }" var="member">
	<div class="sitter" onclick="location.href='goToProfile.do?email=${member.email }'" style="cursor:pointer">
	email : ${member.email }<br> 
	회원이름 : ${member.memberName }<br>
	회원 비밀번호 : ${member.password }<br>
	회원 주소 : ${member.mainAddress } ${member.subAddress }<br>
	우편번호 : ${member.zipcode}<br>
	회원 이미지 : <img src="${initParam.rootPath }/memberImage/${member.memberImage }" width="350px"><br>
	탈퇴여부 : ${member.memberEnable }<br>
	
	학교 이름 : ${member.sitter.school }<br>
	<%-- 증명서/면허증 :  <img src="${initParam.rootPath }/sitterImage/${member.sitter.Image}" width="350px"><br> --%>
	서비스 가능 지역 : ${member.sitter.serviceAddress }<br>
	평점 : ${member.sitter.sitterRate }<br>
	방문돌봄 가격 : ${member.sitter.visitPrice }<br>
	위탁돌봄 가격 : ${member.sitter.givePrice }<br>
	-----------------------------<br>
	</div>
</c:forEach>