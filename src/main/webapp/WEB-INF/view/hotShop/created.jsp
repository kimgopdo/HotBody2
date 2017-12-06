<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
#holder { border: 10px solid #ccc; width: 680px; height: 515px; margin: 20px auto;}
#holder.hover { border: 10px solid #0c0; }
#holder img { display: block; }
 
 
#container { width: 300px; margin: 0px auto;}
progress { width: 300px; margin: 0px auto; }
</style>
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
	<div style="min-width:1140px; margin-top: 50px;">
		<select style="padding: 10px;">
			<option selected="selected">::대분류</option>
			<option value="drink">음료</option>
			<option value="snack">간식</option>
			<option value="food">식사</option>
			<option value="dressing">드레싱</option>
			<option value="supplement">보충제</option>
			<option value="healthFood">건강식</option>
		</select>
		<select style="padding: 10px;">
			<option selected="selected">::소분류</option>
			<option value="protein">단백질</option>
			<option value="carbohydrate">탄수화물</option>
			<option value="fat">지방</option>
			<option value="minerals">무기질</option>
			<option value="dietary">식이섬유</option>
		</select><br>
		<div id="holder" style="float: left;">
		</div>
		<div style="width:40%; float: right;">
		<span style="font-weight: bold;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;&nbsp;&nbsp;</span><br><input type="text" name="pdName" style="width: 100%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">상품내용&nbsp;&nbsp;</span><textarea name="pdSumContent" style="width: 100%; height:300px; border: 1px solid #BDBDBD; outline: none;"></textarea><br>
		<span style="font-weight: bold;">배송정책&nbsp;&nbsp;</span><input type="text" name="pdDelRule" style="width: 80%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">유통기한&nbsp;&nbsp;</span><input type="text" name="pdExDate" style="width: 80%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격&nbsp;&nbsp;</span><input type="text" name="pdPrice" style="width: 80%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">총&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액&nbsp;&nbsp;</span><input type="text" name="totalPay" style="width: 80%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;량&nbsp;&nbsp;</span><input type="text" name="amount" style="width: 80%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">재&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고&nbsp;&nbsp;</span><input type="text" name="amount" style="width: 80%; border: 1px solid #BDBDBD; outline: none;"><br>
		</div>
		<textarea name="content" id="content" style="width: 95%; height: 400px;">${dto.content}</textarea> <br>
		<span style="font-weight: bold;">영양성분표시&nbsp;</span><input type="text" name="pdNutrient" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산&nbsp;&nbsp;&nbsp;&nbsp;지&nbsp;&nbsp;</span><input type="text" name="pdArea" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">보&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;방&nbsp;&nbsp;법&nbsp;</span><input type="text" name="pdStMethod" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">식&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;유&nbsp;&nbsp;형&nbsp;</span><input type="text" name="pdType" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br>
		<span style="font-weight: bold;">상품원재료명&nbsp;</span><input type="text" name="pdRawName" style="width: 20%; border: 1px solid #BDBDBD; outline: none;"><br>
		
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
<script>
    var holder = document.getElementById('holder');
    var progress = document.getElementById('uploadprogress');
    //holder위에 파일을 끌어다 위에 대 면 감지후 실행 
    holder.ondragover = function () { this.className = 'hover'; return false; };
    //드래그가 끝나면?
    holder.ondragend = function () { this.className = ''; return false; };
    //드롭!!
    holder.ondrop = function (e) {
    	//클래스 네임 초기화
        this.className = '';
    	//필수라는데 먼지는 모름
        e.preventDefault();
    	// 밑에 파일미리보기 함수 실행
        readfiles(e.dataTransfer.files);
    }
 
     
    function readfiles(files) {
        // 파일 읽어들이는 함수
        previewfile(files[0]);
		//파일 업로드시 포맷??
        var formData = new FormData();
        formData.append('upload', files[0]);
		//XML httpRequest 객체 생성
        var xhr = new XMLHttpRequest();
		//해당경로의 devnull.php를 연다?
        xhr.open('POST', './devnull.php');
		//onprogress 브라우저가 미디어 테이터를 가져올때 발생하는 이벤트
        xhr.upload.onprogress = function (event) {
            if (event.lengthComputable) {
                var complete = (event.loaded / event.total * 100 | 0);
                progress.value = progress.innerHTML = complete;
            }
        }
		//사진을 보여준다????
        xhr.send(formData);
    }
     
    function previewfile(file) {
    	//파일리더 선언
        var reader = new FileReader();
    	//reader가 onload 시 
        reader.onload = function (event) {
    		//이미지 객체 생성
            var image = new Image();
    		//이미지 주소 입력
            image.src = event.target.result;
    		//이미지 가로 크기 설정
            image.width = 660; // a fake resize
            image.height = 495;
            //홀더밑에 이미지를 뿌려줌
            holder.appendChild(image);
        };
 		//데이터의 url을 읽어온다??
        reader.readAsDataURL(file);
    }
</script>