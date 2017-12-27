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
<title>HotBody COOL Body</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<link href="<%=cp%>/resource/mainboot/css/flexslider.css" rel="stylesheet" type="text/css">
<link href="<%=cp%>/resource/mainboot/css/animate.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=cp%>/resource/mainboot/css/owl.carousel.css" rel="stylesheet">
<link href="<%=cp%>/resource/css/shopCss/style.css" rel="stylesheet" type="text/css">
<link href="<%=cp%>/resource/mainboot/css/fileuploader.css" rel="stylesheet" type="text/css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/resource/css/shopCss/shopLayout.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<%-- <script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.js"></script> --%>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resource/mainboot/js/jquery.nicescroll.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/superfish.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/jquery.flexslider.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/myscript.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/owl.carousel.js"></script>
<script src="<%=cp%>/resource/mainboot/js/animate.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/json2.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/monthly.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/imgCut.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/extMenu.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/quickMenuBtn.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/btnCenterCal.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/tabMove.js"></script>
<script type="text/javascript">
jQuery.curCSS = function(element,prop,val){
	return jQuery(element).css(prop,val)
}
$(document).ready(function(){ 
    $('selector').css('width', $(window).width()); 
    $('selector').css('height', $(window).height()); 
    $(window).resize(function() { 
        $('selector').css('width', $(window).width()); 
        $('selector').css('height', $(window).height()); 
    }); 
});
jQuery.browser = {};
(function () {
	$("body").niceScroll();
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>


<!-- 이미지 테두리 없애기                  fsgdfgf -->
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

<body style="min-width: 100%;">
<script type="text/javascript">
$(function(){
	menuCall();
})
function menuCall(){
	var url="<%=cp%>/hotShop/menuCall";
	var userId="${sessionScope.member.userId}";
		$.ajax({
			type:"post"
			,url:url
			,dataType:"json"
			,success:function(menuData){
				$.each(menuData.bclList,function(index, item){
					if(userId=='admin'){
						$(".productLike").append("<li><a onclick='move("+item.bclcode+",\""+item.bclname+"\",\"bcl\");'>"+item.bclname+"</a><button type='button' class='btn' style='width:100%;' onclick='bciDelete("+item.bclcode+");'>"+item.bclname+"(삭제)</button></li>");						
					}else{
						$(".productLike").append("<li><a onclick='move("+item.bclcode+",\""+item.bclname+"\",\"bcl\");'>"+item.bclname+"</a></li>");												
					}
						$(".QproductNutrient").append("<li><a onclick='move("+item.bclcode+",\""+item.bclname+"\",\"bcl\");'>"+item.bclname+"</a></li>");
				});
				$.each(menuData.sciList,function(index, item){
					if(userId=='admin'){
						$(".productNutrient").append("<li><a onclick='move("+item.scicode+",\""+item.sciname+"\",\"sci\");'>"+item.sciname+"</a><button type='button' class='btn' style='width:100%;' onclick='sclDelete("+item.scicode+");'>"+item.sciname+"(삭제)</button></li>");						
					}else{
						$(".productNutrient").append("<li><a onclick='move("+item.scicode+",\""+item.sciname+"\",\"sci\");'>"+item.sciname+"</a></li>");
					}
						$(".QproductLike").append("<li><a onclick='move("+item.scicode+",\""+item.sciname+"\",\"sci\");'>"+item.sciname+"</a></li>");
				});
				$("#productNutrient").trigger("create");
				$("#productLike").trigger("create");
				$("#QproductNutrient").trigger("create");
				$("#QproductLike").trigger("create");
			}
		});
}

</script>
<!-- 쿠키사용 함수 -->
<script type="text/javascript">
function setCookie(cookie_name, value, days) {
	  var exdate = new Date();
	  exdate.setDate(exdate.getDate() + days);
	  // 설정 일수만큼 현재시간에 만료값으로 지정

	  var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	  document.cookie = cookie_name + '=' + cookie_value;
	}
function getCookie(cookie_name) {
	  var x, y;
	  var val = document.cookie.split(';');

	  for (var i = 0; i < val.length; i++) {
	    x = val[i].substr(0, val[i].indexOf('='));
	    y = val[i].substr(val[i].indexOf('=') + 1);
	    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
	    if (x == cookie_name) {
	      return unescape(y); // unescape로 디코딩 후 값 리턴
	    }
	  }
	}
function removePayCookie(id,amount){
	 var items = getCookie('hotbodyBasket'); // 이미 저장된 값을 쿠키에서 가져오기
	  var maxItemNum = 10; // 최대 저장 가능한 아이템개수
	  var expire = 0; // 쿠키값을 저장할 기간
	  console.log(id);
	  console.log(amount);
	  if (items) {
		 var itemArray = items.split(',');
		 for(var n=0; n<id.length;n++){
			 if (items.indexOf(id[n]) != -1) {
				 item=id[n]+"-"+amount[n];
				 setCookie('hotbodyBasket', item, expire);
			    }
		 }
	  }
}
function addCookie(id) {
	  var items = getCookie('hotbodyBasket'); // 이미 저장된 값을 쿠키에서 가져오기
	  var maxItemNum = 10; // 최대 저장 가능한 아이템개수
	  var expire = 7; // 쿠키값을 저장할 기간
	  if (items) {
	    var itemArray = items.split(',');
		    if (items.indexOf(id) != -1) {
		      // 이미 존재하는 경우 종료
		      console.log('중복된단다잉');
		    }else{
			    // 새로운 값 저장 및 최대 개수 유지하기
			    itemArray.unshift(id);
			    if (itemArray.length > maxItemNum ) itemArray.length = 10;
			    items = itemArray.join(',');
			    setCookie('hotbodyBasket', items, expire);
			}
	  }else{
		  console.log("159");
		  setCookie('hotbodyBasket', id, expire);
	  }
	}
	
function runEffect() {
    // get effect type from
	var items = getCookie('hotbodyBasket');
    if(items){
	    var item=items.split(",");
	    var n=item.length;
	    if(n!=0){
	    	showBasket();
		    var options = {percent: 10};
		    // Run the effect
		    $( "#bubble" ).toggle( "shake", options, 40 );
		    $( "#totC" ).text(n);
	    }else{
	    	hideBasket();
	    }
    }
  };
</script>
<div class="quickMenu" style="position: absolute;">
	<tiles:insertAttribute name="quickMenu"/>
</div>

<div class="leftSide" style=" float: left; width: 52px; position: fixed; z-index: 10;">
    <tiles:insertAttribute name="leftSide"/>
</div>
	
<div class="container" style="float: left; padding: 10px; width: 80%; padding: 0; margin-left: 10%; margin-right: 10%;">
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body"/>
</div>

<div class="rightSide" style="right:0; width: 52px; position: fixed; z-index: 10;">
    <tiles:insertAttribute name="rightSide"/>
</div>
</body>
</html>