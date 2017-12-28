<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
body {
	font-family: Verdana, sans-serif;
	font-size: 14px;
}

.btn-article {
	display: inline-block;
	font-weight: normal;
	text-align: center;
	width: 50px;
	height: 30px;
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
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 1px #999999;
	box-shadow: 2px 2px 10px silver;
	min-width: 300px;
	min-height: 30px;
	padding: 10px;
}
</style>

<script type="text/javascript"> //스크립트에서 로케이션 리턴
function deleteNotice(noticeCode) {
	if(confirm("공지를 삭제하시겠습니까?")){
		location.href="<%=cp%>/notice/delete?noticeCode=${dto.noticeCode}&page=${page}";
		return;
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
		var fi = "${dto.saveFile}";
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
	var next ="${nextReadDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/notice/article?noticeCode=${nextReadDto.noticeCode}&page=${page}";
}

function viewPre() {
	var pre ="${preReadDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/notice/article?noticeCode=${preReadDto.noticeCode}&page=${page}";
}
	
</script>
</head>
<body style="height: 2800px">

	<div
		style="height: 50px; font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">공지사항</div>

	<table
		style="width: 700px; margin: 20px auto 0; border-top: 2px solid #333333; border-bottom: 2px solid #333333; border-collapse: collapse; border-spacing: 0">
		<tr height="50" style="border-bottom: 1px solid #cccccc">
			<td
				style="width: 40px; padding-left: 10px; font-weight: bold; color: #666666;">제목</td>
			<td align="left">${dto.subject}</td>
			<td
				style="width: 40px; margin-left: 10px; font-weight: bold; color: #666666;">날짜</td>
			<td style="width: 160px;">${dto.created}</td>
		</tr>
		<tr height="30"
			style="font-size: 13px; color: gray; padding: 5px 15px;">
			<td colspan="3"></td>
			<td align="right"></td>
		</tr>
		<tr height="400" style="border-bottom: 1px solid #cccccc;">
			<td colspan="4" valign="top"
				style="padding-left: 10px; word-break: break-all;">${dto.content}<br>
			<br></td>
		</tr>
	</table>


	<div style="width: 700px; margin: 20px auto 0;">
		<input type="button" class="btn-article" value="목록"
			onclick="javascript:location.href='<%=cp%>/notice/list?${query}';">
<%-- 	<c:if test="${sessionScope.member.userId == 'admin'}">
		<input type="button" class="btn-article" value="수정"
			onclick="javascript:location.href='<%=cp%>/notice/update?noticeCode=${dto.noticeCode}&${query}';">
		<input type="button" class="btn-article" value="삭제"
			onclick="deleteNotice(${dto.noticeCode});">
	</c:if> --%>
	</div>


	<br>
	<br>
<div>
	<table
		style="width: 700px; margin: 20px auto 0; border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc; border-collapse: collapse; border-spacing: 0">

		<tr height="40"
			style="border-bottom: 1px solid #e3e3e3; font-size: 13px;">
			<td width="150" align="center">이전글 ∧</td>
			<td colspan="3" align="left" onclick="viewPre();"
				style="cursor: pointer;">${preReadDto.subject}</td>
		</tr>


		<tr height="40" style="font-size: 13px;">
			<td width="150" align="center">다음글 ∨</td>
			<td colspan="3" align="left" onclick="viewNext();"
				style="cursor: pointer;">${nextReadDto.subject}</td>
		</tr>
	</table>
</div>
	<div class="popupLayer" style="display: none; z-index: 9000;">
		<div>
			<div id="fileinfo">
				<img src="<%=cp%>/resource/images/disk.gif">${dto.originalFile}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| <a
					href="<%=cp%>/notice/download?noticeCode=${dto.noticeCode}"
					style="text-decoration: none; color: #666666;"> PC저장하기</a> <span
					onClick="closeLayer()"
					style="cursor: pointer; color: #cccccc; float: right;">X</span>
			</div>
		</div>
	</div>


</body>
</html>
