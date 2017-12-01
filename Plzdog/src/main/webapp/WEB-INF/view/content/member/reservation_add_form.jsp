<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/member/reservation_add.do" method="post">
	<sec:csrfInput/>
	<select name="demand" >
			<c:forEach var="service" items="${applicationScope.serviceList }">
				<option value="${service.code }">${service.codeName}</option>
			</c:forEach>
	</select><br>
	<input type="hidden" name="resType" value="1"/>
	시작날짜<input type="date" name="resSDate" required/><br>
	끝날짜<input type="date" name="resEDate"required/><br>
	의뢰내용<textarea rows="5" cols="30" name="resContents"required></textarea>
	<br>
	요구사항 : <br>
	<c:forEach var="demand"	items="${applicationScope.skillList }" varStatus="cnt">
		<input type="checkbox" name="demandList[${cnt.index }].code.code" value="${demand.code }">${demand.codeName }<br>	
	</c:forEach>
	<input type="text" value='<sec:authentication property="principal.email"/>' name="memberEmail"/><br>
	<c:if test='${param.sitterEmail != null }'>
		<input type="text" value='${param.sitterEmail }' name="sitterEmail"/>
	</c:if>
	<button type="submit">전송</button>
	
</form>
</body>
</html>