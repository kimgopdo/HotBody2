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

<script type="text/javascript">//스크립트에서 로케이션 리턴

function deleteQna1(qna1Code) {
	if(confirm("게시물을 삭제하시겠습니까?")) {
		var url="<%=cp%>/qna1/delete?qna1Code="+qna1Code+"&page=${page}";
		location.href=url;
	}
}

function viewNext() {
	var next ="${nextReadDto}";
	if(next==""){
		swal("다음글이 존재하지 않습니다.");
		return;
	}
	location.href="<%=cp%>/qna1/article?qna1Code=${nextReadDto.qna1Code}&page=${page}";
}

function viewPre() {
	var pre ="${preReadDto}";
	if(pre==""){
		swal("이전글이 존재하지 않습니다.");
		return;
	}
	
	location.href="<%=cp%>/qna1/article?qna1Code=${preReadDto.qna1Code}&page=${page}";

}
		
</script>
<div style="width: 700px; margin: 20px auto 0; min-height: 800px;">
	<div style="height: 50px;"></div>
	<div style="font-size: 40px; width: 700px; font-weight: bold; color: #666666;">| 자주묻는질문</div>
	
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
	<input type="button" class="btn-article" value="목록" onclick="javascript:location.href='<%=cp%>/qna1/list?${query}';">
	<input type="button" class="btn-article" value="수정" onclick="javascript:location.href='<%=cp%>/qna1/update?qna1Code=${dto.qna1Code}&${query}';">
	<input type="button" class="btn-article" value="삭제" onclick="deleteQna1(${dto.qna1Code});">
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
	
</div>