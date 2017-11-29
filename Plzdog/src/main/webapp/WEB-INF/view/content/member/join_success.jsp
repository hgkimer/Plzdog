<%@ page contentType="text/html;charset=UTF-8" %>

<h2>가입 정보</h2>
<ul class="list-group" style="font-size:1.3em">
	<li class="list-group-item">email : ${member.email}</li>
	<li class="list-group-item">회원이름 : ${member.memberName}</li>
	<li class="list-group-item">회원 비밀번호 : ${member.password}</li>
	<li class="list-group-item">회원 주소 : ${member.mainAddress} ${member.subAddress}</li>
	<li class="list-group-item">우편번호 : ${member.zipcode}</li>
	<li class="list-group-item">회원 이미지 : ${member.memberImage}</li>
	<li class="list-group-item">탈퇴여부 : ${member.memberEnable}</li>
</div>
