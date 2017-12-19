<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	var basket=getCookie('hotbodyBasket');
	$("h1").text(basket);
})
</script>
      <!-- 왼쪽 사이드 바 -->
   <div id="leftSide" style="width: 10%; height: 100%; top:0px; left: 0px; position: fixed; z-index: 10;">                                    
         <a href="javascript:location.href='<%=cp%>/hotShop/created';">created페이지</a>
         <a href="javascript:location.href='<%=cp%>/hotShop/productInlist';">입고리스트 페이지</a>
         <h1></h1>
         <div style="margin-top: 40px; margin-left: 30px;">
         <a href="<%=cp%>/" style="color: black;height: 60px; padding: 1px;">
            <img src="<%=cp%>/resource/images/shop_images/HOTBODY_Logo.png"/>
         </a>                
         </div>                     
         <div id="basketBtn">
	         <button type="button" class="btn btn-default btn-lg basketBtn" style="width:50px; border: none; outline: none;">
	            <span class="glyphicon glyphicon-shopping-cart"></span>
	         </button>
         </div>
	</div>