<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.aspect { width: 300px; height: 350px; }
</style>
<table style="margin-top: 100px; margin-left:auto; margin-right:auto; width:100%; border-collapse: collapse;">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td style="width:100%; height:100%; padding-left: 7%; padding-right: 3%;">
			<ul id="#" class="list">
			<c:forEach begin="0" end="10">
			      <li class="list">
			         <div class="aspect">
			            <img src="<%=cp%>/resource/images/road.jpg">
			         </div>
			         <div align="left">
			         <span style=" text-align: left;">상품명</span> <img src=""><br>
			         <span style=" text-align: left;">상품명</span>
			         </div>
			      </li>
			</c:forEach>
			</ul>
		</td>
	</tr>
</table>