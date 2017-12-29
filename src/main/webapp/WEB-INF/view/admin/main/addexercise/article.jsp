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
function deleteExercise(num) {
	if(confirm("운동를 삭제하시겠습니까?")){
		location.href="<%=cp%>/myclass/addexercise/delete?num="+num+"&page=${page}";
	}
}

function viewNext() {
	var next ="${nextReadDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/myclass/addexercise/article?num=${nextReadDto.exerciseNum}&page=${page}";
	
}

function viewPre() {
	var pre ="${preReadDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/myclass/addexercise/article?num=${preReadDto.exerciseNum}&page=${page}";
}

function closeLayer() {
	$('.popupLayer').hide();
}

$(function(){
	
	var b = "false";
	/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	$("#filedown").click(function(e)
	{
		var fi = "${dto.video}";
		if(fi=="")
			return;
		
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $("#fileinfo").width();
		var oHeight = $("#fileinfo").height();
		
		var divEl = $("#filedown");
        
		var divX = divEl.offset().left;	// 상대적인 좌표위치 확인함수, position(), 절대좌표 확인 및 이동함수 : offset()
		var divY = divEl.offset().top;

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft =  divX+120;
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

</script>

<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 40px;">
    <div style="font-size: 40px; width: 1000px;font-weight: bold; color: #666666;">운동 상세</div>

<table style="width: 1000px; margin: 20px auto 0; border-top: 2px solid #333333; border-bottom: 2px solid #333333; border-collapse: collapse; border-spacing: 0">

<tr height="50" style="border-bottom: 1px solid #cccccc">
	<td style="width:100px; padding-left: 10px; font-weight: bold; color: #666666;">운동명</td>
	<td style="width:200px;">${dto.exerciseName}</td>
	<td style="width:100px; margin-left: 10px; font-weight: bold; color: #666666;">운동부위</td>
	<td>${dto.typeName} 운동</td>
</tr>

<tr height="50" style="border-bottom: 1px solid #cccccc">
	<td style="width:100px; padding-left: 10px; font-weight: bold; color: #666666;">운동단위</td>
	<td style="width:200px;">${dto.unitTime}&nbsp;&nbsp;${dto.unit}</td>
	<td style="width:100px; margin-left: 10px; font-weight: bold; color: #666666;">소모칼로리</td>
	<td>${dto.lossCal} Kcal</td>
</tr>
<tr height="30" style="font-size: 13px; color: gray; padding: 5px 15px;">
	<td colspan="3"></td>
	<td align="right">
	<p id="filedown" style="text-decoration: none; color: #666666; cursor: pointer;"> 
	첨부파일 <span style="color: tomato; font: bold;">(${dto.video != null ? '1' : '0'})</span>
	</p>
	</td>
</tr>
<tr height="400" style="border-bottom: 1px solid #cccccc;">
	<td colspan="4" valign="top" style="padding-left: 10px; word-break:break-all;">${dto.pic}<br><br></td>
</tr>
</table>

<div style="width:1000px; margin: 20px auto 0;">
<input type="button" class="btn-article" value="목록" onclick="javascript:location.href='<%=cp%>/myclass/addexercise/list?${query}';">
<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/myclass/addexercise/update?num=${dto.exerciseNum}&${query}';">
<input type="button" class="btn-article" value="삭제" onclick="deleteExercise(${dto.exerciseNum});">
<input type="button" class="btn-article" value="다음▶ " onclick="viewNext();" style="float: right; margin-left: 5px;">
<input type="button" class="btn-article" value="◀이전" onclick="viewPre();" style="float: right;">
</div>

<div class="popupLayer" style="display: none; z-index: 9000;">
	<div>
		<div id="fileinfo">
		<img src="<%=cp%>/resource/images/disk.gif">${dto.video} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
		<a href="<%=cp%>/myclass/addexercise/download?num=${dto.exerciseNum}" style="text-decoration: none; color: #666666;"> PC저장하기</a>
			<span onClick="closeLayer()" style="cursor:pointer; color: #cccccc; float: right;">X</span>
		</div>
	</div>
</div>
</div>


