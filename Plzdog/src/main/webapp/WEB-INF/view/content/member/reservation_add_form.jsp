<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	$("#dogBtn").on("click", function(){
		$.ajax({
			"url" : "${initParam.rootPath}/member/find_dog_reservation.do",
			"type" : "get",
			"data" : {"email" : $("#memberEmail").val()},
			"dataType" : "json",
			"success" : function(obj){
				var txt = "";
				$(obj).each(function(){
					var dog  = this;
					txt += "&nbsp&nbsp&nbsp&nbsp<input type='checkbox' name='dog' value='"+this.dogId+"''/>"+ this.dogName+"&nbsp&nbsp"; 
				});//end of each
				$("#dogBtn").after(txt);
			},//end of success
			"error" : function(xhr, status, errorMsg){
				alert("오류가 발생헀습니다. - " + status+", "+errorMsg);
			}//end of error
		})//end of ajax
	})//end of #dogBtn event
})//end of document

function changeStatus(){
	var status = '${param.sitterEmail}';
	if(status){
		document.getElementById("resStatus").value = 'res-3';
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
		<h2>예약 등록</h2>
	<form action="${initParam.rootPath }/member/reservation_add.do"
		method="post" onsubmit="changeStatus();">
		<sec:csrfInput />
			<label for="demand">서비스 종류</label> <select name="demand" required>
				<c:forEach var="service" items="${applicationScope.serviceList }">
					<option value="${service.code }">${service.codeName}</option>
				</c:forEach>
			</select> 
			
			<label for="resSDate">시작 날짜</label><br> 
			<input type="date" name="resSDate" required /><br>
		
			<label for="resSDate">끝날짜</label><br> 
			<input type="date" name="resEDate" required /><br>
		
			<label for="resContents">의뢰내용</label><br>
			<textarea rows="5" cols="30" name="resContents" required
			placeholder="의뢰 내용을 입력하세요"></textarea><br>
		
			<input type="hidden" name="resStatus" id='resStatus' value="res-1" />
		<br> 
		<label for="demand">요구사항 : </label><br>
			<c:forEach var="demand" items="${applicationScope.skillList }">
				<input type="checkbox" name="demand" value="${demand.code }">${demand.codeName }<br>
			</c:forEach>
		<label>돌봄 환경 선택</label><br>
			<c:forEach var="en" items="${applicationScope.enList }">
				<input type="checkbox" name="demand" value="${en.code }">${en.codeName }<br>			
			</c:forEach>
		<input type="text"
			value='<sec:authentication property="principal.email"/>'
			name="memberEmail" id="memberEmail"/><br>
		<c:if test='${param.sitterEmail != null }'>
			<input type="text" value='${param.sitterEmail }' name="sitterEmail" />
		</c:if>
		금액 30,000원 <input type="hidden" value=30000 name="price" /><br>
		
		<input type="button" id="dogBtn" value="강아지 선택"/> <br>
		<button type="submit">전송</button>
	</form>
</body>
</html>