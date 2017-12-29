<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
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
		            <a href="javascript:location.href='<%=cp%>/hotShop/created?pdnum=${dto.pdnum}&mode=update';" style="color:black; font-weight:bold; float: right; margin-right: 50px;">수정</a>                               
		            </c:if>
		            <c:if test="${sessionScope.member.userId=='admin' && dto.showandhide==1}">
		            <a href="javascript:location.href='<%=cp%>/admin/hotShop/hide?pdnum=${dto.pdnum}'">상태: 보임(클릭 시 숨김)</a>
		         	</c:if>
		         	<c:if test="${sessionScope.member.userId=='admin' && dto.showandhide==0}">
		            <a href="javascript:location.href='<%=cp%>/admin/hotShop/show?pdnum=${dto.pdnum}'">상태: 숨김(클릭 시 보임)</a>
		         	</c:if>
		         </div>
		    </li>
</c:forEach>
<script>
$(function(){
	var divs = document.querySelectorAll('.aspect');
	  for (var i = 0; i < divs.length; ++i) {
	    var div = divs[i];
	    var divAspect = div.offsetHeight / div.offsetWidth;
	    div.style.overflow = 'hidden';
	    
	    var img = div.querySelector('img');
	    var imgAspect = img.height / img.width;
	
	    if (imgAspect <= divAspect) {
	
	      var imgWidthActual = div.offsetHeight / imgAspect;
	      var imgWidthToBe = div.offsetHeight / divAspect;
	      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
	      img.style.cssText = 'width: auto; height: 100%; margin-left: '
	                      + marginLeft + 'px;'
	    } else {
	      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
	    }
	    console.log("ddd");
	  }
})
</script>