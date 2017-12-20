<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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

<script type="text/javascript"> //스크립트에서 로케이션 리턴

function viewNext() {
	var next ="${nextReadDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/event/article?eventCode=${nextReadDto.eventCode}&page=${page}";
}

function viewPre() {
	var pre ="${preReadDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/event/article?eventCode=${preReadDto.eventCode}&page=${page}";
}
//댓글
function login() {
	location.href="<%=cp%>/member/login";
}

//댓글리스트
$(function () {
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/event/listReply";
	var eventCode="${dto.eventCode}";
	$.post(url, {eventCode:eventCode, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
}

//댓글 등록
function sendReply() {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		location.href="<%=cp%>/member/login";
		return;
	}
	
	var eventCode="${dto.eventCode}";
	var content=$("#replyContent").val().trim();
	if(! content) {
		$("#replyContent").focus();
		return;	
	}
	
	var query="eventCode="+eventCode;
	query+="&content="+encodeURIComponent(content);
	query+="&answer=0";

	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/event/createdReply"
		,data:query
		,dataType:"json"
		,success:function(data) {
			$("#replyContent").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);				
			} else if(state=="false") {
				alert("댓글을 등록하지 못했습니다.!!!");
			} else if(state=="loginFail") {
				login();
			}			
		}
		,error:function(e) {
			console.log(e.responseText);
		}	
	});
}

//댓글 삭제
function  deleteReply(replyNum, page) {
	var uid="${sessionScope.member.userId}";
	if(! uid){
		login();
		return;
	}
	
	if(confirm("게시물을 삭제하시겠습니까?")) {
		var url="<%=cp%>/event/deleteReply";
		$.post(url, {replyNum:replyNum, mode:"reply"}, function (data) {
			var state=data.state;
			
			if(state=="loginFail") {
				login();
			} else{
				listPage(page);
			}
		}, "json");		
	}	
}
		
</script>
<div style="width: 700px; margin: 20px auto 0; min-height: 800px;">
	<div style="height: 50px;"></div>
	<div style="font-size: 40px; width: 700px; font-weight: bold; color: #666666;">| 이벤트</div>
	
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
	<input type="button" class="btn-article" value="목록" onclick="javascript:location.href='<%=cp%>/event/list?${query}';">
	<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/event/update?eventCode=${dto.eventCode}&${query}';">
	<input type="button" class="btn-article" value="삭제" onclick="deleteEvent(${dto.eventCode});">
	</div>
	
	<br><br>
	<table style="width: 700px; margin: 20px auto 0; border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc; border-collapse: collapse; border-spacing: 0">
	<tr height="40" style="border-bottom: 1px solid #e3e3e3; font-size: 13px;">
		<td width="150" align="center" >이전글 ∧</td>
		<td colspan="3" align="left" onclick="viewPre();" style="cursor: pointer;">${preReadDto.subject}</td>
	</tr>
	
	
	<tr height="40" style="font-size: 13px;">
	
		<td width="150" align="center">다음글 ∨</td>
		<td colspan="3" align="left" onclick="viewNext();" style="cursor: pointer;">${nextReadDto.subject}</td>
	</tr>
	</table>
	
	<div class="popupLayer" style="display: none;">
		<div>
			<div id="fileinfo">
			<img src="<%=cp%>/resource/images/disk.gif">${dto.originalFile} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
			<a href="<%=cp%>/event/download?eventCode=${dto.eventCode}" style="text-decoration: none; color: #666666;"> PC저장하기</a>
				<span onClick="closeLayer()" style="cursor:pointer; color: #cccccc; float: right;">X</span>
			</div>
		</div>
	</div>
	
	<div style="width:700px; margin: 20px auto 0; min-height: 300px;">
		<table style='width: 100%"; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='30'>
				<td align='left'>
					<span style='font-weight: bold;'>댓글쓰기</span><span>- 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				</td>
			</tr>	
			<tr>
				<td style= 'padding:5px 5px 0px;'>
					<textarea id='replyContent' class='boxTA' style='width: 700px; height: 70px;'></textarea>
				</td>	
			</tr>
			<tr>
				<td align='right'>
					<button type='button' class='btn' style='padding:10px 20px;' onclick='sendReply();'>댓글 등록</button>
				</td>	
			</tr>
		</table>
		<div id="listReply"></div>
	</div>
</div>