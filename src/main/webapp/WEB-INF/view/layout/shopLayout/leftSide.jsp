<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
      <!-- 왼쪽 사이드 바 -->
   <div id="leftSide" class="vertical-align" style="width: 10%; height: 100%; top:0px; left: 0px; position: fixed;z-index: 10;">
         <a href="javascript:location.href='<%=cp%>/hotShop/created';">created페이지</a>
         <a href="javascript:location.href='<%=cp%>/hotShop/productInlist';">입고리스트 페이지</a>
         <div id="basketBtn">
	         <button type="button" class="btn btn-default btn-lg basketBtn" style="background: white; border: none; outline: none;">
	            <span class="glyphicon glyphicon-shopping-cart"></span>
	         </button>
         </div>
	</div>