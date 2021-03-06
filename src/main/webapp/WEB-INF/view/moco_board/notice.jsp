<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
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
function deleteNotice(num) {
	if(confirm("공지를 삭제하시겠습니까?")){
		location.href="<%=cp%>/notice/delete?num="+num;
	}
}

function closeLayer() {
	$('.popupLayer').hide();
}

$(function(){
	
	var b = "false";
	/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	$("#filedown").click(function(e)
	{
		var fi = "${dto.saveFilename}";
		if(fi=="")
			return;
		
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $("#fileinfo").width();
		var oHeight = $("#fileinfo").height();
		
		var divEl = $("#filedown");
        
		var divX = divEl.offset().left;
		var divY = divEl.offset().top;

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft =  divX-160;
		var divTop =  divY+25;
		
		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치한다.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;
		
		if(b=="false"){
			$('.popupLayer').css({
				"top": divTop,
				"left": divLeft,
			}).show();
			b="true";
		} else{
			$('.popupLayer').hide();
			b="false";
		}
	});

});

function viewNext() {
	var next ="${nextDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/notice/article?num=${nextDto.num}&page=${page}";
}

function viewPre() {
	var pre ="${preDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/notice/article?num=${preDto.num}&page=${page}";
}

</script>
</head>
<body>

<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">공지사항</div>

<table style="width: 700px; margin: 20px auto 0; border-top: 2px solid #333333; border-bottom: 2px solid #333333; border-collapse: collapse; border-spacing: 0">
<tr height="50" style="border-bottom: 1px solid #cccccc">
	<td style="width:40px; padding-left: 10px; font-weight: bold; color: #666666;">제목</td>
	<td align="left">${dto.subject}</td>
	<td style="width:40px; margin-left: 10px; font-weight: bold; color: #666666;">날짜</td>
	<td style="width: 160px;">${dto.created}</td>
</tr>
<tr height="30" style="font-size: 13px; color: gray; padding: 5px 15px;">
	<td colspan="3"></td>
	<td align="right">
	<p id="filedown" style="text-decoration: none; color: #666666; cursor: pointer;"> 
	첨부파일 <span style="color: tomato; font: bold;">(개수)</span>
	</p>
	</td>
</tr>
<tr height="400" style="border-bottom: 1px solid #cccccc;">
	<td colspan="4" valign="top" style="padding-left: 10px; word-break:break-all;">${dto.content}<br><br></td>
</tr>
</table>


<div style="width:700px; margin: 20px auto 0;">
<input type="button" class="btn-article" value="목록" onclick="javascript:location.href='<%=cp%>/notice/list?${query}';">
<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/notice/update?num=${dto.num}&${query}';">
<input type="button" class="btn-article" value="삭제" onclick="deleteNotice(${dto.num});">
</div>

<br><br>
<table style="width: 700px; margin: 20px auto 0; border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc; border-collapse: collapse; border-spacing: 0">
<tr height="40" style="border-bottom: 1px solid #e3e3e3; font-size: 13px;">
	<td width="150" align="center" >이전글 ∧</td>
	<td colspan="3" align="left" onclick="viewPre();" style="cursor: pointer;">${preDto.subject}</td>
</tr>


<tr height="40" style="font-size: 13px;">

	<td width="150" align="center">다음글 ∨</td>
	<td colspan="3" align="left" onclick="viewNext();" style="cursor: pointer;">${nextDto.subject}</td>
</tr>
</table>

<div class="popupLayer" style="display: none; z-index: 9000;">
	<div>
		<div id="fileinfo">
		<img src="<%=cp%>/resource/images/disk.gif">${dto.originalFilename} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
		<a href="<%=cp%>/notice/download?num=${dto.num}" style="text-decoration: none; color: #666666;"> PC저장하기</a>
			<span onClick="closeLayer()" style="cursor:pointer; color: #cccccc; float: right;">X</span>
		</div>
	</div>
</div>
</body>
</html>
