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
<c:forEach var="dto" items="${list}">
		    <li class="list">
		         <div class="aspect">
		         	<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
		         </div>
		         <div align="left">
		            <span style=" text-align: left;">상품명: <a href="javascript:location.href='<%=cp%>/hotShop/shopArticle?pdnum=${dto.pdnum}';">${dto.pdName}</a></span><br>
		            <span style=" text-align: left;">가격 : <fmt:formatNumber pattern="#,###">${dto.pdPrice}</fmt:formatNumber>원</span>
		            <!-- if로 막아야함 -->
		            <c:if test="${sessionScope.member.userId=='admin'}">
		            <a href="javascript:location.href='<%=cp%>/hotShop/created?pdnum=${dto.pdnum}&mode=update';" style="color:black; font-weight:bold; float: right;">수정</a>
		            </c:if>
		            <c:if test="${sessionScope.member.userId=='admin' && dto.showandhide==1}">
		            <a href="javascript:location.href='<%=cp%>/hotShop/hide?pdnum=${dto.pdnum}'">상태: 보임(클릭 시 숨김)</a>
		         	</c:if>
		         	<c:if test="${sessionScope.member.userId=='admin' && dto.showandhide==0}">
		            <a href="javascript:location.href='<%=cp%>/hotShop/show?pdnum=${dto.pdnum}'">상태: 숨김(클릭 시 보임)</a>
		         	</c:if>
		         </div>
		    </li>
</c:forEach>