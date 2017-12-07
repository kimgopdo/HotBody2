<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function on(num) {
	$("#ct"+num).mouseover(function (e){
        $("#ctd"+num).show();
    });
    
    $("#ct"+num).mouseout(function (e){
        $("#ctd"+num).hide();
    });
}
function classNotice() {
	swal("Write something here:", {
		  content: "input",
		})
		.then((value) => {
		  swal(${value});
		});
}
function articleGo(num) {
	location.href="<%=cp%>/dietClass/article?num="+num;
}
</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">

	<c:forEach var="dto" items="${onClass}">
    <table id="ct${dto.classNum}" onmouseover="on(${dto.classNum});" style="width: 1000px; height:350px; border-spacing: 0; border-collapse: collapse; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc; margin: 20px 0;">
    <tr>
    	<td style="width: 280px; overflow: hidden;">
    	<img align="right" style="width:100%; height: 355px;" src="<%=cp%>/uploads/dietClass/${dto.saveFileName}">
    	</td>
    	<td valign="top" style="padding: 35px 20px;" width="300px;">
    	<p><b style="font-size: 30px;">${dto.className}</b></p>
    	<b style="color: #ff6699; font-size: 20px;">${dto.classGoal}</b><br><br>
    	<span><b style="color: #333333;">${dto.classGoalD}</b></span>
    	<br>
    	<div id="ctd${dto.classNum}" style="display: none; margin: 20px;">
    		<span style="color: #666666; cursor: pointer;" onclick="articleGo(${dto.classNum})">자세히 보러가기>></span>
    	</div>
    	</td>
    	<td style="background: #e3e3e3; width: 250px;" align="center">
	    	<div align="center" style="height: 270px;">
	    		<table style="width: 90%; margin: 35px 15px; line-height: 2em; resize: none;">
		    		<tr>
		    			<td>
		    			<%-- 
		    				<c:if test="#">
		    				<span style="background: #333333; color: #ffffff; font-size: 20px;">마감</span>
		    				</c:if>
		    			 --%>
		    				<span style="background: #ff6600; color: #ffffff; font-size: 20px;">진행중</span>
		    			</td>
		    		</tr>
		    		<tr height="20px;"></tr>
		    		<tr>
		    			<th width="35%">프로그램 구성</th>
		    			<td align="left" style="padding-left: 5px;"></td>
		    		</tr>
		    		
		    		<!-- 
		    			c:if필요한부분
		    		 -->
		    		<tr>
		    			<th width="35%"></th>
		    			<td align="left" style="padding-left: 5px;">${cpro.programName}</td>
		    		</tr>
		    		
		    		<tr>
		    			<th width="35%">운동강도</th>
		    			<td align="left" style="padding-left: 5px;">${dto.cllevel}</td>
		    		</tr> 
		    		<tr>
		    			<th width="35%">수강기간</th>
		    			<td align="left" style="padding-left: 5px;">${dto.onperiod}</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">수강료</th>
		    			<td align="left" style="padding-left: 5px;">${dto.tuition}</td>
		    		</tr>
	    		</table>
	    	</div>
	   		<div style="vertical-align: bottom;">
	   		<!-- 
	   		<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="classNotice();">클래스 알림받기</button>
	    	 -->
	    	<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="#">수강 신청하기</button>
	   		</div>
    	</td>
    </tr>
    </table>
    </c:forEach>
    </div>
	