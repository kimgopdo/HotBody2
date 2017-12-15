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
function deleteInfo(num) {
	if(confirm("정보를 삭제하시겠습니까?")){
		location.href="<%=cp%>/myclass/addinfo/delete?num="+num+"&page=${page}";
	}
}

function viewNext() {
	var next ="${nextReadDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/myclass/addinfo/article?num=${nextReadDto.infoNum}&page=${page}";
	
}

function viewPre() {
	var pre ="${preReadDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/myclass/addinfo/article?num=${preReadDto.infoNum}&page=${page}";
}
</script>

<div class="body-container" style="width: 800px; margin: 80px auto;">

<div class="body-title">
        <h3><span style="font-family: Webdings">2</span>유용한정보 상세</h3>
</div>

<table style="width: 800px; margin: 20px auto 0; border-top: 2px solid #333333; border-bottom: 2px solid #333333; border-collapse: collapse; border-spacing: 0">

<tr height="50" style="border-bottom: 1px solid #cccccc">
	<td style="width:100px; padding-left: 10px; font-weight: bold; color: #666666;">제&nbsp;&nbsp;목 :</td>
	<td align="center">${dto.subject}</td>
</tr>

<tr height="500" style="border-bottom: 1px solid #cccccc;">
	<td colspan="4" valign="top" style="padding-left: 10px; word-break:break-all;">${dto.content}<br><br></td>
</tr>
</table>

<div style="width:800px; margin: 20px auto 0;">
<input type="button" class="btn-article" value="목록" onclick="javascript:location.href='<%=cp%>/myclass/addinfo/list?${query}';">
<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/myclass/addinfo/update?num=${dto.infoNum}&${query}';">
<input type="button" class="btn-article" value="삭제" onclick="deleteInfo(${dto.infoNum});">
<input type="button" class="btn-article" value="다음▶ " onclick="viewNext();" style="float: right; margin-left: 5px;">
<input type="button" class="btn-article" value="◀이전" onclick="viewPre();" style="float: right;">
</div>
</div>


