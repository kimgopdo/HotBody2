<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
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
	
/* 나중에 수정요망
		
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
*/
	
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

<div class="body-container" style="width: 1100px; margin-top: 100px;">

<div class="body-title">
        <h3><span style="font-family: Webdings">2</span>재료입력</h3>
</div>

<form action="<%=cp%>/myclass/addingrerdients/${mode}" method="post" name="boardForm" enctype="multipart/form-data">
<table style="width: 1100px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
<tr height="40">
	<td width="100">재 료 명</td>
	<td>
		<input type="text" name="ingredientsName" style="width: 15%; height: 35px;" value="${dto.subject}">
	</td>
</tr>

<tr height="10px;"></tr>

<tr height="40">
	<td width="100">영양소정보</td>
	<td> 
		<select name='nutrient ' style="height: 35px;">
	           <option value='탄수화물' selected="selected"> 탄수화물 </option>
	           <option value='단백질' ${dto.nutrient =="단백질" ? "selected='selected'" : ""}> 단백질 </option>
	           <option value='지방'> 지방 </option>
       </select>
	</td>
</tr>
<tr height="10px;"></tr>


<tr height="40">
	<td width="100">재료단위</td>
	<td>
		<input type="text" name="ingredientsUnit" style="width: 8%; height: 35px;" value="${dto.subject}">
		<span style="font-weight: bold;">(최소단위를 입력하세요. 예) 고구마1개, 우유100ML, 밥1공기 등...)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">재료칼로리</td>
	<td>
		<input type="text" name="calory" style="width: 8%; height: 35px;" value="${dto.subject}">
		<span style="font-weight: bold;">kcal (재료단위당 칼로리를 입력하세요.)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100" valign="top">설&nbsp;&nbsp;&nbsp;명</td>
	<td>
		<textarea style="width: 50%; resize: none;" rows=10; name="content">${dto.content}</textarea>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">이미지등록</td>
	<td>
	<div class="form-group form_file">
	  <input id="fileName" class="form-control form_point_color01" type="text" title="첨부된 파일명" readonly style="width:350px">
	  <span class="file_load">
	        <input type="file" id="image" name="image" onchange="fileChange();">
	        <label class="btn-default" for="image">이미지첨부</label>
	    </span>
	</div>
	</td>
</tr>

<tr>
	<td></td>
	<td style="color: #666666; font-size: 13px;">
		(최대 10MB이하의 이미지 등록이 가능합니다.)
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
</table>
<div style="width:1100px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 1100px; margin: 20px auto 0;" align="center">
<button type="button" class="btn-default02" onclick="sendOk();">등록</button>
<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/list?page=${page}';">등록취소</button>
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
</div>
