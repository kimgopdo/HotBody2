<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>
$(document).ready(function(){
    $(".board:even").css("background-color","#EDEDEF");
});
</script>

<%-- <script type="text/javascript">
function send(f){
	
	var f = $("form[name=searchList2]").serialize();
	var url="<%=cp%>/myclass/diary/ing";
		
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			
		}
	    ,error:function(e) {
	    	alert("수정실패");
	    	console.log(e.responseText);
	    }
	});
}
</script> --%>
<style type="text/css">
th {
    text-align: center;
}
.btn-list {
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    width : 100px;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    white-space: nowrap;
    font-size: 12px;
    user-select: none;
    border-width: 1px;
    border-style: solid;
    background-color: #999999;
    border-color: #cccccc;
    border-image: initial;
    padding: 6px 9px;
    border-radius: 2px;
    color: #ffffff;
}
.btn-search {
    display: inline-block;
    font-weight: normal;
    text-align: center;
    width : 50px;
    height : 30px;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    white-space: nowrap;
    font-size: 12px;
    user-select: none;
    border-width: 1px;
    border-style: solid;
    background-color: #ffffff;
    border-color: #cccccc;
    border-image: initial;
    padding: 10px auto;
    color: black;
}
</style>

<div class="body-container" style="width: 650px;">

<div class="body-title">
    <h3>
        <span style="font-family: Webdings; font-weight: bold;">2재료리스트</span>
        <span style="font-weight: bold; font-size: 20px; color: tomato;">총${dataCount}개(${pageNo}/${total_page}페이지)</span>
   </h3> 
</div>


<table style="width: 650px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="10px;"></tr>
	<tr>
		<td colspan="7">
		<form name="mySearchList2" method="post">
			<select name="searchKey" style="width: 65px; height: 30px;">
				<option value="ingredientsName">재료명</option>
				<option value="nutrient">영양소</option>
			</select>	
			<input type="text" name="searchValue" style="width: 15%; height: 30px;">
			<input type="text" style="display:none;">
			<input type="hidden" name="pageNo" value="1">
			<button type="button" onclick="mySearchIng('search');" class="btn-search" style="width: 60px;">검색</button>
			<button type="button" class="btn-list" onclick="mySearchIng('reload')" style="float: right; width: 80px; margin-right: 5px;">새로고침</button>
		</form>
		</td>
	</tr>

	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<th width="15">선택</th>
		<th width="20">번호</th>
		<th width="60">이미지</th>
		<th width="60">재료명</th>
		<th width="60">영양소정보</th>
		<th width="50" >최소단위</th><!-- 재료최소단위랑,단위합침-->
		<th width="50" >열량</th>

	</tr>
	
	<c:forEach var="dto" items="${list}">
	<tr height="100" align="center" class="board">
		<td width="15"><input name="ingChk" type="checkbox" value="${dto.ingredientsName}" data-num="${dto.ingrerdientsNum}" data-unit="${dto.unit}"></td>
		<td width="20">${dto.listNum}</td>
		<td width="60"><img src="<%=cp%>/uploads/myClass/${dto.image}" style="height: 65px; width: 65px;"></td>
		<td width="60">${dto.ingredientsName}</td>
		<td width="60">${dto.nutrient}</td>
		<td width="50">${dto.ingredientsUnit}&nbsp;&nbsp;${dto.unit}</td>
		<td width="50">${dto.calory} Kcal</td>
	</tr>
	</c:forEach>
	<tr height="60" align="center">
		<td colspan="7">${paging}</td>
	</tr>

</table>
</div>


