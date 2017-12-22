<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.paymentPage{
	top: 100px;
	font-size: 14px;
	font-family: inherit;
	margin-bottom: 200px;
}
.paymentPage button{
	border: 1px solid #000000;
	background: #ffffff;
	font-size: 14px;
	font-weight:bolder;
}
.paymentPage tr{
	height: 80px;
}
.paymentPage input[type=text]{
	margin-left: 5px;
	margin-right: 5px;
	padding: 2px;
	border-radius: 2px;
	border: 1px solid #e7e7e7;
	outline: none;
}
.paymentPage select{
	padding: 3px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<table id="payBoard" class="paymentPage" style="width:100%; margin-top:150px; border-collapse: collapse;">
	<tr>                                                                        
		<td colspan="4"><img src="<%=cp%>/uploads/shopList/paySeccess.PNG"></td>
	</tr>
	<tr style=" text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;border-bottom: 2px solid #e7e7e7">
		<td colspan="4">주문상품</td>
	</tr>
	<c:forEach var="dto" items="${list}">
	<tr id="colorSelect${dto.rownum}" style="border-bottom: 1px solid #e9e9e9;">
		<td><img width="70px" height="70px" src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}"></td>
		<td>${dto.pdname}</td>
		<td><fmt:formatNumber pattern="#,###">${dto.pdPrice*dto.amount_one}</fmt:formatNumber>원</td>
		<td>${dto.amount_one}</td>
	</tr>
	</c:forEach>
	<tr>
		<td></td>
	</tr>
</table>
<script>
$("#payBoard").ready(function(){ 
	var listLength=${fn:length(list)};
	for(var n=1; n<=listLength; n++){
		if(n%2==0)
		$("#colorSelect"+n).css("background-color","#f9f9f9");		
	}
})
</script>