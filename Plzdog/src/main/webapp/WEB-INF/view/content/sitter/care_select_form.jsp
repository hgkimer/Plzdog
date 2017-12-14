<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${careList eq null }">
	값이 없습니다.
	<% break; %>
	<c:forEach items="careList" var="care" varStatus="status">
		
		-------------------------------------
		돌봄일지 번호 : ${care.careId }<br>
		돌봄일지 내용 : ${care.careContents }<br>
		예약번호 : ${care.resId }<br>
		<c:forEach items="${care.careImage }" var="CareImage">
			<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
		</c:forEach>
		<button type="button" class="btn btn-default" id='editCareId' onclick=''>돌봄일지수정</button>
		<button type="button" class="btn btn-default" id='deleteCareId' onclick=''>돌봄일지삭제</button>
		-------------------------------------
	</c:forEach>
</c:if>	
</body>
</html>