<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: "맑은 고딕";
	font-size: 14px;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box
}

:after, :before {
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

.form-control[readonly], fieldset[disabled] .form-control {
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
	width: 150px;
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
	width: 100px;
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

<script type="text/javascript"
	src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

function check() {
	var f = document.boardForm;
	
	if(!f.moName.value){
		alert("모꼬지명을 입력하세요.");
		f.moName.focus();
		return false;
	}
	
	var str=f.moIntro.value;
	if(!str){
		alert("모꼬지소개를 입력하세요.");
		f.moIntro.focus();
		return false;
	}
	
	str=f.moContent.value;
	if(!str || str=="<p>&nbsp;</p>") {
		alert("설명을 입력하세요");
		f.moContent.focus();
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
		location.href="<%=cp%>/notice/deleteFile?&geNum=${dto.geNum}"
	}
}


</script>
</head>
<body style="overflow: hidden; height: 1100px;">
	<div style="height: 50px;"></div>
	<div
		style="font-size: 40px; width: 700px; margin: 20px auto 0; font-weight: bold; color: #666666;">벙개 등록하기</div>
	<div
		style="width: 700px; height: 1px; margin: 20px auto 0; border-bottom: 2px solid #666666;"></div>

	<form action="<%=cp%>/mocojee/${mode}" method="post" name="boardForm"
		enctype="multipart/form-data" onsubmit="return submitContents(this);">
		<table
			style="width: 700px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">

			<tr height="40">
				<td width="100">개설자</td>
				<td>${sessionScope.member.userId}</td>
			</tr>

			<tr height="40">
				<td width="100">벙개명</td>
				<td><input type="text" name="moName"
					style="width: 98%; height: 35px;" value="${dto.mosubName}"></td>
			</tr>
			
			<tr height="10px;"></tr>
			

			<tr height="40px;">
				<td width="100" valign="top">최대 참석자수</td>
				<td><input type="number" name="quantity" min="1" max="100" style="margin-bottom: 10px;"></td>
			</tr>

			
			<tr height="10px;"></tr>

			<tr height="40">
				<td width="100" valign="top">상세 설명</td>
				<td><textarea style="width: 98%;" rows=10; name="moContent"
						id="moContent">${dto.moContent}</textarea></td>
			</tr>
			
			<div>
              <h4 class="md-subhead">Standard date picker</h4>
              <mdp-date-picker mdp-placeholder="Date" ng-model="currentDate"></mdp-date-picker>
            </div>


			<tr height="10px;"></tr>

			<tr height="40">
				<td width="100">파일등록</td>
				<td>
					<div class="form-group form_file">
						<input id="fileName" class="form-control form_point_color01"
							type="text" title="첨부된 파일명" readonly style="width: 430px">
						<span class="file_load"> <input type="file" id="upload"
							name="upload" onchange="fileChange();">
							<button type="button" class="btn-sm"
								style="background: #ffffff; padding: 5px; margin-left: 5px;">파일첨부</button>
						</span>
					</div>
				</td>
			</tr>

			<tr>
				<td></td>
				<td style="color: #666666; font-size: 13px;">(최대 10MB이하의 파일이 등록
					가능합니다.)</td>
			</tr>
			


			<tr height="10px;"></tr>

			<c:if test="${mode=='u_mocojee'}">
				<tr height="40">
					<td width="100">첨부된 파일</td>
					<td>${dto.moImage} <c:if test="${not empty dto.moImage}">
			&nbsp;<a href="javascript:deleteFile();"> <img
								src="<%=cp%>/resource/images/close_icon.png">
							</a>
						</c:if>
					</td>
				</tr>
			</c:if>

		</table>
		<div
			style="width: 700px; height: 1px; margin: 20px auto 0; border-bottom: 2px solid #666666;"></div>
		<div style="width: 700px; margin: 20px auto 0;" align="center">
		
			<button type="submit" class="btn-default02">${mode=='u_mocojee'?'수정완료':'등록하기'}</button>

			<button type="button" class="btn-default02"
				onclick="javascript:location.href='<%=cp%>/mocojee/list_mocojee';">등록취소</button>
			<c:if test="${mode=='u_mocojee'}">
				<input type="hidden" name="geNum" value="${dto.geNum}">
				<input type="hidden" name="moImage" value="${dto.moImage}">
			</c:if>
		</div>

		<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "moContent",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					fOnBeforeUnload : function() {
						//alert("아싸!");
					}
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator : "createSEditor2"
			});

			function pasteHTML() {
				var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
				oEditors.getById["moContent"].exec("PASTE_HTML", [ sHTML ]);
			}

			function showHTML() {
				var sHTML = oEditors.getById["moContent"].getIR();
				alert(sHTML);
			}

			function submitContents(elClickedObj) {
				oEditors.getById["moContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

				try {
					// elClickedObj.form.submit();
					return check();
				} catch (e) {
				}
			}

			function setDefaultFont() {
				var sDefaultFont = '돋움';
				var nFontSize = 24;
				oEditors.getById["moContent"].setDefaultFont(sDefaultFont,
						nFontSize);
			}
			

			$('#fromDate').datetimepicker({
				  language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
				  pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
				  defalutDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
				});

				$('#toDate').datetimepicker({
				  language : 'ko',
				  pickTime : false,
				  defalutDate : new Date()
				});	
			
		</script>
	</form>
</body>
</html>