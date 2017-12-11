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

<div class="body-container" style="width: 800px; margin: 100px auto;">

<div class="body-title">
        <h3><span style="font-family: Webdings">2</span>재료리스트</h3>
</div>


<table style="width: 800px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">

	<tr height="40">
		<td align="left" colspan="7">
			${dataCount}개(${page}/${total_page}페이지)
		</td>
	</tr>

	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<th width="40">번호</th>
		<th width="80">이미지</th>
		<th width="80">재료명</th>
		<th width="65">영양소정보</th>
		<th width="65" >최소단위</th><!-- 재료최소단위랑,단위합침-->
		<th width="65" >열량</th>

	</tr>
	
	<c:forEach var="dto" items="${list}">
	<tr height="100" align="left" class="board">
		<td width="40">${dto.listNum}</td>
		<td width="80"><a href="${articleUrl}&num=${dto.ingrerdientsNum}"><img src="<%=cp%>/uploads/myClass/${dto.image}" style="height: 80px; width: 80px;" ></a></td>
		<td width="80">${dto.ingredientsName}</td>
		<td width="65">${dto.nutrient}</td>
		<td width="65">${dto.ingredientsUnit}&nbsp;&nbsp;${dto.unit}</td>
		<td width="65">${dto.calory} Kcal</td>
	</tr>
	</c:forEach>
	<tr height="60" align="center">
		<td colspan="7">${paging}</td>
	</tr>
	
	<tr>
		<td colspan="7">
		<form name="searchList" method="post" action="<%=cp%>/myclass/addingrerdients/list">
			<select name="searchKey" style="width: 65px; height: 30px;">
				<option value="ingredientsName">재료명</option>
				<option value="nutrient">영양소</option>
			</select>	
			<input type="text" name="searchValue" style="width: 15%; height: 30px;">
			<input type="text" style="display:none;">
			
			<button type="button" onclick="send(this.form);" class="btn-search" style="width: 60px;">검색</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/created'" style="float: right; width: 80px;">글올리기</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/list';" style="float: right; width: 80px; margin-right: 10px;">새로고침</button>
		</form>
		</td>
	</tr>
</table>
</div>


