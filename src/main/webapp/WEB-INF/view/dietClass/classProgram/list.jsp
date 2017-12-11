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
	
	var f = {num:num};
	var url="<%=cp%>/cprogram/delete?num="+num;
		
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("수정완료");
				location.href="<%=cp%>/cprogram/list";
			}
		}
	    ,error:function(e) {
	    	alert("수정실패");
	    	console.log(e.responseText);
	    }
	});
}
function setUpdate(num) {
	var url="<%=cp%>/cprogram/update?num="+num;
		
	var f = "num="+num;
	alert(url);
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			alert("dkssaakd");
			var updateDto = data.updateDto;
			alert(updateDto.programName);
			//$("#myModal").children().children().children().children().children("input[name=programName]").html("hello");
		}
	    ,error:function(e) {
	    	alert("수정실패");
	    	console.log(e.responseText);
	    }
	});
}
</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">
    <div style="height: 50px;"></div>
	<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">프로그램 리스트</div>
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
		
		<tr height="40">
			<td align="left" style="font-weight: bold; font-size: 16px; color: tomato;">
				총 ${dataCount}개${updateDto.programName}
			</td>
			<td colspan="3" align="right">
			<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/cprogram/created';" style="width: 120px;">프로그램 등록</button>
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
					<button type="button" class="btn02" style="width: 50px;" data-toggle="modal" data-target="#myModal" onclick="setUpdate(${dto.programNum})">수정</button>
					
					<!-- Modal -->
				 	<div class="modal fade" id="myModal" role="dialog">
				  	<div class="modal-dialog modal-lg">
					    <div class="modal-content" style="top: 100px; left:-200px; width: 1000px;">
					    <div class="modal-header">
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						    <h4 class="modal-title">프로그램 수정</h4>
					    </div>
					   
					    <div class="modal-body" style="height: 400px; overflow-y: scroll;">
					    <table style="width: 800px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
						<tr height="40">
							<td width="100">프로그램명</td>
							<td>
								<input type="text" name="programName" style="width: 98%; height: 35px;" value="${updateDto.programName}">
							</td>
						</tr>
						<tr height="10px;"></tr>
						
						<tr height="40">
							<td width="100" valign="top">프로그램 내용</td>
							<td>
								<textarea style="width: 98%;" rows=6; name="programContent">${updateDto.programContent}</textarea>
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
						
						<tr height="40">
							<td width="100">첨부된파일</td>
							<td>
								${updateDto.originalFileName}
								<c:if test="${not empty updateDto.saveFileName}">
									&nbsp;<a href="javascript:deleteFile();">
									<img src="<%=cp%>/resource/images/close_icon.png">
									</a>
								</c:if>
							</td>
						</tr>
						<tr height="10px;"></tr>
						</table>
					    </div>
					        
				        <div class="modal-footer">
				          <button type="button" class="btn-sm" style="background: #ffffff;" data-dismiss="modal">수정</button>
				        </div>
					        
				        </div>
				    </div>
				  </div>
					<button type="button" class="btn02" onclick="deleteOk(${dto.programNum})" style="width: 50px;">삭제</button>
				</td>
			</tr>
		</c:forEach>
		
		<tr height="60" align="center">
			<td colspan="6">${paging}</td>
		</tr>
	</table>
</div>