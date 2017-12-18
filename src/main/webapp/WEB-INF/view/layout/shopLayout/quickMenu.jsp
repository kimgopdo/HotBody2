
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<script>
$(window).on("load",function(){
	var win_height=window.innerHeight
	var center=win_height/3;
	$("#quickMenuHeader").css("margin-top",center);
})
</script>
<!-- 퀵메뉴 -->
<!-- 내비 -->
   <div id="quickMenu" align="center" class="pull-right" style="width:100%; height:1500px; background-color: #fff; position: fixed;display: none;">
      <nav id="quickMenuHeader" class="navmenu center" style="background: white; height: 60px; margin: 0px auto; border: none;">
          <ul id="ulQuick">
            <li>
            	<a href="move('newProduct');">신상품</a>
            </li>
            <li class="sub-menu">
            	<a href="#">상품유형별</a>
	            	<ul id="QproductLike" class="QproductLike">
	            	</ul>
            </li>
            <li class="sub-menu">
            	<a href="#">영양소별</a>
            	<ul id="QproductNutrient" class="QproductNutrient">
            	</ul>
            </li>
            <li>
            	<a href="javascript:location.href='<%=cp%>/hotShop/shopReviews';">상품 전체 후기</a>
            </li>
          </ul>
      </nav>
     </div>