<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
p {margin: 10px;}
</style>

<script type="text/javascript">
function deleteOk(num,type) {
	
	var f = {num : num, type:type};
	
	var url="<%=cp%>/dietClass/deleteClass";
		
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("등록완료");
				location.href="<%=cp%>/dietClass/list?type="+type;
			}
		}
	    ,error:function(e) {
	    	alert("Error입니다");
	    	console.log(e.responseText);
	    }
	});
}

function payGo(num,type) {
	var uid="${sessionScope.member.userId}";
   	if(! uid) {
      modalFormLogin();
      return;
   	}
   	location.href="<%=cp%>/dietClass/payment?num="+num+"&type="+type;
}
</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">

	<div style="margin: 20px 0px;">
	<a href="<%=cp%>/dietClass/onList" style="color: #333333;"><img style="width: 30px;" src="<%=cp%>/resource/images/dano_arrow.png"></a>
	</div>
    <p style="font-size: 45px; font-weight: bold; padding: 15px 0px; margin-left: 0;">${dto.className}</p>
    
	<div style="width: 650px; height: 370px; float: left; overflow: hidden;">
		<img style="vertical-align: middle; width: 95%;" src="<%=cp%>/uploads/dietClass/${dto.saveFileName}">
	</div>
	
	<div id="classinfo" style="float: left; font-size: 16px; width: 350px; height: 260px;">
		<p style="font-weight: bold; font-size: 19px; padding-top: 2px;">클래스 기간</p>
		<c:if test="${dto.classType==0}">
		<p style="color: #666666;">${dto.onperiod}일</p>
		</c:if>
		<c:if test="${dto.classType==1}">
		<p style="color: #666666;">${dto.startDate}<br>~ ${dto.endDate}</p>
		</c:if>

		<p style="font-weight: bold; font-size: 19px; padding-top: 2px;">멘토</p>
		<c:if test="${dto.classType==0}">
		<p style="color: #666666;">${dto.mento} 님</p>
		</c:if>
		<c:if test="${dto.classType==1}">
		<p style="color: #666666;">${dto.coach} 님</p>
		</c:if>
		
		<p style="font-weight: bold; font-size: 19px; padding-top: 2px;">운동강도</p>
		<img style="width: 100px; margin-left: 7px;" src="<%=cp%>/resource/images/level${dto.cllevel}.PNG">
   	</div>
   	
	<div style="vertical-align: bottom; float: left; width: 350px;">
		<p style="font-weight: bold; font-size: 30px; padding-bottom: 20px;" align="left">${dto.showTuition}</p>
		
		<!-- 
		
		밑에 if문 두개 바꾸ㅓ야한다 나중에
		
		 -->
		 
		<c:if test="${sessionScope.member.userId=='admin'}">
    	<button id="paymentBtn" type="button" style="width: 45%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="javascript:location.href='<%=cp%>/dietClass/update?num=${dto.classNum}&type=${dto.classType}';"> 클래스 수정 </button>
    	<button id="paymentBtn" type="button" style="width: 45%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="deleteOk(${dto.classNum},${dto.classType});"> 클래스 삭제 </button>
    	</c:if>
    	<c:if test="${sessionScope.member.userId!='admin'}">
    	<button id="paymentBtn" type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="payOk();">수강 신청하기</button>
    	</c:if>
	</div>

	<div style="width: 1000px; float: left;">
		<hr>
	</div>
	
	<div style="width: 1000px;">
		<p style="font-size: 18px; font-weight: bold;">프로그램 구성</p>
		<table style="line-height: 2em;">
          	<c:forEach var="pro" items="${cProgram}">
          		<tr style="margin: 10px 0;">
          			<td width="60" align="center">
          			<img style="width: 50px; height: 50px;" src="<%=cp%>/uploads/cProgram/${pro.saveFileName}">
          			</td>
          			
          			<td>
          				<p style="font-weight: bold;">${pro.programName}</p>
          				<p>${pro.programContent}</p>
          			</td>
          		</tr>
          	</c:forEach>
	    </table>
	</div>
	
</div>
