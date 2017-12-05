<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<table style="margin-top: 100px;">
<tr>
	<td style="text-align: left;">
		<input type="radio" name="formal" value="hitCount">조회순 &nbsp;&nbsp;
		<input type="radio" name="formal" value="star">별점순 &nbsp;&nbsp;
		<input type="radio" name="formal" value="created">등록순 &nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td>
		<ul id="#" class="list" >
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