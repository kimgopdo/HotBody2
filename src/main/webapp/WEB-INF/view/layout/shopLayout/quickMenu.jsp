
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>

<!-- 퀵메뉴 -->
<div align="center" id="quickMenu" style="width:100%; height:1500px; background-color: #FEF9F6; position: fixed;display: none;">
	<div align="center" style="width: 80%; height: 60px;">
	<ul id="quickMenu_P" class="nav navbar-nav menu" style="margin-left: 200px;">
            <li>
            	<a href="#">베스트</a>
            	<div align="center" class="menuEx" style="display: none;">
            	<ul>
            		<li onclick="">조회수</li>
            		<li onclick="">좋아요</li>
            		<li onclick="">후기별점</li>
            		<li onclick="">판매순</li>
            		<li onclick="">사장추천</li>
            	</ul>
            	</div>
            </li>
            <li>
            	<a href="#">신상품</a>
            </li>
            <li>
            	<a href="#">상품유형별</a>
            	<div align="center" class="menuEx" style="display: none;">
	            	<ul>
	            		<li onclick="">음료</li>
	            		<li onclick="">간식</li>
	            		<li onclick="">식사</li>
	            		<li onclick="">드레싱</li>
	            		<li onclick="">보충제</li>
	            		<li onclick="">건강식</li>
	            	</ul>
            	</div>
            </li>
            <li>
            	<a href="#">영양소별</a>
            	<div class="menuEx" style="display: none">
            	<ul>
            		<li onclick="">단백질</li>
            		<li onclick="">탄수화물</li>
            		<li onclick="">지방</li>
            		<li onclick="">무기질</li>
            		<li onclick="">식이섬유</li>
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
</div>