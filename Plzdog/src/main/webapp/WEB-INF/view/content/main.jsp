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

img {
	width:100%;
	height:100%;
}
</style>

<div class="slide">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image1.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image2.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image3.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image4.jpg">
  <img class="mySlides" src="${initParam.rootPath }/slideImage/image5.jpg">
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