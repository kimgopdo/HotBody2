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

.aspect { width: 190px; height: 218px; }

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}
</style>

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

function check() {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		modalFormLogin();
		return;
	}
	
	var f = document.reviewForm;
	
	var str=f.reviewContent.value;
	if(!str){
		alert("상품 후기를 작성해 주세요.");
		f.reviewContent.focus();
		return;
	}
	
	f.action="<%=cp%>/hotShop/review_${mode}";
	f.submit();

}

function fileChange() {
	var upload=document.getElementById("upload").value;
	document.getElementById("fileName").value=upload.substring(0,upload.lastIndexOf("."));
}

function deleteFile() {
	if(confirm("첨부된 이미지를 삭제하시겠습니까?")){
		location.reload();
	}
}

$(function(){
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    
	    var n=0;
	    $( ".star_rating a").each(function(){
	    	if($(this).hasClass("on")) n++;
	    });
	    $("#starInput").val(n);
	    
	    return false;
	});
});

</script>
</head>
<body style="overflow: hidden;height: 1100px;">
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">구매 상품 후기 작성</div>
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form method="post" name="reviewForm" enctype="multipart/form-data">
<table style="width: 700px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">


<tr height="40">
	<td width="100">상품명</td>
	<td>
		<input type="text" name="pdName" style="width: 98%; height: 35px; outline: none;" readonly="readonly" value="${dto.pdName}">
	</td>
</tr>

<tr height="40">
	<td width="100">별점</td>
	<td align="left">
		<p class="star_rating">
		    <a href="#">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		</p>
		<input type="hidden" name="star" id="starInput" value="0">
	</td>
</tr>

<tr height="40">
	<td width="100" valign="top">상품 후기</td>
	<td>
		<textarea style="width: 98%; outline: none;" rows=10; name="reviewContent" id="reviewContent" placeholder=" 후기를 작성해 주세요."></textarea>
	</td>
</tr>


<tr height="10px;"></tr>

<tr height="40">
		<td width="100">이미지 등록</td>
		<td align="left" style="padding-left: 6px;">
		<div class="form-group form_file">
		  <input id="fileName" class="form-control form_point_color01" type="text" readonly style="width:430px">
		  <span class="file_load">
		        <input type="file" id="upload" name="upload" onchange="fileChange();">
		        <button type="button" style="font-weight: bold; color: #8C8C8C; margin-top: 3px; background: white; border: 1px solid #999999; border-radius: 3px; width: 90px; height: 30px;">이미지 첨부</button>
		    </span>
		</div>
		</td>
	</tr>

<tr>
	<td></td>
	<td style="color: #666666; font-size: 13px; padding-left: 6px;" align="left">
		(이미지의 사이즈가 자동으로 조절되어 등록됩니다.)
	</td>
</tr>

<tr height="10px;"></tr>
	
<c:if test="${mode=='update'}">
<tr height="40">
	<td width="100">첨부된 이미지</td>
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
<div style="width:700px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
<div style="width: 700px; margin: 20px auto 0;" align="center">
<button type="button" style="font-weight: bold; color: #8C8C8C; margin-top: 3px; background: white; border: 1px solid #999999; border-radius: 3px; width: 70px; height: 30px;" onclick="check();" >${mode=='created'?'등록하기':'수정완료'}</button>
<button type="button" style="font-weight: bold; color: #8C8C8C; margin-top: 3px; background: white; border: 1px solid #999999; border-radius: 3px; width: 70px; height: 30px;" onclick="javascript:location.href='<%=cp%>/';">${mode=='created'?'등록취소':'수정완료'}</button>
<c:if test="${mode=='update'}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="reviewCode" value="${dto.reviewCode}">
	<input type="hidden" name="Image" value="${dto.Image}">
	<input type="hidden" name="query" value="${query}">
</c:if>
</div>

</form>
</body>
</html>