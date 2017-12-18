<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.aspect { width: 350px; height: 400px; }
</style>
<table style="margin-top: 100px; width:100%; border-collapse: collapse;">
<tr style="border-bottom: 2px solid #e7e7e7;">                                
	<td><h5 style="font-size: 20px; font-weight:bold; margin-left: 30px; margin-bottom:30px; text-align: left;">${state}</h5></td>
</tr>
<tr>
	<td style="text-align: left;">
		<input type="radio" name="formal" value="hitCount">조회순 &nbsp;&nbsp;
		<input type="radio" name="formal" value="star">별점순 &nbsp;&nbsp;
		<input type="radio" name="formal" value="created">등록순 &nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td>
		<ul id="#" class="list">
		    <c:forEach var="dto" items="${list}">
		    <li class="list">
		         <div class="aspect">
		         	<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
		         </div>
		         <div align="left">
		            <span style=" text-align: left;">상품명: <a href="javascript:location.href='<%=cp%>/hotShop/shopArticle?pdnum=${dto.pdnum}';">${dto.pdName}</a></span><img src=""><br>
		            <span style=" text-align: left;">가격 : ${dto.pdPrice}</span>
		            <!-- if로 막아야함 -->
		            <a href="" style="color:black; font-weight:bold; float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입고</a>
		            <a href="javascript:location.href='<%=cp%>/hotShop/created?pdnum=${dto.pdnum}&mode=update';" style="color:black; font-weight:bold; float: right;">수정</a>
		         </div>
		    </li>
		    </c:forEach>                                                         
		</ul>
	</td>
</tr>
</table>