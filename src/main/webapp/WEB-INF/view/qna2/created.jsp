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
		location.href="<%=cp%>/qna2/deleteFile?page=${page}&qna2Code=${dto.qna2Code}"
	}
}

</script>
</head>
<body style="height: 1000px">
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">| 자주묻는 질문</div>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form action="<%=cp%>/qna2/${mode}" method="post" name="boardForm" enctype="multipart/form-data" onsubmit="return submitContents(this);">
<table style="width: 700px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
<tr height="40">
	<td width="100">제목</td>
	<td>
		<input type="text" name="subject" style="width: 98%; height: 35px;" value="${dto.subject}">
	</td>
</tr>

<tr height="40">
	<td width="100" valign="top">내용</td>
	<td>
		<textarea style="width: 98%;" rows=10; name="content" id="content">${dto.content}</textarea>
	</td>
</tr>
<tr height="10px;"></tr>


	
</table>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 700px; margin: 20px auto 0;" align="center">
<button type="submit" class="btn-default02">등록</button>
<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/qna2/list?page=${page}';">등록취소</button>
<c:if test="${mode=='update'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="qna2Code" value="${dto.qna2Code}">
	<input type="hidden" name="query" value="${query}">
</c:if>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
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
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</form>
</body>
</html>


