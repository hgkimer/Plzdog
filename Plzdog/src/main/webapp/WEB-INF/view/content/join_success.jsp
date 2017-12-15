<%@ page contentType="text/html;charset=UTF-8" %>
<style>
#mySidebar {
	display:none;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h2>가입 정보</h2>
				email : ${requestScope.member.email}<br>
				회원이름 : ${requestScope.member.memberName}<br>
				회원 주소 : ${requestScope.member.mainAddress} ${requestScope.member.subAddress}<br>
				우편번호 : ${requestScope.member.zipcode}<br>
				회원 이미지 : <img src="${initParam.rootPath }/memberImage/${requestScope.member.memberImage}" width="350px"><br>
				탈퇴여부 : ${requestScope.member.memberEnable}<br>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>