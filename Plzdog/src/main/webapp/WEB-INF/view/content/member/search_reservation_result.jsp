<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
search_reservation_result.do<br>

오류 메세지 : ${requsetScope.errorMessage }
<br>
=----------------------------------------------------------<br>
내가 견주<br>
<c:forEach var="res" items="${requestScope.mresList }">
	예약 번호 : ${res.resId }<br>
	예약 상태 : ${res.resType }<br>
	리뷰 : ${res.resContents }<br>
	견주 이메일 : ${res.memberEmail }<br>
	시터 이메일  : ${res.sitterEmail }<br>
	<form action="${initParam.rootPath }/member/delete_reservation.do" method="post">
		<input type="hidden" value="${res.resId }" name="resId">
		<button type="submit">예약 삭제</button>
	</form>
</c:forEach>
----------------------------------------------------------<br>
내가 시터<br>

<c:forEach var="res" items="${requestScope.sresList }">
	예약 번호 : ${res.resId }<br>
	예약 상태 : ${res.resType }<br>
	리뷰 : ${res.resContents }<br>
	견주 이메일 : ${res.memberEmail }<br>
	시터 이메일  : ${res.sitterEmail }<br>
	<form action="${initParam.rootPath }/member/delete_reservation.do" method="post">
		<sec:csrfInput/>
		<input type="text" value="${res.resId }" name="resId" readonly>
		<button type="submit">예약 삭제</button>
	</form>
</c:forEach>



</body>
</html>