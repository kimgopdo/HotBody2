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

    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

   		f.action="<%=cp%>/주소";

        return true;
    }
</script>

<form name="boardForm" method="post" onsubmit="return submitContents(this);">
	<div style="margin-top: 50px;">
		<span style="font-weight: bold;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;&nbsp;&nbsp;</span><input type="text" name="pdName" style="width: 90%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">상품내용&nbsp;&nbsp;</span><textarea name="pdSumContent" style="width: 90%; border: 1px solid #BDBDBD; outline: none;"></textarea><br><br>
		<span style="font-weight: bold;">배송정책&nbsp;&nbsp;</span><input type="text" name="pdDelRule" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">유통기한&nbsp;&nbsp;</span><input type="text" name="pdExDate" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격&nbsp;&nbsp;</span><input type="text" name="pdPrice" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">총&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액&nbsp;&nbsp;</span><input type="text" name="totalPay" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량&nbsp;&nbsp;</span><input type="text" name="amount" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<textarea name="content" id="content" style="width: 95%; height: 400px;">${dto.content}</textarea> <br>
		<span style="font-weight: bold;">영양성분표시&nbsp;&nbsp;</span><input type="text" name="pdNutrient" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">생산지&nbsp;&nbsp;</span><input type="text" name="pdArea" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">보관방법&nbsp;&nbsp;</span><input type="text" name="pdStMethod" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">식품유형&nbsp;&nbsp;</span><input type="text" name="pdType" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		<span style="font-weight: bold;">상품원재료명&nbsp;&nbsp;</span><input type="text" name="pdRawName" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br><br>
		
	    <button type="submit" style="border: 1px solid #BDBDBD; background: white; border-radius: 3px; height: 30px; outline: none;">등록취소</button>
	    <button type="submit" style="border: 1px solid #BDBDBD; background: white; border-radius: 3px; height: 30px; outline: none;">등록하기</button>
    </div>
</form>

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