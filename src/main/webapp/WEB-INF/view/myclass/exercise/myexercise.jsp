<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function send(f){
	f.submit();
}
function lookExe(num){
	var dlg = $("#readExer").dialog({
		  modal: true,
		  buttons: {
		       " 확인 " : function() {
		    	   $(this).dialog("close");
		        },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		        }
		  },
		  height: 750,
		  width: 750,
		  title: "운동상세 보기",
		  open: function(){
			  $(this).load("<%=cp%>/myclass/exercise/readexer?num="+num);  
		  },
		  close: function() {
		  }
	});	
}
function lookInfo(num){
	var dlg = $("#readInfo").dialog({
		  modal: true,
		  buttons: {
		       " 확인 " : function() {
		    	   $(this).dialog("close");
		        },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		        }
		  },
		  height: 750,
		  width: 750,
		  title: "정보상세 보기",
		  open: function(){
			  $(this).load("<%=cp%>/myclass/exercise/readinfo?num="+num);
		  },
		  close: function() {
		  }
	});		
}
</script>


<div class="body-container" style="width: 800px; margin: 50px auto;">

<div class="body-title">
        <h3><span style="font-family: Webdings">2</span>오늘의 운동</h3>
</div>


<table style="width: 800px; margin: 20px auto 0; margin-bottom: 100px; border-collapse: collapse; border-spacing: 0">

	<tr height="40">
		<td align="left" colspan="7">
			${dataCount}개(${page}/${total_page}페이지)
		</td>
	</tr>
	
	<tr>
		<td>
		<form name="searchList" method="post" action="<%=cp%>/myclass/exercise/myexercise" style="margin-bottom:35px;">
			<select name="searchKey" style="width: 80px; height: 30px;">
				<option value=edate>날짜</option>
			</select>	
			<input type="text" name="searchValue" style="width: 15%; height: 30px;">
			<input type="text" style="display:none;">
			
			<button type="button" onclick="send(this.form);" class="btn-search" style="width: 60px; height: 30px;">검색</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/member/myclass'" style="float: right; width: 100px; height: 30px;">메뉴선택창</button>	
		</form>
		</td>
	</tr>

	<c:forEach var="dto" items="${list}">
	<tr height="70" align="center" style="border-top: 2px solid #666666; margin-top: 30px;">
		<td style="font-size: 35px; width: 100px; font-weight: bold; color: #666666;">${sessionScope.member.userId}님의 ${dto.edate} 운동  </td>
	</tr>
	<tr height="50">
		<td style="font-size: 25px; width: 100px; color: #666666;">오늘의 운동 : ${dto.exerciseName}<img src="<%=cp%>/resource/images/click.png" style="height: 25px; cursor: pointer;" onclick="lookExe(${dto.exerciseNum});"></td>
	</tr>
	<tr height="50">
		<td style="font-size: 25px; width: 100px; color: #666666;">오늘의 건강상식 : ${dto.subject}<img src="<%=cp%>/resource/images/click.png" style="height: 25px; cursor: pointer;" onclick="lookInfo(${dto.infoNum});"></td>	
	</tr>
	<tr height="35">
		<td style="font-size: 15px; width: 50px; color: #0080FF; font-weight: bold;">오늘도 화이팅 하세요!</td>
	</tr>
	<tr height="10px;"></tr>
	</c:forEach>
	
	<tr height="50" align="center">
		<td>${paging}</td>
	</tr>
</table>
<div id="readExer" style="display: none;"></div>
<div id="readInfo" style="display: none;"></div>
</div>