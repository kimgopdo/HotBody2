<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
.aspect { width: 660px; height: 495px; }
#holder { border: 10px solid #ccc; width: 680px; height: 515px; margin: 20px auto;}
#holder.hover { border: 10px solid #0c0; }
#holder img { display: block; }
</style>
<script type="text/javascript">
$(function(){
	var url="<%=cp%>/hotShop/menuCall"
	$.ajax({
		type:"post"
		,url:url
		,success:function(menuData){
			$.each(menuData.bclList,function(index, item){
					$("#bciSelect").append("<option value=\""+item.bclcode+"\">"+item.bclname+"</option>");
					
			});
			$.each(menuData.sciList,function(index, item){
					$("#sciSelect").append("<option value=\""+item.scicode+"\">"+item.sciname+"</option>");
			});
		}
	});
})
    function send() {
    	var f = document.boardForm;
        var regNumber = /^[0-9]*$/
    	var str=f.upload.value;
        console.log(str);
        if(str==""){
    		alert("메인이미지가 없습니다.");
    		f.upload.focus();
    		return false;
    	}
        str=f.bclcode.value;
        console.log(str);
        if(!str || str=="::대분류") {
            alert("대분류를 선택하세요. ");
            f.bci.focus();
            return false;
        }
        str=f.scicode.value;
        console.log(str);
        if(!str || str=="::소분류") {
            alert("소분류를 선택하세요. ");
            f.sci.focus();
            return false;
        }
        str=f.pdName.value;
        console.log(str);
        if(!str || str=="") {
            alert("상품명을 입력하세요. ");
            f.pdName.focus();
            return false;
        }
        str=f.pdSumContent.value;//메인 추가내용
        console.log(str);
        if(!str || str=="") {
            alert("메인내용을 입력하세요. ");
            f.pdSumContent.focus();
            return false;
        }
        str=f.pdPrice.value;//상품소비자가격
        console.log(str);
        if(! regNumber.test(str)) {
            alert("가격을 입력하세요. ");
            f.pdPrice.focus();
            return false;
        }
        console.log(document.getElementById("content").value);
        if(document.getElementById("content").value=="<p>&nbsp;</p>"){
    		alert("내용입력해주세요");
    		document.getElementById("content").focus;
    		return false;
    	}
        
        str=f.pdNutrient.value;//영양성분표시
        console.log(str);
        if(!str || str=="") {
            alert("영양성분표시를 입력하세요. ");
            f.pdNutrient.focus();
            return false;
        }
        str=f.pdArea.value;//생산지
        console.log(str);
        if(!str || str=="") {
            alert("생산지를 입력하세요. ");
            f.pdArea.focus();
            return false;
        }
        str=f.pdStMethod.value;//보관방법
        console.log(str);
        if(!str || str=="") {
            alert("보관방법을 입력하세요. ");
            f.pdStMethod.focus();
            return false;
        }
        str=f.pdType.value;//식품유형
        console.log(str);
        if(!str || str=="") {
            alert("식품유형을 입력하세요. ");
            f.pdType.focus();
            return false;
        }
        str=f.pdRawName.value;//상품원재료명
        console.log(str);
        if(!str || str=="") {
            alert("상품원재료명을 입력하세요. ");
            f.pdRawName.focus();
            return false;
        }
        if($('input:checkbox[name="showandhide"]').is(":checked")){
        	f.showandhide.value=1;
        }
   		f.action="<%=cp%>/hotShop/created";
        f.submit();
        
        return true;
    }
</script>
<!--  onsubmit="return submitContents(this);" -->
<form name="boardForm" method="post" enctype="multipart/form-data">
	<div style="min-width:1140px; margin-top: 150px;">
		<input type="checkbox" name="showandhide" value="0">숨김
		<select id="bciSelect" name="bclcode" style="padding: 10px;">
			<option selected="selected">::영양소별</option>
		</select>
		<select id="sciSelect" name="scicode" style="padding: 10px;">
			<option selected="selected">::유형별</option>                       
		</select><br>
		<div id="holder" class="aspect" style="float: left;">
			<c:if test="${mode=='update'}">
				<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
			</c:if>
		</div>
		<c:if test="${mode=='update'}">
		<input name="pdnum" type="hidden" value="${dto.pdnum}">
		<input name="imgSaveFilename" type="hidden" value="${dto.imgSaveFilename}">
		<input name="mode" type="hidden" value="update">
		</c:if>
		<div style="width:40%; float: right;">
		<table style="width: 100%;">
		<tr>
			<td>
				<span style="font-weight: bold;">상&nbsp;&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;</span><br><input type="text" name="pdName" style="width: 100%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdName}"><br>
				<span style="font-weight: bold;">상품내용&nbsp;&nbsp;</span><textarea name="pdSumContent" style="width: 100%; height:300px; border: 1px solid #BDBDBD; outline: none;">${mode=="update"?dto.pdSumContent:""}</textarea><br>
				<span style="font-weight: bold;">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="pdPrice" style="width: 80%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdPrice}"><br>
				<span style="font-weight: bold;">마&nbsp;&nbsp;일&nbsp;&nbsp;리&nbsp;지&nbsp;&nbsp;</span><input type="text" name="milelage" style="width: 80%; border: 1px solid #BDBDBD; outline: none;" value="${dto.milelage}"><br>			
				<span style="float:left; font-weight: bold;">${mode=="update"?dto.imgOriginalFilename:"메인이미지등록"}</span>                                                                                                                                   
				<input name="upload" type="file" style="width:80px; float: left;">
			</td>
		</tr>
		</table>
		</div>
		<textarea name="content" id="content" style="width: 95%; height: 400px;">${dto.content}</textarea> <br>
		<span style="font-weight: bold;">영양성분표시&nbsp;</span><input type="text" name="pdNutrient" style="width: 20%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdNutrient}"><br>
		<span style="font-weight: bold;">생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산&nbsp;&nbsp;&nbsp;&nbsp;지&nbsp;&nbsp;</span><input type="text" name="pdArea" style="width: 20%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdArea}"><br>
		<span style="font-weight: bold;">보&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;방&nbsp;&nbsp;법&nbsp;</span><input type="text" name="pdStMethod" style="width: 20%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdStMethod}"><br>
		<span style="font-weight: bold;">식&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;유&nbsp;&nbsp;형&nbsp;</span><input type="text" name="pdType" style="width: 20%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdType}"><br>
		<span style="font-weight: bold;">상품원재료명&nbsp;</span><input type="text" name="pdRawName" style="width: 20%; border: 1px solid #BDBDBD; outline: none;" value="${dto.pdRawName}"><br>
		
	    <button type="reset" style="border: 1px solid #BDBDBD; background: white; border-radius: 3px; height: 30px; outline: none;">${mode=="update"?"수정취소":"등록취소"}</button>
	    <button type="button" style="border: 1px solid #BDBDBD; background: white; border-radius: 3px; height: 30px; outline: none;" onclick="submitContents(this);">${mode=="update"?"수정하기":"등록하기"}</button>
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
		return send();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
<script>
var upload = document.getElementsByName('upload')[0],
    holder = document.getElementById('holder')                  
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    img.className="aspect";

    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);
};
</script>