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
<c:forEach items="${list }"></c:forEach>
<p>개 이미지:</p>
<p>개 성별:</p>
<p>개 이름:</p>
<p>개 성별:</p>
<p>예약 상태:</p>
<p>시작 날짜:</p>
<p>종료 날짜:</p>


<!-- 수정하기/ 상세보기 / 삭제하기 버튼 -->
<!-- 수락/ 거절 버튼 -->
</body>
</html>