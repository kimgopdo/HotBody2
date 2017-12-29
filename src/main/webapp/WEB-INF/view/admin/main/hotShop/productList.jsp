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
$(function(){
	window.onscroll = function(ev) {
	    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	if(page<totalPage) {
	    		++page;
	    		productList(page);
	    	}
	    }
	};
})
function productList(page){
	var url="<%=cp%>/admin/hotShop/productListAjax";
	var data=$("#hiddenForm").serialize()+"&page="+page+"&formal="+$(':radio[name="formal"]:checked').val();
	$.ajax({
		type:"post"
		,url:url
		,data:data
		,success:function(data){
			$("#productList").append(data);
		}
	});
}
</script>
<style>
ul.list{
   width: 100%;
   margin-left: auto;
   margin-right: auto;
   list-style:none;
}
li.list{
   height: 460px;
   padding: 20px;
   float: left;
}

li.aspect{
	padding: 25px;
}
.aspect { width: 350px; height: 400px; }
</style>
<form id="hiddenForm">
<input type="hidden" name="cl" value="${cl}">
<input type="hidden" name="code" value="${code}">
</form>
<table style="margin-top: 10px; width:100%; padding-left:20px; border-collapse: collapse;">
<tr align="center">
	<td> <button type="button" class="btn" style="width: 200px; background: #e7e7e7;" onclick="javascript:location.href='<%=cp%>/admin/hotShop/created'">상품등록</button> </td>
</tr>
<tr>
	<td>
		<ul id="productList" class="list">                                                        
		</ul>
	</td>
</tr>
</table>
<script type="text/javascript" src="<%=cp%>/resource/js/shopJS/imgCut.js"></script>