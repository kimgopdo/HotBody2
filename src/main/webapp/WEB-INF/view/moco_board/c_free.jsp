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

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

function check() {
	var f = document.boardForm;
	
 	if(!f.moFBSubject.value){
		alert("제목을 입력하세요.");
		f.moFBSubject.focus();
		return;
	} 
 		
 	 
	if(document.getElementById("moFBContent").value == "<p>&nbsp;</p>") {
		alert("내용을 입력하세요");
		document.getElementById("moFBContent").focus();
		return;
	}
	
	f.action="<%=cp%>/moco_board/${mocoNum}/c_free";
	f.submit();
}
function fileChange() {
	var upload=document.getElementById("upload").value;
	document.getElementById("fileName").value=upload.substring(0,upload.lastIndexOf("."));
}
function deleteFile() {
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		location.href="<%=cp%>/moco_board/deleteFile?page=${page}&num=${dto.moFBNum}"
	}
}
</script>
</head>
<body>
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">자유게시판</div>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form method="post" name="boardForm" enctype="multipart/form-data">
<table style="width: 700px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">


<tr height="40">
	<td width="100">제목</td>
	<td>
		<input type="text" name="moFBSubject" style="width: 98%; height: 35px;" value="${dto.moFBSubject}">
	</td>
</tr>

<tr height="40">
	<td width="100">글쓴이</td>
	<td>${sessionScope.member.userId}</td>
	</tr>

<tr height="40">
	<td width="100" valign="top">내용</td>
	<td>
		<textarea style="width: 98%;" rows=10; name="moFBContent" id="moFBContent">${dto.moFBContent}</textarea>
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

<c:if test="${mode=='u_free'}">
<tr height="40">
	<td width="100">첨부된 파일</td>
	<td>
		${dto.moFBFile}
		<c:if test="${not empty dto.moFBFile}">
			&nbsp;<a href="javascript:deleteFile();">
			<img src="<%=cp%>/resource/images/close_icon.png">
			</a>
		</c:if>
	</td>
</tr>
</c:if>

</table>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 700px; margin: 20px auto 0;" align="center">
 <button type="button" class="btn-default02" onclick="submitContents(this);">등록</button>
 <button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/moco_board/${mocoNum}/list_free';">등록취소</button>
<c:if test="${mode=='u_free'}">
	<input type="hidden" name="moFBNum" value="${dto.moFBNum}">
	<input type="hidden" name="moFBFile" value="${dto.moFBFile}">
</c:if>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "moFBContent",
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
	oEditors.getById["moFBContent"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["moFBContent"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["moFBContent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	try {
		//elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["moFBContent"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</form>
</body>
</html>


