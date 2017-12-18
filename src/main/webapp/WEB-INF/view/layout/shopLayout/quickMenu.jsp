
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<!-- 퀵메뉴 -->
<!-- 내비 -->
   <div id="quickMenu" align="center" class="pull-right" style="width:100%; height:1500px; background-color: #fff; position: fixed;display: none;">
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
            	<a href="move('newProduct');">신상품</a>
            </li>
            <li class="sub-menu">
            	<a href="#">상품유형별</a>
	            	<ul id="productLike">
	            	</ul>
            </li>
            <li class="sub-menu">
            	<a href="#">영양소별</a>
            	<ul id="productNutrient">
            	</ul>
            </li>
            <li>
            	<a href="javascript:location.href='<%=cp%>/hotShop/shopReviews';">상품 전체 후기</a>
            </li>
          </ul>
      </nav>
     </div>