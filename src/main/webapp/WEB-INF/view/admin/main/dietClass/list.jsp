<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function deleteOk(num,type) {
	
	if(! confirm("삭제하시겠습니까?")){
		return;
	}
	var f = {num : num, type:type};
	
	var url="<%=cp%>/admin/dietClass/deleteClass";
		
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("삭제완료");
				location.href="<%=cp%>/admin/dietClass/list";
			}
		}
	    ,error:function(e) {
	    	alert("Error입니다");
	    	console.log(e.responseText);
	    }
	});
}
</script>
<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 50px;">
	<div style="font-size: 40px; width: 1000px;font-weight: bold; color: #666666;">클래스 리스트</div>
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
		
		<tr height="40">
			<td align="left" style="font-weight: bold; font-size: 16px; color: tomato;">
				총 ${count}개
			</td>
			<td colspan="3" align="right">
			
			<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/dietClass/created';" style="width: 120px;">클래스 등록</button>
			</td>
		</tr>
		
		<tr height="35" style="background: #666666; color: #ffffff;" align="center">
			<th width="200">클래스명</th>
			<th width="100">클래스유형</th>
			<th>클래스 내용</th>
			<th width="150"></th>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr height="120" align="center" style="margin: 5px 0; border-bottom: 1px solid #e6e6e6;">
				<td width="200"><a href="<%=cp%>/admin/dietClass/article?num=${dto.classNum}&type=${dto.classType}" style="color: #333333;">${dto.className}</a></td>
				<c:if test="${dto.classType==0}">
					<td width="100">온라인</td>
				</c:if>
				<c:if test="${dto.classType==1}">
					<td width="100">오프라인</td>
				</c:if>
				<td align="left">${dto.classGoal}</td>
				<td width="150" align="right">
					<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/dietClass/update?num=${dto.classNum}&type=${dto.classType}';">수정</button>
					<button type="button" class="btn02" onclick="deleteOk(${dto.classNum},${dto.classType})">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
