<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="dto" items="${productInList}">
	<tr class="productIn" height="70px" style="border-bottom: 2px solid #e7e7e7">
		<td><img width='50' height='80' onError='<%=cp%>/uploads/shopProduct/error.png' src="<%=cp%>/uploads/shopProduct/${dto.imgSaveFilename}"></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">상품명: ${dto.pdName}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">원가: ${dto.pdrawprice}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">수량: ${dto.pdinnum}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">총액: ${dto.pdinnum*dto.pdrawprice}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">유통기한: ${dto.pdexdate}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">입고날짜: ${dto.pdindate}</td>
		<td>${dto.supplyname}</td>
	</tr>
</c:forEach>