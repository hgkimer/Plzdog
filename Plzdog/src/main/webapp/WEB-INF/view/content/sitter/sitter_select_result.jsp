<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.plzdog.vo.Member"%>
<script type="text/javascript">

 $(document).ready(function(){
	
$("#serachBtn").on("click", function(){
	
	var checkboxValues = new Array();

	$("input[name='checkSitter']:checked").each(function() {
	    checkboxValues.push($(this).val());
	});

	/* var selectService = $("#selectServiceId").val();

	var allData = {"selectService": selectService, "checkArray": checkboxValues}; */
	
	$.ajax({
		"url" : "${initParam.rootPath}/member/find_sitter.do",
		"type" : "get",
		"data" : {"selectService" : $("#selectServiceId").val() , "checkArray" : checkboxValues},
		"dataType" : "json",
		"beforeSend":function(){
			/* alert(selectService);
			alert(checkboxValues);
			alert(allData); */
			//선택된 것이 0번 index면 전송하지 않는다.
			if($("#selectServiceId").get(0).selectedIndex==0){
				alert("서비스를 선택하세요");
				return false;
			}
		},
		"success" : function(list){
			var txt = "";
			$(list).each(function(){
				var skillList = this.sitter.skillList;
				var visitName ='-';
				var giveName = '-';
				$(skillList).each(function(){
					if(this.code.codeName == '방문돌봄'){
						visitName = this.code.codeName;
					}
					if(this.code.codeName == '위탁돌봄'){
						giveName = this.code.codeName;
					}
				}); 					
				txt += "<tr><td><img src='/Plzdog/memberImage/"+this.memberImage+"' width='150px'></td><td>"+this.memberName+"</td><td>"+this.mainAddress+this.subAddress+"</td><td>"+this.sitter.serviceAddress+"</td><td>"+giveName+"</td><td>"+visitName+"</td><td><a href='/Plzdog/member/goToProfile.do?email="+this.email+"'>프로필로가기</a></td></tr>";	
			});//end of each
			
			$("#listTbody").html(txt); 
			
		},//end of success 
		"error" : function(xhr, status, errorMsg){
			alert("오류가 발생헀습니다. - " + status+", "+errorMsg);
		}//end of error
	})//end of ajax
})//end of #category event
}) //end of document  	

</script>

<style type="text/css">
table td{
	border: 1px solid gray;
	padding: 5px;
}
table{
	border-collapse: collapse;
}

#mySidebar {
	display:none;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			필요한 서비스 : 
			<select name="selectService" id="selectServiceId" required="required">
				<option value="">모든 서비스</option>
				<c:forEach items="${applicationScope.serviceList}" var="category">
					<option value="${category.code}">${category.codeName }</option>
				</c:forEach>
			</select><br>
			<br>
			
			시터 세부사항 : <br>
			<c:forEach items="${applicationScope.skillList }" var="sitterSkill" begin='3'>
				<input type="checkbox" name="checkSitter" id="checkSitterId" value=${sitterSkill.code } />${sitterSkill.codeName }<br>
			</c:forEach>
			
			<button id="serachBtn">검색하기</button>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>

<table border='1' style="width: 1000px;">
	<thead>
		<tr>
			<td>시터이미지</td>
			<td>시터이름</td>
			<td>시터주소</td>
			<td>서비스가능지역</td>
			<td>위탁돌봄 여부</td>
			<td>방문돌봄 여부</td>
			<td>프로필</td>
		</tr>
	</thead>
	<tbody id="listTbody">
	<c:choose>
		<c:when test="${empty requestScope.sitterList }">
					<tr>
						<td colspan="7">시터가 없습니다.</td>
					</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${requestScope.sitterList }" var="member">
				<tr id="sitterTr" onclick="location.href='goToProfile.do?email=${member.email }'" style="cursor:pointer">
					<td><img src="${initParam.rootPath }/memberImage/${member.memberImage }" width="150px"></td>
					<td>${member.memberName }</td>
					<td>${member.mainAddress } ${member.subAddress }</td>
					<td>${member.sitter.serviceAddress }</td>
					<c:forEach items="${member.sitter.skillList }" var="skill">
						<c:if test="${skill.code.codeName eq '방문돌봄'}">
							<td>${skill.code.codeName } </td>						
						</c:if>
						<c:if test="${skill.code.codeName eq '위탁돌봄'}">
							<td>${skill.code.codeName } </td>		
						</c:if>
					</c:forEach>
					<td><a href='/Plzdog/member/goToProfile.do?email=${member.email }'>프로필로가기</a></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
