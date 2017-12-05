
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function move(menu){
	var query="<%=cp%>/hotShop/productList?state="+menu;
	location.href=query;
	return;
}
</script>
   <!-- 내비 -->
   <div class="content" align="center" style="z-index: 9;" id="div4">
      <nav class="navbar" style="background: white; height: 60px; margin: 0px auto; border: none;">
        <div class="container-fluid" align="center">
          <ul class="nav navbar-nav menu">
            <li>
            	<a href="#">베스트</a>
            	<div align="center" class="menuEx" style="display: none;">
            	<ul>
            		<li onclick="move('hitCount');">조회수</li>
            		<li onclick="move('like');">좋아요</li>
            		<li onclick="move('star');">후기별점</li>
            		<li onclick="move('sellOrder');">판매순</li>
            		<li onclick="move('recommend');">사장추천</li>
            	</ul>
            	</div>
            </li>
            <li>
            	<a href="move('newProduct');">신상품</a>
            </li>
            <li>
            	<a href="#">상품유형별</a>
            	<div align="center" class="menuEx" style="display: none;">
	            	<ul>
	            		<li onclick="move('drink');">음료</li>
	            		<li onclick="move('snack');">간식</li>
	            		<li onclick="move('food');">식사</li>
	            		<li onclick="move('dressing');">드레싱</li>
	            		<li onclick="move('supplement');">보충제</li>
	            		<li onclick="move('healthFood');">건강식</li>
	            	</ul>
            	</div>
            </li>
            <li>
            	<a href="#">영양소별</a>
            	<div class="menuEx" style="display: none">
            	<ul>
            		<li onclick="move('protein');">단백질</li>
            		<li onclick="move('carbohydrate');">탄수화물</li>
            		<li onclick="move('fat');">지방</li>
            		<li onclick="move('minerals');">무기질</li>
            		<li onclick="move('dietary');">식이섬유</li>
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
      </nav>
   </div>