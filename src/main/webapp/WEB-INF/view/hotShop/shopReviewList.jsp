<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border-bottom: 2px solid #e7e7e7;
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
<script>
$(function(){
	listPage(1);
})
function selectList(f){
	f.action="<%=cp%>/hotShop/shopReviews";
	f.submit();
}
function listPage(page){
	var url = "<%=cp%>/hotShop/shopReviews";
	var num = "${dto.pdnum}";
	var q = "page=" + page;

	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listQna").html(a);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
				alert("실패");
				return;
			}
			console.log(e.responseText);
		}
	});
}

</script>
<table style="width: 100%; margin-top: 100px; border-collapse: collapse;">
	<tr style="border-bottom: 2px solid #e7e7e7;">
		<td width="100%" colspan="6"><h5 style="font-size: 20px; font-weight:bold; margin-left: 30px; margin-bottom:30px; text-align: left;">상품전체리스트</h5></td>
	</tr>
	<tr style="height: 50px; background: #F8F2ED">
		<td>이미지</td>
		<td>상품정보</td>
		<td>가격</td>
		<td>적립포인트</td>                                                          
		<td>별점</td>
	</tr>

	<c:forEach var="dto" items="${list}">                                   
			<input type="hidden" name="pdnum" value="${dto.pdnum}">
			<input type="hidden" id="pdPrice${dto.listNum}" name="pdPrice" value="${dto.pdPrice}">
			<input type="hidden" id="milelage${dto.listNum}" value="${dto.milelage}">
			<input type="hidden" value="${dto.listNum}">
	<tr style="height:150px;">
		<td width="15%">
			<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
		</td>
		<td width="38%">
			<a href="javascript:location.href='<%=cp%>/hotShop/shopArticle?pdnum=${dto.pdnum}';">${dto.pdName}</a><br><br>${dto.pdSumContent}
		</td>
		<td width="10%">
			<fmt:formatNumber pattern="#,###">
			${dto.pdPrice}
			</fmt:formatNumber>원
		</td>
		<td width="5%">
			${dto.milelage}
		</td>
		<td>
		<c:if test="${dto.starScore==0 || dto.starScore==1}">
			<img src="<%=cp%>/uploads/shopStar/star_1.PNG">
		</c:if>
		<c:if test="${dto.starScore==2}">
			<img src="<%=cp%>/uploads/shopStar/star_2.PNG">
		</c:if>
		<c:if test="${dto.starScore==3}">
			<img src="<%=cp%>/uploads/shopStar/star_3.PNG">
		</c:if>
		<c:if test="${dto.starScore==4}">
			<img src="<%=cp%>/uploads/shopStar/star_4.PNG">
		</c:if>
		<c:if test="${dto.starScore==5}">
			<img src="<%=cp%>/uploads/shopStar/star_5.PNG">
		</c:if>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="6" height="50px;">${paging}</td>
	</tr>
	<tr>
		<td colspan="6"> 
		<form method="post">
		<select name="searchKey" style="padding: 4px;">
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text"  name="searchValue" > <button type="button"onclick="selectList(this.form);">검색</button>
		</form>
		</td>
	</tr>
</table>