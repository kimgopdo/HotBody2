<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

function check() {
	var f = document.boardForm;
	
	if(!f.subject.value){
		alert("제목을 입력하세요.");
		f.subject.focus();
		return false;
	}
	
	if(!str || str=="<p>&nbsp;</p>") {
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	
	return true;
}
function fileChange() {
	var upload=document.getElementById("upload").value;
	document.getElementById("fileName").value=upload.substring(0,upload.lastIndexOf("."));
}
function deleteFile() {
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		location.href="<%=cp%>/myclass/addexercise/deleteFile?page=${page}&num=${dto.exerciseNum}"
	}
}
</script>
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

<div class="body-container" style="width: 700px; margin: 50px auto;">
<div  class="body-title" style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">${mode=='update'?'운동수정':'운동등록'}</div>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form action="<%=cp%>/myclass/addexercise/${mode}" method="post" name="boardForm" enctype="multipart/form-data" onsubmit="return submitContents(this);">
<table style="width: 700px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
<tr height="40">
	<td width="100">운 동 명</td>
	<td>
		<input type="text" name="exerciseName" style="width: 20%; height: 35px;" value="${dto.exerciseName}">
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">운동분류</td>
 	<td>
		<c:if test="${not empty list}" >
			 <select id=list name="exerciseType" style="width: 100px; height: 35px;">
					<c:forEach var="vo" items="${list}">
         				<option value="${vo.exerciseType}" ${vo.exerciseType== dto.exerciseType?"selected='selected'":""}>${vo.typeName}</option>
      				</c:forEach>
			</select>
		</c:if>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">단위시간</td>
	<td>
		<input type="text" name="unitTime" style="width: 15%; height: 35px;" value="${dto.unitTime}">
		<span style="font-weight: bold;">(최소시간을 입력하세요. 예) 런닝10분=10, 벤치1set= 1, 복근운동30번= 30)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">단위</td>
	<td> 
		<select id="unitSelect" name="unitSelect" style="height: 35px; width: 100px;">
	           <option value='회' selected="selected" ${dto.unit =="회" ? "selected='selected'" : ""}> 회 </option>
	           <option value='set' ${dto.unit =="set" ? "selected='selected'" : ""}> set </option>
	           <option value='분' ${dto.unit =="분" ? "selected='selected'" : ""}> 분 </option>
	           <option value="direct">직접입력</option>
       </select>
       <input type="text" id="unit" name="unit" style="width: 10%; height: 35px;" value="${dto.unit}">
       <span style="font-weight: bold;">(선택하세요)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100">소모칼로리</td>
	<td>
		<input type="text" name="lossCal" style="width: 15%; height: 35px;" value="${dto.lossCal}">
		<span style="font-weight: bold;">kcal (운동단위시간 당 소모칼로리를 입력하세요.)</span>
	</td>
</tr>
<tr height="10px;"></tr>

<tr height="40">
	<td width="100" valign="top">운동방법</td>
	<td>
		<textarea style="width: 98%;" rows=10; name="pic" id="pic">${dto.pic}</textarea>
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
	        <label class="btn-default" for="upload">동영상첨부</label>
	    </span>
	</div>
	</td>
</tr>
<tr height="10px;"></tr>

<tr>
	<td></td>
	<td style="color: #666666; font-size: 13px;">
		(최대 100MB이하의 파일이 등록 가능합니다.)
	</td>
</tr>
<tr height="10px;"></tr>

<c:if test="${mode=='update'}">
<tr height="40">
	<td width="100">첨부된 파일</td>
	<td>
		${dto.video}
		<c:if test="${not empty dto.video}">
			&nbsp;<a href="javascript:deleteFile();">
			<img src="<%=cp%>/resource/images/close_icon.png">
			</a>
		</c:if>
	</td>
</tr>
</c:if>
</table>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 700px; margin: 20px auto 0; margin-bottom: 100px;" align="center">
<button type="submit" class="btn-default02">${mode=='update'?'수정':'등록'}</button>
<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/myclass/addexercise/list?page=${page}';">${mode=='update'?'수정취소':'등록취소'}</button>
<c:if test="${mode=='update'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="exerciseNum" value="${dto.exerciseNum}">
	<input type="hidden" name="video" value="${dto.video}">
	<input type="hidden" name="query" value="${query}">
</c:if>
</div>
</form>
</div>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "pic",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["pic"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["pic"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["pic"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["pic"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>




