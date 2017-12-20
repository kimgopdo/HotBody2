<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

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
<script type="text/javascript">
function deleteFB(moFBNum) {
	if(confirm("내용을 삭제하시겠습니까?")){
		
		var url="<%=cp%>/moco_board/${mocoNum}/delete?moFBNum=${dto.moFBNum}";
		location.href=url;
		
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
		var fi = "${dto.moFBFile}";
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
	var next ="${preReadFB}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/moco_board/${mocoNum}/article_free?moFBNum=${nextReadFBDto.moFBNum}&page=${page}";
}

function viewPre() {
	var pre ="${preReadFB}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/moco_board/${mocoNum}/article_free?moFBNum=${preReadFBDto.moFBNum}&page=${page}";
	}

function sendReply(){
	var uid="${sessionScope.member.userId}";
	if(! uid){
		location.href='<%=cp%>/member/login';
		return;
	}
	
	var content=$.trim($("#replyContent").val());
	if(! content){
		$("#replyContent").focus();
		return;
	}
	
	var query="moFBNum=${dto.moFBNum}";
	query+="&moFBReply="+encodeURIComponent(content);
	
	// AJAX : JSON
	$.ajax({
		 type:"post" // 전송방식
         ,url:"<%=cp%>/moco_board/insertReply"
         ,data:query
         ,dataType:"json"
        ,success:function(data) {
     		$("#replyContent").val("");
     			
     		var state=data.state;
     		if(state=="true") {
     				listPage(1);
     		} else if(state=="false") {
     			alert("댓글을 등록하지 못했습니다. !!!");
     		} else if(state=="loginFail") {
     			login();
     		}
     	}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

	
</script>

<div style="min-height: 1200px;">
	<div style="height: 50px;"></div>
	<div
		style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">자유게시판</div>

	<table
		style="width: 700px; margin: 20px auto 0; border-top: 2px solid #333333; border-bottom: 2px solid #333333; border-collapse: collapse; border-spacing: 0">
		<tr height="50" style="border-bottom: 1px solid #cccccc">
			<td
				style="width: 40px; padding-left: 10px; font-weight: bold; color: #666666;">제목
			</td>
			<td align="left">${dto.moFBSubject}</td>

			<td
				style="width: 40px; margin-left: 10px; font-weight: bold; color: #666666;">날짜</td>
			<td style="width: 160px;">${dto.moFBCreated}</td>
		</tr>
		<tr height="30"
			style="font-size: 13px; color: gray; padding: 5px 15px;">
			<td colspan="3"></td>
			<td align="right">
				<p id="filedown"
					style="text-decoration: none; color: #666666; cursor: pointer;">
					첨부파일 <span style="color: tomato; font: bold;">(개수)</span>
				</p>
			</td>
		</tr>

		<tr height="400" style="border-bottom: 1px solid #cccccc;">
			<td colspan="4" valign="top"
				style="padding-left: 10px; word-break: break-all;">${dto.moFBContent}<br>
			<br></td>
		</tr>
	</table>

	<div style="width: 700px; margin: 20px auto 0;">
		<input type="button" class="btn-article" value="목록"
			onclick="javascript:location.href='<%=cp%>/moco_board/${mocoNum}/free_list?${query}';">
		<c:if test="${sessionScope.member.userId==dto.userId}">
			<input type="button" class="btn-article" value="수정"
				onclick="javascript:location.href='<%=cp%>/moco_board/${mocoNum}/u_free?num=${dto.moFBNum}';">
		</c:if>
		<c:if
			test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			<input type="button" class="btn-article" value="삭제"
				onclick="deleteFB();">
		</c:if>
		<%-- 
<c:if test="${dto.userId=='admin' || dto.userId==sessionScope.member.userId}">
<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/notice/update?num=${dto.num}&${query}';">
<input type="button" class="btn-article" value="삭제" onclick="deleteNotice(${dto.num});">
</c:if>
 --%>
		<input type="button" class="btn-article" value="답글" onclick="">
		<input type="button" class="btn-article" value="다음▶ "
			onclick="viewNext();" style="float: right; margin-left: 5px;">
		<input type="button" class="btn-article" value="◀이전"
			onclick="viewPre();" style="float: right;">
	</div>

	<div class="popupLayer" style="display: none; z-index: 9000;">
		<div>
			<div id="fileinfo">
				<img src="<%=cp%>/resource/images/disk.gif">${dto.moFBFile}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| <a
					href="<%=cp%>/notice/download?num=${dto.moFBNum}"
					style="text-decoration: none; color: #666666;"> PC저장하기</a> <span
					onClick="closeLayer()"
					style="cursor: pointer; color: #cccccc; float: right;">X</span>
			</div>
		</div>
	</div>
	
	<div>
		<table style="width:700px;  margin: 15px auto 0px; border-spacing: 0;">
			<tr height="30">
				<td><span style="font-weight: bold;">댓글쓰기</span> <span>
						- 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가하여 주세요.</span></td>
			</tr>

			<tr>
				<td style="padding: 5px 5px 0;">
				<textarea id="replyContent"	class="boxTA" style="width: 99%; height: 70px;"></textarea>
				</td>
			</tr>

			<tr>
				<td>
					<button type="button" class="btn" style="padding: 10px 20px;"
						onclick="sendReply();">댓글등록</button>
				</td>
			</tr>
		</table>

		<div id="listReply"></div>

	</div>
</div>	

