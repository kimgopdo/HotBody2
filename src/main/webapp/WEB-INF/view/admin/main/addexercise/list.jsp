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

<script type="text/javascript">
function send(f){
	f.submit();
}
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

<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 40px;">
    <div style="font-size: 40px; width: 1000px;font-weight: bold; color: #666666;">운동리스트</div>
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
		
		<tr height="40">
			<td align="left" style="font-weight: bold; font-size: 16px; color: tomato;">
				총 ${dataCount}개
			</td>
		</tr>

	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<th width="20">번호</th>
		<th width="65">운동명</th>
		<th width="50">운동부위</th>
		<th width="60" >최소단위</th><!-- 최소단위랑,단위합침-->
		<th width="60" >소모칼로리</th>

	</tr>
	
	<c:forEach var="dto" items="${list}">
	<tr height="50" align="center" class="board">
		<td width="20">${dto.listNum}</td>
		<td width="60"><a href="${articleUrl}&num=${dto.exerciseNum}">${dto.exerciseName}</a></td>
		<td width="50">${dto.typeName} 운동</td>
		<td width="60">${dto.unitTime}&nbsp;&nbsp;${dto.unit}</td>
		<td width="60">${dto.lossCal} Kcal</td>
	</tr>
	</c:forEach>
	<tr height="60" align="center">
		<td colspan="7">${paging}</td>
	</tr>
	
	<tr>
		<td colspan="7">
		<form name="searchList" method="post" action="<%=cp%>/myclass/addexercise/list">
			<select name="searchKey" style="width: 80px; height: 30px;">
				<option value=exerciseName>운동명</option>
				<option value="typeName">운동부위</option>
			</select>	
			<input type="text" name="searchValue" style="width: 15%; height: 30px;">
			<input type="text" style="display:none;">
			
			<button type="button" onclick="send(this.form);" class="btn-search" style="width: 60px;">검색</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/myclass/addexercise/created'" style="float: right; width: 80px; margin-right: 5px;">글올리기</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/myclass/addexercise/list';" style="float: right; width: 80px; margin-right: 5px;">새로고침</button>
		</form>
		</td>
	</tr>
</table>
</div>


