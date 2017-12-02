<%@page import="com.plzdog.vo.CareImage"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>로그인한 해당 예약에 해당하는 전체 돌봄일지 조회(시터입장, 견주입장)</h2>

<c:forEach items="${care.careImage }" var="CareImage">
	<h5>--------------------------</h5>
	돌봄일지 번호 : ${care.careId }<br>
	돌봄일지 내용 : ${care.careContents }<br>
	예약번호 : ${care.resId }<br>
	<c:forEach items="${care.careImage }" var="CareImage">
		<img src="${initParam.rootPath }/careImage/${CareImage.imageName }" width="350px"><br>
	</c:forEach>
	<h5>--------------------------</h5>
</c:forEach>