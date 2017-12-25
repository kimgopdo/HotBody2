<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<tr style="height: 50px; background: #F8F2ED">
			<td>no</td>
			<td>이미지</td>
			<td>상품정보</td>
			<td>판매가</td>
			<td>수량</td>
			<td>적립포인트</td>
			<td>가격</td>
			<td>별점</td>
			</tr>
			<c:forEach var="dto" items="${list2}">
			<tr style="height:150px;">
			<td width="2%">
				<input type="hidden" name="pdnum" value="${dto.pdnum}">
				<input type="hidden" id="pdPrice${dto.listNum}" name="pdPrice" value="${dto.pdPrice}">
				<input type="hidden" id="milelage${dto.listNum}" value="${dto.milelage}">
				<input type="hidden" value="${dto.listNum}">
				${dto.listNum}
			</td>
			<td width="15%">
				<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
			</td>
			<td width="38%">
				${dto.pdName}<br><br>${dto.pdSumContent}
			</td>
			<td width="10%">
				<fmt:formatNumber pattern="#,###">
				${dto.pdPrice}
				</fmt:formatNumber>원
			</td>
			<td width="5%">
				<input type="number" name="amount" value="${dto.pCnt}" id="no1${dto.listNum}" min="0" style="width: 35px;" onkeypress="onlyNumber();" onclick="add(${dto.listNum}); totalMoney();">
			</td>
			<td width="5%">
				${dto.milelage}
			</td>
			<td width="10%">
				<span id="cost${dto.listNum}"></span>원
			</td>
			<td>****</td>
			</tr>
			</c:forEach>