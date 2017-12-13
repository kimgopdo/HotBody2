<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
var arr = new Array();
var idx=0;

function sendOk() {
	var mode = "${mode}";
	
	var f = $("form[name=missionForm]").serialize();
	
	if(mode=='created')
		var url="<%=cp%>/mission/created";
	else if(mode=='update')
		var url="<%=cp%>/mission/update";
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("등록완료");
				//location.href="<%=cp%>/mission/list";
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
	
}

function addBox(date) {
	arr[idx++]=date;
	
	var find=0;
	
	for(var i=0;i<arr.length;i++){
		if(arr[i]==date)
			find++;
	}
	var row="<tr height='55' style='padding-top:0px;'>";
	row+="<td width='100' style='font-weight: bold;' align='center'>&nbsp;</td>";
	row+="<td><input type='text' name='mission."+date+"."+find+"' style='width: 90%; height: 35px;' value=''>";
	row+="<span>";
	row+="<img style='width: 18px; height: 20px; margin-left: 19px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/minus2.png' onclick='removeBox(this)'>";
	row+="</span></td></tr>";

	$("#addTr"+date).append(row);
}

function removeBox(p) {
	$(p).closest("tr").remove();
}

</script>
 
<div class="body-container" style="width: 1000px; margin: 100px auto;">
<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">미션 등록</div>
<div style="font-size: 18px; width: 1000px; margin: 30px auto 20px; font-weight: 700; color: #666666;">${dto.className}(${dto.onperiod}일 과정)</div>
<div style="width:1000px; height:1px; border-bottom: 2px solid #666666;"></div>

<form id="missionForm" action="" method="post" name="missionForm">

	<c:forEach var="date" items="${day}">
		<c:if test="${date%2=='0'}">
		<table id="addTr${date}" style="width: 1000px; background-color:#ffffff; margin: 0 auto; border-collapse: collapse; border-spacing: 0;">
		</c:if>
		<c:if test="${date%2=='1'}">
		<table id="addTr${date}" style="width: 1000px; background-color:rgb(241,241,241); margin: 0 auto; border-collapse: collapse; border-spacing: 0;">
		</c:if> 
			<tr id="dateTr${date}" height="70" style="margin-bottom: 20px;">
				<td width="100" style="font-weight: bold;" align="center">${date}일차</td>
				<td>
					<input type="text" name="mission.${date}.0" style="width: 90%; height: 35px;" value="">
					<img id="addBox${date}" style="width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;" src="<%=cp%>/resource/images/plus2.png" onclick="addBox(${date});">
				</td>
			</tr>
		</table>
	</c:forEach>
	 
	<div style="width:1000px; height:1px; border-bottom: 2px solid #666666;"></div>
	<div style="width: 1000px; margin: 20px auto 0;" align="center">
	<button type="button" class="btn-default02" onclick="sendOk();">미션등록완료</button>
	<button type="button" class="btn-default02" onclick="#">등록취소</button>
	<input type="hidden" name="classNum" value="${dto.classNum}">
	<c:if test="${mode=='update'}">
	</c:if>
	</div>
</form>
</div>
</body>