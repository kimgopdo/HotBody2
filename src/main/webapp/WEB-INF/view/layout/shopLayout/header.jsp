
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function move(code,menuname,cl){
	name=encodeURI(menuname);
	location.href="<%=cp%>/hotShop/productList?code="+code+"&menuname="+menuname+"&cl="+cl;
	return;
}
</script>
   <!-- 내비 -->
   <div align="center" class="pull-right" style="min-width:1140px;z-index: 9;" id="div4">
      <nav class="navmenu center" style="background: white; height: 60px; margin: 0px auto; border: none;">
          <ul>
            <li>
            	<a href="move('newProduct');">신상품</a>
            </li>
            <li class="sub-menu" data-role="listview">
            	<a href="#">상품유형별</a>
	            	<ul id="productLike" class="productLike">
	            	</ul>
            </li>
            <li class="sub-menu" data-role="listview">
            	<a href="#">영양소별</a>
            	<ul id="productNutrient" class="productNutrient">
            	</ul>
            </li>
            <li>
            	<a href="javascript:location.href='<%=cp%>/hotShop/shopReviews';">상품 전체 후기</a>
            </li>
          </ul>
      </nav>
     </div>