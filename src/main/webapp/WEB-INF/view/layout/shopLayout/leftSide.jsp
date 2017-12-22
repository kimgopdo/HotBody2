<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	showBasketList();
	BasketList();
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
	var uid="${sessionScope.member.userId}";
	var q;
	console.log(cookie);
	<%-- if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	}else  --%>if(cookie){
		if(cookie.indexOf(",") == -1){
			cookie=cookie.split(",");
			q="cookie="+cookie;
		}else{
			q="cookie="+cookie1;
		}
		var url="<%=cp%>/hotShop/basketList";
		console.log(q);
		$.ajax({
			type:"post"
			,data:q
			,url:url
			,seccess:function(e){
				console.log(e);
				$("#BasketList").html(e);
			}
			,errer:function(e){
				console.log(e);
			}
		})
	} 
}
</script>
      <!-- 왼쪽 사이드 바 -->
   <div id="leftSide" style="width: 10%; height: 100%; top:0px; left: 0px; position: fixed; z-index: 10;">                                    
         <a href="javascript:location.href='<%=cp%>/hotShop/created';">created페이지</a>
         <a href="javascript:location.href='<%=cp%>/hotShop/productInlist';">입고리스트 페이지</a>
         <div style="margin-top: 40px; margin-left: 30px;">
         <a href="<%=cp%>/" style="color: black;height: 60px; padding: 1px; position: absolute;">
            <img src="<%=cp%>/resource/images/shop_images/HOTBODY_Logo.png"/>
         </a>                
         </div>
		<table id="BasketList">
			
		</table>                    
         <div id="basketBtn">
         	<ul>
         		<li style="position: absolute;">
	         		<button type="button" class="btn btn-default btn-lg basketBtn" style="width:50px; border: none; outline: none; position: relative;">
		            	<span class="glyphicon glyphicon-shopping-cart"></span>
		         	</button>
	         	</li>
         		<li id="basket_check" style="opacity: 0;">
         			<div id="bubble" class="basketBtn2"style="width: 24px; height:24px; background-image: url(<%=cp%>/uploads/shopList/chat3.png); z-index: 11;position: absolute;">                        
		         	<span id="totC" style="margin-left:10px; color:white; font-family:고딕;"></span>
         			</div>
         		</li>
         	</ul>
	         
         </div>
	</div>