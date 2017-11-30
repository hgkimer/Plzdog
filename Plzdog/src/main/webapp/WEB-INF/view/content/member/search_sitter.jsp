<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="${initParam.rootPath }/member/recommend_sitter.do">도그시터 추천받기</a><br>
<a href="${initParam.rootPath }/member/search_sitter.do">시터 검색</a><br>
<form action="${initParam.rootPath }/member/goToProfile.do" method="post">
	<sec:csrfInput/>
	<input type="hidden" value="hgkimer@naver.com" name="email"/>
	<button type="submit">hgkimer@naver.com의 프로필</button> 
</form>	


</body>
</html>