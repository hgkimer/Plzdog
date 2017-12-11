<%@ page contentType="text/html; charset=UTF-8"%>
<%--Spring Security 커스텀태그 --%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
* {
	box-sizing: border-box;
}

.slide {
	width:100%;
	height:600px;
}

.mySlides {
	width:100%;
	height:100%;
}

.one {
	width:100%;
	height:150px;
	text-align:center;
}

h2, h4 {
	font-weight:bold;
}

h2 {
	margin-top:100px;
}

h4 {
	color:gray;
}

</style>

<div class="slide">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image1.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image2.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image3.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image4.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image5.jpg">
</div>


<div class="one">
	<h2>믿음이 가는 수의대생이 돌보는 도그시팅</h2>
	<h4>내 아이 믿고 맡길 수 있는 도그시터를 찾아보세요!</h4>
</div>



<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>