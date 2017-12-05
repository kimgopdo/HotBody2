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
<style type="text/css">
body{
	font-family: "맑은 고딕";
	font-size: 14px;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

:after,
:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

.form-group {
    display: inline-block;
    margin-bottom: 0;
    vertical-align: middle;
}

.form-control {
    display: inline-block;
    width: 100%;
    height: 30px;
    font-size: 12px;
    line-height: 1.42857;
    color: rgb(85, 85, 85);
    background-color: rgb(255, 255, 255);
    background-image: none;
    box-shadow: rgba(0, 0, 0, 0.0745098) 0 1px 1px inset;
    padding: 6px 9px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(204, 204, 204);
    border-image: initial;
    border-radius: 2px;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control[readonly],
fieldset[disabled] .form-control {
    background-color: #ffffff;
    opacity: 1;
}

.form_file .file_load {
    display: inline-block;
    position: relative;
    width: 95px;
    height: 31px;
    cursor: pointer;
}

.form_file .file_load [type="file"] {
    display: inline-block;
    position: absolute;
    width: inherit;
    height: inherit;
    z-index: 1;
    opacity: 0;
}

.form_file .file_load label {
    position: relative;
    z-index: 5;
    cursor: pointer;
}

.btn-default {
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    width : 150px;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    white-space: nowrap;
    font-size: 12px;
    user-select: none;
    border-width: 1px;
    border-style: solid;
    background-color: #666666;
    border-color: #333333;
    border-image: initial;
    padding: 6px 9px;
    border-radius: 2px;
    color: #ffffff;
}

.btn-default02 {
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
</style>
<script type="text/javascript">
function sendOk() {
	var f = document.boardForm;
	
	if(!f.subject.value){
		alert("제목을 입력하세요.");
		f.subject.focus();
		return;
	}
	
	if(!f.name.value){
		alert("이름을 입력하세요.");
		f.name.focus();
		return;
	}
	
	if(!f.content.value){
		alert("내용을 입력하세요.");
		f.content.focus();
		return;
	}
	
	f.submit();
}
function fileChange() {
	var upload=document.getElementById("upload").value;
	document.getElementById("fileName").value=upload.substring(0,upload.lastIndexOf("."));
}
function deleteFile() {
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		location.href="<%=cp%>/notice/deleteFile?page=${page}&num=${dto.num}"
	}
}
</script>
</head>
<body>
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">클래스 등록</div>
<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form action="<%=cp%>/notice/${mode}" method="post" name="boardForm" enctype="multipart/form-data">
<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
<tr height="40">
	<td width="100">클래스명</td>
	<td>
		<input type="text" name="subject" style="width: 98%; height: 35px;" value="${dto.subject}">
	</td>
</tr>
<tr height="10px;"></tr>

<tr>
	<td width="100">클래스 난이도</td>
	<td>
		<input type="checkbox" name="notice" id="notice" value="1" ${dto.notice=="1"?"checked='checked'":""}>
		<label for="notice"> 상 </label>
		
		<input type="checkbox" name="notice" id="notice" value="2" ${dto.notice=="2"?"checked='checked'":""}>
		<label for="notice"> 중 </label>
		
		<input type="checkbox" name="notice" id="notice" value="3" ${dto.notice=="3"?"checked='checked'":""}>
		<label for="notice"> 하 </label>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">수강료</td>
	<td>
		<input type="text" name="name" style="width: 98%; height: 35px;" value="${dto.name}">
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100" valign="top">목적</td>
	<td>
		<textarea style="width: 98%;" rows=6; name="content">${dto.content}</textarea>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100" valign="top">목적상세</td>
	<td>
		<textarea style="width: 98%;" rows=10; name="content">${dto.content}</textarea>
	</td>
</tr>


<tr height="10px;"></tr>

<tr height="40">
	<td width="100">파일등록</td>
	<td>
	<div class="form-group form_file">
	  <input id="fileName" class="form-control form_point_color01" type="text" title="첨부된 파일명" readonly style="width:430px">
	  <span class="file_load">
	        <input type="file" id="upload" name="upload" onchange="fileChange();">
	        <label class="btn-default" for="upload">파일첨부</label>
	    </span>
	</div>
	</td>
</tr>

<tr>
	<td></td>
	<td style="color: #666666; font-size: 13px;">
		(최대 10MB이하의 파일이 등록 가능합니다.)
	</td>
</tr>
<tr height="10px;"></tr>

<c:if test="${mode=='update'}">
<tr height="40">
	<td width="100">첨부된파일</td>
	<td>
		${dto.originalFilename}
		<c:if test="${not empty dto.saveFilename}">
			&nbsp;<a href="javascript:deleteFile();">
			<img src="<%=cp%>/resource/images/close_icon.png">
			</a>
		</c:if>
	</td>
</tr>
</c:if>
<tr>
	<td width="100"></td>
	<td>
		<input type="checkbox" name="notice" id="notice" value="0" ${dto.notice=="0"?"checked='checked'":""}>
		<label for="notice"> 온라인 </label>
		
		<input type="checkbox" name="notice" id="notice" value="1" ${dto.notice=="1"?"checked='checked'":""}>
		<label for="notice"> 오프라인 </label>
	</td>
</tr>
</table>
<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 1000px; margin: 20px auto 0;" align="center">
<button type="button" class="btn-default02" onclick="sendOk();">등록</button>
<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/notice/list?page=${page}';">등록취소</button>
<c:if test="${mode=='update'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="num" value="${dto.num}">
	<input type="hidden" name="query" value="${query}">
	<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
	<input type="hidden" name="fileSize" value="${dto.fileSize}">
	<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
</c:if>
</div>
</form>
</body>
</html>
