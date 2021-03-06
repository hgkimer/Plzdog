<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#btn").on("click",function(){
		$("#regForm").submit(function(){
			var email = $("input#pId").val();
			var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
			if(!email.match(regExp)){
				alert("올바른 이메일 형식이 아닙니다");
				return false;
			}else{
				return true;
			}
		});//end of #regForm.submit()
	});//end of #btn.on("click",function(){}
});//end of document

function inputCheck(){
	if(regForm.password.value !== regForm.passwordTest.value) {
		alert("비밀번호가 일치하지 않습니다!");
		regForm.password.focus();
		return false;
	}
}
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('pZip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('pMain').value = fullRoadAddr;

                }
        }).open();
        window.close();
}
</script>

<style>
#mySidebar {
	display:none;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h2>회원 가입 </h2>
			<hr style="border: solid 1px black;">
<form name="regForm" action="${initParam.rootPath }/join_member.do" method="post" id="regForm" enctype="multipart/form-data" onsubmit="return inputCheck();">
	<sec:csrfInput/>
	<div class="form-group">
		<span class="glyphicon glyphicon-envelope"></span><label for="pId"> Email </label>
		<input type="text" name="email" id="pId" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-user"></span><label for="pName"> 이름 </label>
		<input type="text" name="memberName" id="pName" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-lock"></span><label for="pPwd"> 비밀번호 </label>
		<input type="password" name="password" id="pPwd" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-lock"></span><label for="pPwd2"> 비밀번호 확인 </label>
		<input type="password" name="passwordTest" id="pPwd" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-home"></span><label for="pZip"> 우편번호 </label>
		<input class="btn btn-default"type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<p></p>
		<input type="number" name="zipcode" id="pZip" class="form-control" required="required" readonly placeholder="우편번호">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-home"></span><label for="pMain"> 기본주소 </label>
		<input type="text" name="mainAddress" id="pMain" class="form-control" required="required" readonly placeholder="기본주소">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-home"></span><label for="pSub"> 상세주소 </label>
		<input type="text" name="subAddress" id="pSub" class="form-control" required="required" placeholder="상제 주소를 입력해 주세요.">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-picture"></span><label for="pMember">이미지</label>
		<input type="file" name="imageMember" id="pMember" class="form-control" required="required">
	</div>
	<div class="form-group">
		<span class="glyphicon glyphicon-phone"></span><label for="pPhone">전화번호 </label>
		<input type="text" name="phoneNum" id="pPhone" class="form-control" required="required">
	</div>
	<input type="hidden" name="memberEnable" value='1'>
	<div class="form-group">
		<input type="submit" value="전송" class="btn btn-default btn-lg btn-block " id="btn">
	</div>
</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>






























