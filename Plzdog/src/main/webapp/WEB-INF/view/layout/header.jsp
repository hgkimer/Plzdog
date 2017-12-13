<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--Spring Security 커스텀태그 --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>

<style type="text/css">
   * {
      margin:0 auto;
      padding:0;
      list-style:none;
      text-decoration:none;
   }
   
   body {
      width:100%;
      height:100%;
   }
   
   a {
      color:inherit;
   }
   
   a:hover {
      text-decoration:none;
   }
   
   header {
      width:100%;
      height:100px;
      background-color:#009688;
      box-shadow:0px 5px 5px gray;
      position:relative;
      z-index:1;
   }
   
   .nav {
      width:auto;
      float:right;
      font-weight:bold;
   }
   
   .afew:hover {
      background-color:rgba(0,0,0,0.1);
   }
   
   .much:hover {
      background-color:rgba(0,0,0,0.1);
   }
   
   .nav img {
      width:30px;
      height:30px;
   }
   
   .navi {
      font-weight:bold;
      font-size:20px;
      float:left;
      width:auto;
      height:100%;
      text-align:center;
      line-height:80px;
      margin-left:40px;
      color:white;
   }
   
   .w3-teal {
      height:100px;
   }
   
   
   .afew, .much, ::-webkit-scrollbar {
      display:none;
   }
   
   .much, .afew {
      width:100%;
      height:30px;
      font-size:15px;
      background-color:#d1d1d1;
      line-height:30px;
   }

</style>
</head>

<body>
   <header>
   <%-- 사이드 바 --%>
         
   
      
      <!-- 
         로그아웃전송폼
         + 로그인/로그아웃은 반드시 POST방식으로 요청하며 csrf 토큰을 보내야 한다.
         + 로그아웃은 단순 링크이므로 아래와 같이 hidden 폼을 말들고 클릭시 Javascript에서 form을 submit하여 처리한다.
       -->
      
         <form id="logoutForm" action="${initParam.rootPath }/logout.do" method="post" style="display:none">
             <sec:csrfInput/>
         </form>

      <%-- 헤더 부분 --%>
         <ul class="nav">
            <%--인증 안된(로그인 안한) 사용자 메뉴 : 인증되면 안보여야 하는 메뉴 --%>
            <sec:authorize access="!isAuthenticated()">
               <li class="navi"><a href="${initParam.rootPath }/login_form.do">로그인</a></li>
               <li class="navi"><a href="${initParam.rootPath }/join_form.do">회원가입</a></li>
               <li class="navi"><a href="${initParam.rootPath }/main.do">메인페이지</a></li>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
               <li class="navi"><a href="${initParam.rootPath }/member/sitter_register.do"><img src="${initParam.rootPath }/image/foot.png">도그시터 신청하기</a></li>
               <li class="navi"><a href="${initParam.rootPath }/member/search_sitter.do"><img src="${initParam.rootPath }/image/search.png">도그시터 찾기</a></li>
               <li class="navi"><a href="${initParam.rootPath }/main.do">메인페이지</a></li>
               <li class="navi"><a href="${initParam.rootPath }/member/mypage.do">마이페이지</a></li>
               <li class="navi"><a id="logout" style="cursor: pointer;">로그아웃</a></li>
            </sec:authorize>
         </ul>
   </header>
<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}   

$(document).ready(function(){
   $(".navi > #logout").on("click", function(){
      $("#logoutForm").submit();
   });

});
</script>
</body>
</html>
