<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
th {
    text-align: center;
}
</style>
<script type="text/javascript">
function deleteOk(num) {
	if(! confirm("삭제하시겠습니까?")){
		return;
	}
	var f = {num:num};
	var url="<%=cp%>/admin/cprogram/delete?num="+num;
		
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("수정완료");
				location.href="<%=cp%>/admin/cprogram/list";
			}
		}
	    ,error:function(e) {
	    	alert("수정실패");
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
		location.href="<%=cp%>/admin/dietClass/deleteFile?num=${dto.programNum}"
	}
}

</script>
<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 40px;">
    <div style="font-size: 40px; width: 1000px;font-weight: bold; color: #666666;">프로그램 리스트</div>
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
		
		<tr height="40">
			<td align="left" style="font-weight: bold; font-size: 16px; color: tomato;">
				총 ${dataCount}개
			</td>
			<td colspan="3" align="right">
			<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/cprogram/created';" style="width: 120px;">프로그램 등록</button>
			</td>
		</tr>
		
		<tr height="35" style="background: #666666; color: #ffffff;" align="center">
			<th width="100">이미지</th>
			<th width="200">프로그램명</th>
			<th>프로그램 내용</th>
			<th width="120"></th>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr height="120" align="center" style="margin: 5px 0;">
				<td width="100">
					<img src="<%=cp%>/uploads/cProgram/${dto.saveFileName}">
				</td>
				<td width="200">${dto.programName}</td>
				<td align="left">${dto.programContent}</td>
				<td width="100">
					<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/cprogram/update?num=${dto.programNum}';">수정</button>
					<button type="button" class="btn02" onclick="deleteOk(${dto.programNum})">삭제</button>
				</td>
			</tr>
		</c:forEach>
		
		<tr height="60" align="center">
			<td colspan="6">${paging}</td>
		</tr>
	</table>
</div>