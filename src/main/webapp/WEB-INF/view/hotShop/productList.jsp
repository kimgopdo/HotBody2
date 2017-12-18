<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
var page=1;
var totalPage=${total_page};
$(function(){
	$("input[name=formal]").click(function(){
		productList(page);
	});
})
$(function(){
	productList(1);
})

function productList(page){
	var url="<%=cp%>/hotShop/productListAjax";
	var data=$("#hiddenForm").serialize()+"&page="+page+"&formal="+$(':radio[name="formal"]:checked').val();
	alert(data);
	$.ajax({
		type:"post"
		,url:url
		,data:data
		,success:function(data){
			$("#productList").html(data);
		}
	});
}
</script>
<form id="hiddenForm">
<input type="hidden" name="cl" value="${cl}">
<input type="hidden" name="code" value="${code}">
</form>
<table style="margin-top: 100px; width:100%; border-collapse: collapse;">
<tr style="border-bottom: 2px solid #e7e7e7;">                                
	<td><h5 style="font-size: 20px; font-weight:bold; margin-left: 30px; margin-bottom:30px; text-align: left;">${state}</h5></td>
</tr>
<tr>
	<td style="text-align: left;">
		<input type="radio" name="formal" value="hitCount">조회순 &nbsp;&nbsp;
		<input type="radio" name="formal" value="star">별점순 &nbsp;&nbsp;
		<input type="radio" name="formal" value="created" checked="checked">등록순 &nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td>
		<ul id="productList" class="list">                                                        
		</ul>
	</td>
</tr>
</table>