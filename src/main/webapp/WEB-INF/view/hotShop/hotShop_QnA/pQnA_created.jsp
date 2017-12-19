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

</style>

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

function check() {
	var f = document.boardForm;
	var mode = "${mode}";
	var uid = "${sessionScope.member.userId}";
	
	if(!f.pdQSubject.value){
		alert("제목을 입력하세요.");
		f.pdQSubject.focus();
		return false;
	}
	if(! document.getElementById("pdQContent").value){
		alert("내용을 입력하세요.");
		f.pdQSubject.focus();
		return false;
	}
	if(! uid){
		alert("로그인 후 이용 가능합니다.")
		location.href="<%=cp%>/member/login";
		return;
	}
	
	f.action="<%=cp%>/hotShop/pQnA_"+mode;

    f.submit();
}

</script>
</head>
<body style="min-height: 950px;">
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 100%; margin: 20px auto 0; font-weight: bold; color: #666666;" align="left"> Q & A 등록</div>
<div style="width:100%; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form method="post" name="boardForm" enctype="multipart/form-data" onsubmit="return submitContents(this);">
<table style="width: 100%; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">

<tr height="30">
	<td width="80">제목</td>
	<td>
		<input type="text" name="pdQSubject" style="width: 100%; height: 25px;" value="${dto.pdQSubject}">
	</td>
</tr>

<tr height="30">
	<td width="80">작성자</td>
	<td style="width: 90%; height: 25px; color: black;" align="left"><p style="font-weight: bold;">${sessionScope.member.userName}</p></td>
</tr>

<tr height="40">
	<td width="80" valign="top">내용</td>
	<td>
		<textarea style="width: 90%;" rows=10; name="pdQContent" id="pdQContent">${dto.pdQContent}</textarea>
	</td>
</tr>

</table>
<div style="width:100%; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 100%; margin: 20px auto 0;" align="center">
<button type="button" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 30px;" onclick="submitContents(this);">${mode=="created"? "등록완료":(mode=="update"?"수정완료":"답변등록")}</button>
<button type="button" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 30px;" onclick="javascript:location.href='<%=cp%>/hotShop/pQnA_list';">${mode=="created"? "등록취소":(mode=="update"?"수정취소":"답변취소")}</button>
<c:if test="${mode=='update'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="pdQCode" value="${dto.pdQCode}">
	<input type="hidden" name="query" value="${query}">
</c:if>
<c:if test="${mode=='answer'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="groupNum" value="${dto.groupNum}">
	<input type="hidden" name="answerNum" value="${dto.pdQCode}">
	<input type="hidden" name="pdNum" value="${dto.pdNum}">
</c:if>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "pdQContent",
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
	oEditors.getById["pdQContent"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["pdQContent"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["pdQContent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["pdQContent"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</form>
</body>
</html>


