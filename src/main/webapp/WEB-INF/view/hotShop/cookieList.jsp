<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<tr style="height: 50px; background: #F8F2ED; text-align: center;">
			<td>이미지</td>
			<td>상품정보</td>
			<td>판매가</td>
			<td>포인트</td>
			<td>별점</td>
	</tr>
			<c:forEach var="dto" items="${list2}">
				<input type="hidden" name="pdnum" value="${dto.pdnum}">
				<input type="hidden" id="pdPrice${dto.listNum}" name="pdPrice" value="${dto.pdPrice}">
				<input type="hidden" id="milelage${dto.listNum}" value="${dto.milelage}">
				<input type="hidden" value="${dto.listNum}">
			<tr style="height:150px;">
			<td width="15%">
				<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
			</td>
			<td width="50%">
				${dto.pdName}<br><br>${dto.pdSumContent}
			</td>
			<td width="15%">
				<fmt:formatNumber pattern="#,###">
				${dto.pdPrice}
				</fmt:formatNumber>원
			</td>
			<td width="10%">
				${dto.milelage}
			</td>
			<td>****</td>
			</tr>
			</c:forEach>