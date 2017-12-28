<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script>

// 직접입력
$(function(){
  	$("#unit").hide();

	$("#unitSelect").change(function() {
        //직접입력을 누를 때 나타남
		if($("#unitSelect").val() == "direct") {
			$("#unit").val("");
			$("#unit").show();
		}  else {
			$("#unit").val($("#unitSelect").val());
			$("#unit").hide();
		}	
	}); 
	
	if($("#unitSelect").val()!="direct") {
		$("#unit").val($("#unitSelect").val());
	}
});

</script>
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
		location.href="<%=cp%>/myclass/addingrerdients/deleteFile?page=${page}&num=${dto.ingrerdientsNum}";
	}
}
</script>

<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 40px;">
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">${mode=='update'?'재료수정':'재료등록'}</div>
<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form action="<%=cp%>/myclass/addingrerdients/${mode}" method="post" name="boardForm" enctype="multipart/form-data">
<table style="width: 1000px; border-collapse: collapse; border-spacing: 0">
<tr height="40" style="margin: 30px auto;">
	<td width="100">재 료 명</td>
	<td>
		<input type="text" name="ingredientsName" style="width: 15%; height: 35px;" value="${dto.ingredientsName}">
	</td>
</tr>

<tr height="10px;"></tr>

<tr height="40">
	<td width="100">재료단위</td>
	<td>
		<input type="text" name="ingredientsUnit" style="width: 8%; height: 35px;" value="${dto.ingredientsUnit}">
		<span style="font-weight: bold;">(최소단위를 입력하세요. 예) 고구마1개= 1, 우유100ML= 100, 쌀밥1인분= 1 등...)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">단위</td>
	<td> 
		<select id="unitSelect" name="unitSelect" style="height: 35px; width: 100px;">
	           <option value='g' selected="selected" ${dto.unit =="g" ? "selected='selected'" : ""}> g </option>
	           <option value='ml' ${dto.unit =="ml" ? "selected='selected'" : ""}> ml </option>
	           <option value='인분' ${dto.unit =="인분" ? "selected='selected'" : ""}> 인분 </option>
	           <option value='개' ${dto.unit =="개" ? "selected='selected'" : ""}> 개 </option>
	           <option value='mg' ${dto.unit =="mg" ? "selected='selected'" : ""}> mg </option>
	           <option value="direct">직접입력</option>
       </select>
       <input type="text" id="unit" name="unit" style="width: 8%; height: 35px;" value="${dto.unit}">
       <span style="font-weight: bold;">(선택하세요)</span>
	</td>
</tr>
<tr height="10px;"></tr>


<tr height="40">
	<td width="100">영양소정보</td>
	<td>
		<select name='nutrient ' style="height: 35px; width: 100px;">
	           <option value='탄수화물' selected="selected" ${dto.nutrient =="탄수화물" ? "selected='selected'" : ""}> 탄수화물 </option>
	           <option value='단백질' ${dto.nutrient =="단백질" ? "selected='selected'" : ""}> 단백질 </option>
	           <option value='지방' ${dto.nutrient =="지방" ? "selected='selected'" : ""}> 지방 </option>
       </select>
       <span style="font-weight: bold;">(선택하세요)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">재료칼로리</td>
	<td>
		<input type="text" name="calory" style="width: 8%; height: 35px;" value="${dto.calory}">
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
	        <input type="file" id="upload" name="upload" onchange="fileChange();">
	        <label class="btn-default" for="upload">이미지첨부</label>
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
		${dto.image}
		<c:if test="${not empty dto.image}">
			&nbsp;<a href="javascript:deleteFile();">
			<img src="<%=cp%>/resource/images/close_icon.png">
			</a>
		</c:if>
	</td>
</tr>
</c:if>
</table>
<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 1000px; margin: 20px auto 0;" align="center">
<button type="button" class="btn-default02" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/list?page=${page}';">${mode=='update'?'수정취소':'등록취소'}</button>
<c:if test="${mode=='update'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="ingrerdientsNum" value="${dto.ingrerdientsNum}">
	<input type="hidden" name="query" value="${query}">
	<input type="hidden" name="image" value="${dto.image}">
</c:if>
</div>
</form>
</div>
