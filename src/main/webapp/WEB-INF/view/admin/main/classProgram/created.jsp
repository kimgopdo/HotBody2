<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
function sendOk() {
	var uid="${sessionScope.member.userId}";
   	if(! uid) {
   	location.href="<%=cp%>/member/login";
      return;
   	}
	var mode = "${mode}";
	
	var f = document.pForm;
	var formData=new FormData(f);
	if(mode=='created')
		var url="<%=cp%>/admin/cprogram/insert";
	else if(mode=='update')
		var url="<%=cp%>/admin/cprogram/updateOk";
		
	$.ajax({
		type:"post"
		,url:url
		,processData: false
        ,contentType: false
		,data: formData
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("등록완료");
				location.href="<%=cp%>/admin/cprogram/list";
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
	
}
function fileChange() {
	var upload=document.getElementById("upload").value;
	document.getElementById("fileName").value=upload.substring(0,upload.lastIndexOf("."));
}
function deleteFile() {
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		location.href="<%=cp%>/admin/cprogram/deleteFile?num=${dto.programNum}"
	}
}
</script>
 

<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 40px;">
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">프로그램 등록</div>
<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>

<form id="pForm" action="" method="post" name="pForm" enctype="multipart/form-data">
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="40">
		<td width="100">프로그램명</td>
		<td>
			<input type="text" name="programName" style="width: 98%; height: 35px;" value="${dto.programName}">
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<tr height="40">
		<td width="100" valign="top">프로그램 내용</td>
		<td>
			<textarea style="width: 98%;" rows=6; name="programContent">${dto.programContent}</textarea>
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
		        <label class="btn02" for="upload">파일첨부</label>
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
	
	<c:if test="${mode=='update'}">
	<tr height="40">
		<td width="100">첨부된파일</td>
		<td>
			${dto.originalFileName}
			<c:if test="${not empty dto.saveFileName}">
				&nbsp;<a href="javascript:deleteFile();">
				<img src="<%=cp%>/resource/images/close_icon.png">
				</a>
			</c:if>
		</td>
	</tr>
	</c:if>
	<tr height="10px;"></tr>
	</table>
	
	<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
	<div style="width: 1000px; margin: 20px auto 0;" align="center">
	<button type="button" class="btn-default02" onclick="sendOk();">등록</button>
	<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/admin/cprogram/list';">등록취소</button>
	<c:if test="${mode=='update'}">
		<input type="hidden" name="programNum" value="${dto.programNum}">
		<input type="hidden" name="saveFileName" value="${dto.saveFileName}">
		<input type="hidden" name="originalFileName" value="${dto.originalFileName}">
	</c:if>
	</div>

</form>
</div>
</body>