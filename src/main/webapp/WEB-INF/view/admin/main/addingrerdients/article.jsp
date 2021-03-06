<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
body{
	font-family: Verdana, sans-serif;
	font-size: 14px;
}
.btn-article {
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

.popupLayer {
	position:absolute;
	display: none;
	background-color: #ffffff;
	border: solid 1px #999999;
	box-shadow: 2px 2px 10px silver;
	min-width: 300px;
	min-height: 30px;
	padding: 10px;
}

</style>
<script type="text/javascript">
function deleteIng(num) {
	if(confirm("재료를 삭제하시겠습니까?")){
		location.href="<%=cp%>/myclass/addingrerdients/delete?num="+num+"&page=${page}";
	}
}

function viewNext() {
	var next ="${nextReadDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/myclass/addingrerdients/article?num=${nextReadDto.ingrerdientsNum}&page=${page}";
	
}

function viewPre() {
	var pre ="${preReadDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/myclass/addingrerdients/article?num=${preReadDto.ingrerdientsNum}&page=${page}";
}

</script>

<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 40px;">
    <div style="font-size: 40px; width: 1000px;font-weight: bold; color: #666666;">재료상세</div>

<table style="width: 1000px; margin: 20px auto 0; border-top: 2px solid #333333; border-bottom: 2px solid #333333; border-collapse: collapse; border-spacing: 0">

<tr height="50" style="border-bottom: 1px solid #cccccc">
	<td style="width:100px; padding-left: 10px; font-weight: bold; color: #666666;">재료명</td>
	<td style="width:200px;">${dto.ingredientsName}</td>
	<td style="width:100px; margin-left: 10px; font-weight: bold; color: #666666;">영양소</td>
	<td>${dto.nutrient}</td>
</tr>

<tr height="50" style="border-bottom: 1px solid #cccccc">
	<td style="width:100px; padding-left: 10px; font-weight: bold; color: #666666;">재료단위</td>
	<td style="width:200px;">${dto.ingredientsUnit}&nbsp;&nbsp;${dto.unit}</td>
	<td style="width:100px; margin-left: 10px; font-weight: bold; color: #666666;">칼로리</td>
	<td>${dto.calory} Kcal</td>
</tr>

<tr height="400" style="border-bottom: 1px solid #cccccc;">
	<td colspan="4" valign="top" style="padding-left: 10px; word-break:break-all;">${dto.content}<br><br></td>
</tr>
</table>

<div style="width:1000px; margin: 20px auto 0;">
<input type="button" class="btn-article" value="목록" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/list?${query}';">
<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/update?num=${dto.ingrerdientsNum}&${query}';">
<input type="button" class="btn-article" value="삭제" onclick="deleteIng(${dto.ingrerdientsNum});">
<input type="button" class="btn-article" value="다음▶ " onclick="viewNext();" style="float: right; margin-left: 5px;">
<input type="button" class="btn-article" value="◀이전" onclick="viewPre();" style="float: right;">
</div>
</div>


