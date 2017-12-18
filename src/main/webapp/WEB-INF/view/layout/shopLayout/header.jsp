
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function move(menu,name){
	name=encodeURI(name);
	location.href="<%=cp%>/hotShop/productList?cl="+menu+"&name="+name;
	return;                        
}
</script>
   <!-- 내비 -->
   <div align="center" class="pull-right" style="min-width:1140px;z-index: 9;" id="div4">
      <nav class="navmenu center" style="background: white; height: 60px; margin: 0px auto; border: none;">
          <ul>
            <li class="sub-menu">
            	<a href="#" style="font-size: 16px;">베스트</a>
            	<ul>
            		<li onclick="move('hitCount','조회수');"><a>조회수</a></li>
            		<li onclick="move('like','좋아요');"><a>좋아요</a></li>
            		<li onclick="move('star','후기별점');"><a>후기별점</a></li>
            		<li onclick="move('sellOrder','판매순');"><a>판매순</a></li>
            		<li onclick="move('recommend','사장추천');"><a>사장추천</a></li>
            	</ul>
            </li>
            <li>
            	<a href="move('newProduct');" style="font-size: 16px;">신상품</a>
            </li>
            <li class="sub-menu">
            	<a href="#" style="font-size: 16px;">상품유형별</a>
	            	<ul>
	            		<li onclick="move('7','음료');"><a>음료</a></li>
	            		<li onclick="move('8','간식');"><a>간식</a></li>
	            		<li onclick="move('9','식사');"><a>식사</a></li>
	            		<li onclick="move('10','드레싱');"><a>드레싱</a></li>
	            		<li onclick="move('11','보충제');"><a>보충제</a></li>
	            		<li onclick="move('12','건강식');"><a>건강식</a></li>
	            	</ul>
            </li>
            <li class="sub-menu">
            	<a href="#" style="font-size: 16px;">영양소별</a>
            	<ul>
            		<li onclick="move('1','단백질');"><a>단백질</a></li>
            		<li onclick="move('2','탄수화물');"><a>탄수화물</a></li>
            		<li onclick="move('3','지방');"><a>지방</a></li>
            		<li onclick="move('4','무기질');"><a>무기질</a></li>
            		<li onclick="move('5','식이섬유');"><a>식이섬유</a></li>
            	</ul>
            </li>
            <li class="sub-menu">
            	<a href="javascript:location.href='<%=cp%>/hotShop/shopReviews';" style="font-size: 16px;">상품 전체 후기</a>
            </li>
          </ul>
      </nav>
   </div>