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
        <span style="font-family: Webdings; font-weight: bold;">2운동리스트</span>
        <span style="font-weight: bold; font-size: 20px; color: tomato;">총${dataCount}개(${pageNo}/${total_page}페이지)</span>
        </h3>
</div>
<table style="width: 650px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="10px;"></tr>
	<tr>
		<td colspan="7">
		<form name="mySearchList" method="post">
			<select name="searchKey" style="width: 80px; height: 30px;">
				<option value=exerciseName>운동명</option>
				<option value="typeName">운동부위</option>
			</select>	
			<input type="text" name="searchValue" style="width: 15%; height: 30px;">
			<input type="text" style="display:none;">
			<input type="hidden" name="pageNo" value="1">
			<button type="button" onclick="mySearchExercise('search');" class="btn-search" style="width: 60px;">검색</button>
			<button type="button" class="btn-list" onclick="mySearchExercise('reload')" style="float: right; width: 80px; margin-right: 5px;">새로고침</button>
		</form>
		</td>
	</tr>

	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<th width="15">선택</th>
		<th width="15">번호</th>
		<th width="60">운동명</th>
		<th width="45">운동부위</th>
		<th width="50" >최소단위</th><!-- 최소단위랑,단위합침-->
		<th width="50" >소모칼로리</th>

	</tr>
	
	<c:forEach var="dto" items="${list}">
	<tr height="40" align="center" class="board">
		<td width="15"><input name="exerChk" type="checkbox" value="${dto.exerciseNum}" data-name="${dto.exerciseName}"></td>
		<td width="15">${dto.listNum}</td>
		<td width="60">${dto.exerciseName} ${dto.exerciseNum}</td>
		<td width="45">${dto.typeName} 운동</td>
		<td width="50">${dto.unitTime}&nbsp;&nbsp;${dto.unit}</td>
		<td width="50">${dto.lossCal} Kcal</td>
	</tr>
	</c:forEach>
	<tr height="60" align="center">
		<td colspan="7">${paging}</td>
	</tr>
</table>
</div>