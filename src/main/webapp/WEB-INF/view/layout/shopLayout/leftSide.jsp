<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	String cp=request.getContextPath();
%>
<style>
.paymentPage{
	top: 100px;
	font-size: 14px;
	font-family: inherit;
	margin-bottom: 200px;
}
.paymentPage button{
	border: 1px solid #000000;
	background: #ffffff;
	font-size: 14px;
	font-weight:bolder;
}
.paymentPage tr{
	border-bottom: 2px solid #e7e7e7;
	height: 80px;
}
.paymentPage input[type=text]{
	margin-left: 5px;
	margin-right: 5px;
	padding: 2px;
	border-radius: 2px;
	border: 1px solid #e7e7e7;
	outline: none;
}
.paymentPage select{
	padding: 3px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<script type="text/javascript">
$(function(){
	showBasketList();
})
function showBasketList() {
	 
	      // Most effect types need no options passed by default
	      var options = {};
	 		
	      // Run the effect
	      $( "#quickBasketList" ).effect("clip", options, 500);
};
function showBasket(){
	$("#basket_check").animate({
		"opacity" : "0",
		"display" : "none"
	},"slow")
	$("#basket_check").animate({
		"display" : "block",
		"opacity" : "1"
	},"fast")
}
function hideBasket(){
	$("#basket_check").animate({
		"opacity" : "0",
		"display" : "none"
	},"fast")
}
function BasketList(){
	var cookie=getCookie("hotbodyBasket");
	if(cookie==null){
		return;
	}
	var uid="${sessionScope.member.userId}";
	var q;
	//console.log(cookie);
	<%-- if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	}else  --%>if(cookie){
		var url="<%=cp%>/hotShop/basketList?cookie="+cookie;
		$.ajax({
			type:"get"
			,url:url
			,success:function(e){
				console.log(e);
				$("#BList").html(e);
			}
			,errer:function(e){
				console.log(e);
			}
		})
	} 
}
</script>
<script>
  $( function() {
    $( "#basketList" ).dialog({
      autoOpen: false,
      width : "850px",
      resizable: false,
      buttons:{
          "구매":function(){
              $(this).dialog("close");
              paymentB();
          }
      },
      show: {
        effect: "blind",
        duration: 500
      },
      hide: {
        effect: "blind",
        duration: 500
      }
    });
 	
    $( "#basket" ).on( "click", function() {
    	if(getCookie("hotbodyBasket")!=null){
	      $( "#basketList" ).dialog( "open" );    		
    	}else{
    		alert("상품이 없습니다.");
    	}
    });
  } );

function paymentB(){
	var array=getCookie("hotbodyBasket").split(",");
	var member="${sessionScope.member.userId}";
	if(member!=""){
		location.href="<%=cp%>/hotShop/payment?cookie="+array+"&userId="+member;
		return;
	}else{
		location.href="<%=cp%>/member/login?prePage=hotShop";
		return;
	}
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  </script>
  	<div id="basketList" title="장바구니" style="display: none;">
	  	<table id="BList" style="width:800px;">
	  		
		</table>
	</div>
      <!-- 왼쪽 사이드 바 -->
   <div id="leftSide" style="height: 1000px; top:0px; left: 0px;z-index: 10;">             
         <div id="basketBtn">
         	<ul>
         		<li style="position: absolute;">
	         		<button type="button" id="basket" class="btn btn-default btn-lg basketBtn" style="width:50px; border: none; outline: none; position: relative; margin-left:2%; z-index: 11;" onclick="BasketList();">
		            	<span class="glyphicon glyphicon-shopping-cart"></span>
		         	</button>
	         	</li>
         		<li id="basket_check" style="opacity: 0;">
         			<div id="bubble" class="basketBtn2"style="width: 24px; height:24px; background-image: url(<%=cp%>/uploads/shopList/chat3.png); z-index: 11;position: absolute; margin-left:50px;">                        
		         	<span id="totC" style="margin-left:10px; color:white; font-family:고딕;"></span>
         			</div>
         		</li>
         	</ul>
	         
         </div>
	</div>