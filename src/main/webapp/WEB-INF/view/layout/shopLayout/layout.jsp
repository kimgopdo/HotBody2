<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
<link rel="stylesheet" href="/hotbody/resource/css/tabs.css" type="text/css">
<link href="/hotbody/resource/mainboot/css/flexslider.css" rel="stylesheet" type="text/css">
<link href="/hotbody/resource/mainboot/css/animate.css" rel="stylesheet" type="text/css" media="all">
<link href="/hotbody/resource/mainboot/css/owl.carousel.css" rel="stylesheet">
<link href="/hotbody/resource/css/shopCss/style.css" rel="stylesheet" type="text/css">
<link href="/hotbody/resource/mainboot/css/fileuploader.css" rel="stylesheet" type="text/css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/resource/css/shopCss/shopLayout.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<%-- <script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.js"></script> --%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/hotbody/resource/mainboot/js/jquery.nicescroll.min.js" type="text/javascript"></script>
<script src="/hotbody/resource/mainboot/js/superfish.min.js" type="text/javascript"></script>
<script src="/hotbody/resource/mainboot/js/jquery.flexslider-min.js" type="text/javascript"></script>
<script src="/hotbody/resource/mainboot/js/owl.carousel.js"></script>
<script src="/hotbody/resource/mainboot/js/animate.js" type="text/javascript"></script>
<script src="/hotbody/resource/mainboot/js/myscript.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/hotbody/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/json2.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/monthly.js"></script>
<script type="text/javascript">
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
$(function() {
   $("html").niceScroll();
})
</script>
<!-- 버튼 센터 계산 -->
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/btnCenterCal.js"></script>
<!-- 퀵메뉴 버튼 -->
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/quickMenuBtn.js"></script>
<!-- img 자르기 -->
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/imgCut.js"></script>
<!-- login 모달 -->
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/loginModal.js"></script>
<!-- tab 이동 -->
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/tabMove.js"></script>
<!-- searchBtn -->
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/searchAnimate.js"></script>

<!-- 이미지 테두리 없애기                  fsgdfgf -->
<style type="text/css">
<!--
IMG {border: none;}
-->
</style>
 
<!-- 텍스트 밑줄없애기 -->
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

<div class="quickMenu">
	<tiles:insertAttribute name="quickMenu"/>
</div>

<div class="leftSide">
    <tiles:insertAttribute name="leftSide"/>
</div>
	
<div class="container">
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body"/>
</div>

<div class="rightSide">
    <tiles:insertAttribute name="rightSide"/>
</div>

</body>
</html>