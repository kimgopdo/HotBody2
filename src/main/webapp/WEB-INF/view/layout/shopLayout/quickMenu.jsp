
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.nav li > a{
   color: black; 
   height: 60px; 
   padding-top: 19px; 
   width: 150px; 
   text-align: center; 
   font-weight: bold; 
   font-size: 16px;
   width: 293px;
}

.container{
  width: 100%;
  position: relative;
  text-align: center;
}
.content{
	margin: 0 10% 0 10%;
}
.menuEx{
	width:120px;
	
	text-align: center; 
	font-weight: bold;
	font-size: 14px;
}
.menuEx ul li:hover{
	background: #eeeeee;
	cursor: pointer;                                 
}
.menuEx ul{
	margin: 0;
	padding: 0;
	list-style: none;
}
.menuEx ul li{
	padding: 8px;                        
	text-align: center;
}

</style>
<!-- 서브메뉴 버튼 -->
<script type="text/javascript">
function quickMenu(){
		if($("#quickMenu").attr("class")!="is-active"){
			$("#quickMenu").css("z-index", "9");
			$("#quickMenu").fadeIn(1000);		
			$("#quickMenu").addClass("is-active");
		}else{
			$("#quickMenu").fadeOut(1000);
			$("#quickMenu").removeClass("is-active");
			$("#quickMenu").css("z-index", "0");
		}
	};                        
</script>
<!-- 메뉴 펼치기 -->
<script type="text/javascript">
$(function(){
	$(".menu").hover(function(){                                         
		 $(".menuEx").stop().animate({
			  height:'toggle'
			 ,opacity: "1"
		 },"100");
	});
});
</script>

<!-- 이미지 테두리 없애기 -->
<style type="text/css">
<!--
IMG {border: none;}
-->
</style>
 
<!-- 텍스트 밑줄없애기-->
<style type="text/css">
<!--
A:link { text-decoration:none ; }
A:visited { text-decoration:none ; }
A:active { text-decoration:none ; }
A:hover { text-decoration:none; }
-->
</style>  
<!-- 텍스트 링크속성 변경하기 -->
<style type="text/css">
<!--
A:link { color:#컬러코드 ;text-decoration:none ; }
A:visited { color:#컬러코드 ;text-decoration:none ; }
A:active { color:#컬러코드 ; text-decoration:none ; }
A:hover { color:#컬러코드 ; text-decoration:none; }
-->
</style> 

</head>
<body>

<!-- 퀵메뉴 -->
<div align="center" id="quickMenu" style="width:100%; height:1500px; background-color: #FEF9F6; position: fixed;display: none;">
	<div align="center" style="width: 80%; height: 60px; margin-top: 453px;">
	<ul class="nav navbar-nav menu">
            <li>
            	<a href="#">베스트</a>
            	<div align="center" class="menuEx" style="display: none;">
            	<ul>
            		<li onclick="">조회수</li>
            		<li onclick="">좋아요</li>
            		<li onclick="">후기별점</li>
            		<li onclick="">판매순</li>
            		<li onclick="">사장추천</li>
            	</ul>
            	</div>
            </li>
            <li>
            	<a href="#">신상품</a>
            </li>
            <li>
            	<a href="#">상품유형별</a>
            	<div align="center" class="menuEx" style="display: none;">
	            	<ul>
	            		<li onclick="">음료</li>
	            		<li onclick="">간식</li>
	            		<li onclick="">식사</li>
	            		<li onclick="">드레싱</li>
	            		<li onclick="">보충제</li>
	            		<li onclick="">건강식</li>
	            	</ul>
            	</div>
            </li>
            <li>
            	<a href="#">영양소별</a>
            	<div class="menuEx" style="display: none">
            	<ul>
            		<li onclick="">단백질</li>
            		<li onclick="">탄수화물</li>
            		<li onclick="">지방</li>
            		<li onclick="">무기질</li>
            		<li onclick="">식이섬유</li>
            	</ul>
            	</div>
            </li>
            <li>
            	<a href="#">클래스 식단</a>
            	<div align="center" class="menuEx" style="display: none;">
            	<ul>
            		<li onclick="">온라인클래스</li>
            		<li onclick="">오프라인클래스</li>
            	</ul>
            	</div>
            </li>
          </ul>
      </div>
</div>

</body>
</html>