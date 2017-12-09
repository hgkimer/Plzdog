<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
ddddddd
<c:forEach items="${requestScope.list }" var="res">
<p>예약 Id:${res.resId } </p>
<p>개 아이디:${res.resDetailList.dogId }</p>
<p>개 이미지:${res.dog.dogImage }</p>
<p>개 성별:{$res.dog.gender}</p>
<p>개 이름:${res.dog.dogName }</p>
<p>예약 상태:${res.resStatus }</p>
<p>시작 날짜:${res.resSDate }</p>
<p>종료 날짜:${res.resEDate }</p>
</c:forEach>


<!-- 수정하기/ 상세보기 / 삭제하기 버튼 -->
<!-- 수락/ 거절 버튼 -->
</body>
</html>