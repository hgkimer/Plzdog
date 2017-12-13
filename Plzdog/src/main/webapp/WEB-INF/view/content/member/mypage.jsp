<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
   
</style>
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

</script>