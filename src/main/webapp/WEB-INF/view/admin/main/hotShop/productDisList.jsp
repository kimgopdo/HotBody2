<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="dto" items="${productDisList}">
	<tr class="productIn" height="70px" style="border-bottom: 2px solid #e7e7e7">
		<td><img width='50' height='80' onError='<%=cp%>/uploads/shopProduct/error.png' src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}"></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">${dto.pdname}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><fmt:formatNumber value="${dto.pdrawprice}" pattern="#,###" />원</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">${dto.pdDisNum}</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><fmt:formatNumber value="${dto.pdDisNum*dto.pdrawprice}" pattern="#,###" />원</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">${dto.pdDisDate}</td>
		<td>${dto.supplyname}</td>
	</tr>
</c:forEach>