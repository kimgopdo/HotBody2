<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="body-container" style="width:1100px; padding-left: 20px; padding-top: 50px;">

	<div style="margin: 20px 0px;">
	<a href="<%=cp%>/admin/dietClass/list"><img style="width: 30px;" src="<%=cp%>/resource/images/dano_arrow.png"></a>
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
	</div>

	<div style="width: 1000px; float: left;">
		<hr>
	</div>
	
	
	<div style="width: 1000px;">
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
