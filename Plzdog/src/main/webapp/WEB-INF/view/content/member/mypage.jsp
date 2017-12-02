<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
mypage.do<br>
<form action="${initParam.rootPath }/member/search_reservation.do" method="post">
	<sec:csrfInput/>
	<input type="text" name="mEmail">
	<button type="submit">전송</button>
</form>
<br>
<a href="${initParam.rootPath }/member/member_result_form.do">회원 정보 조회</a>
<form action="${initParam.rootPath }/sitter/select_reservation_simple.do" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="email" value='<sec:authentication property="principal.email"/>'/>
	<button type="submit">내게 온 예약 조회</button>
</form>
</body>
</html>