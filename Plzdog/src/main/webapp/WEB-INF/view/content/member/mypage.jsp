<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
   .blank {
      width:100%;
      height:200px;
   }
   
   .img-responsive {
      height:250px;
   }
</style>

<div class="w3-sidebar w3-bar-block w3-border-right" id="mySidebar" style="box-shadow:0px 5px 5px gray;">
      <ul class="nav" style="margin-top:20px; width:100%; text-align:center; position:absolute; z-index:1000;">
         
         <%--회원/관리자 공통 메뉴 /member로 시작 , 관리자 일수도 있고 , 회원일 수도 있고, 시터일 수도 있고--%>
         <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER', 'ROLE_SITTER')">
            <li><a href="${initParam.rootPath }/member/member_result_form.do">회원 정보 조회</a></li>
            <li><a href="${initParam.rootPath }/member/mydog_register_result_form.do?email=<sec:authentication property="principal.email"/>">강아지 관리</a></li>
         </sec:authorize>
         
         <sec:authorize access="hasRole('ROLE_MEMBER')">
            <li><a id="few" style="cursor: pointer;">예약 조회</a>
               <ul class="big">
                  <li class="afew"><a href="${initParam.rootPath }/member/search_reservation_res1.do?email=<sec:authentication property='principal.email'/>">견적 대기중인 예약</a></li>
                  <li class="afew"><a href="#">승인 대기중 예약</a></li>
                  <li class="afew"><a href="#">결제 완료 예약</a></li>
               </ul>
            </li>
         </sec:authorize>
         
         <sec:authorize access="hasRole('ROLE_SITTER')">
            <li><a id="more" style="cursor: pointer;">내게 온 예약 조회</a>
               <ul class="small">
               	  <li class="much"><a href="${initParam.rootPath }//sitter/search_reservation_res1_all.do">나를 기다리는 예약</a></li>
                  <li class="much"><a href="${initParam.rootPath }/sitter/waiting_for_approval_reservation_result.do?sitterEmail=<sec:authentication property="principal.email"/>">승인 대기중 예약</a></li>
				  <li class="much"><a href="${initParam.rootPath }/sitter/waiting_payment_reservation_result.do?sitterEmail=<sec:authentication property="principal.email"/>">결제 대기중 예약</a></li>
				  <li class="much"><a href="${initParam.rootPath }/sitter/complete_payment_reservation_result.do?sitterEmail=<sec:authentication property="principal.email"/>">결제 완료 예약</a></li>
               </ul>
            </li>
         </sec:authorize>
         
         
         <%--관리자 메뉴 /admin 으로 시작--%>
         <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="${initParam.rootPath }/admin/select_waiting.do">시터 등록</a></li>
            <li><a href="${initParam.rootPath }/admin/register_admin_form.do">관리자 등록</a></li>
         </sec:authorize>
         
         <%--인증 관련 없는 메뉴 (로그인 여부와 관련없이 나올 메뉴) --%>
         
         <%--인증된(로그인한) 사용자 메뉴 : 인증 안된상태에서 안보여야 하는 메뉴 --%>
         <sec:authorize access="isAuthenticated()">
            <li><a href="${initParam.rootPath }/member/deleteMember.do?email=<sec:authentication property="principal.email"/>">회원탈퇴</a>
         </sec:authorize>
      </ul>
</div>

<div class="col-lg-3" style="height:100%; float:left;"></div>
<div class="col-lg-6" style="font-size:18px; margin-top:150px;">
   <div class="col-lg-6 memberImage">
      <img src="${initParam.rootPath }/memberImage/<sec:authentication property='principal.memberImage'/>" class="img-responsive" width="350px">
   </div>

   <div class="blank">
      <div class="col-lg-2">Email</div>
      <div class="col-lg-4"><sec:authentication property="principal.email"/></div>
   
      <div class="col-lg-2">이름</div>
      <div class="col-lg-4"><sec:authentication property="principal.memberName"/></div>
   
      <div class="col-lg-2">회원 주소</div>
      <div class="col-lg-4"><sec:authentication property="principal.mainAddress"/> <sec:authentication property="principal.subAddress"/></div>
      
      <div class="col-lg-2">우편번호</div>
      <div class="col-lg-4" ><sec:authentication property="principal.zipcode"/></div>
   </div>
   <div class="col-lg-6">
      <a href="${initParam.rootPath }/member/member_edit_form.do" class="btn btn-default">정보수정</a>
   </div>
</div>
<div class="col-lg-3" style="height:100%; float:right;"></div>



<script>
$(document).ready(function(){
   $("#few").on("click", function(){
      $(".afew").slideToggle();
   });
   
   $("#more").on("click", function(){
      $(".much").slideToggle();
   });
});
</script>