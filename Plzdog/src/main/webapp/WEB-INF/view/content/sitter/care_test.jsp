<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄일지</title>
</head>
<body>

<h3>돌봄일지 ID로 돌봄일지 조회하기</h3>
<form action="${initParam.rootPath }/care/select_care.do" method="post">
	<!-- post, 로그인, 로그아웃 방식은 sec를 꼭 붙여준다. 토큰을 보내줘야한다. -->
	<sec:csrfInput/>
	<input type="number" id="careId" name="careId">
	<button type="submit">전송</button>
</form>

<h3>돌봄일지 등록하기</h3>
<form action="${initParam.rootPath }/care/insert_care.do" method="post">
	<sec:csrfInput/>
	예약 번호 : <input type="number" id="resId" name="resId"><br>
	날짜 : <input type="date" id="careDate" name="careDate"><br>
	내용 : <textarea rows="5" cols="30" id="careContents" name="careContents"></textarea><br>
	
	<button type="submit">전송</button>
</form>

<h3>돌봄일지 이미지 등록</h3>
<form action="${initParam.rootPath }/care/insert_image.do" method="post" enctype="multipart/form-data">
	<sec:csrfInput/>
	돌봄일지 번호 : <input type="number" name="careId" id="careId"><br>
	사진 : <input type="file" name="imageCare" id="imageCare"><br>
	<button type="submit">전송</button>
</form>

<h3>돌봄일지 수정하기</h3>
<form action="${initParam.rootPath }/care/update_care.do" method="post">
	<sec:csrfInput/>
	예약 번호 : <input type="number" id="resId" name="resId"><br>
	날짜 : <input type="date" id="careDate" name="careDate"><br>
	내용 : <textarea rows="5" cols="30" id="careContents" name="careContents"></textarea><br>
 	<button type="submit">전송</button>
</form>
</body>
</html>