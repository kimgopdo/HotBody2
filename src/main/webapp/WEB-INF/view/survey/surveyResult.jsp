<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=cp%>/resource/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/plugins/jqplot.pieRenderer.min.js"></script>
<style type="text/css">
.graph{
	
}
</style>

<script type="text/javascript">

$(function(){

    //1번째 입력값 (그려진 영역의 id값)
    //2번째 입력값 (그래프내에 들어갈 데이터 값)
	var will = "${will}"*10;
	var afford = "${afford}"*10;
	var pro = "${pro}"*10;
	var habits = "${habits}"*10;
	$.jqplot ('graph', [[['전문성', pro], ['의지', will], ['시간적여유', afford], ['식습관', habits]]], 
        { 
          seriesDefaults: {
            //원형으로 렌더링
            renderer: $.jqplot.PieRenderer,
            //원형상단에 값보여주기(알아서 %형으로 변환)
            rendererOptions: {
              showDataLabels: true
            }
          },
          //우측 색상별 타이틀 출력
          legend: { show:true, location: 'e' }
        }
	);
});

function on(num) {
	$("#ct"+num).mouseover(function (e){
        $("#ctd"+num).show();
    });
    
    $("#ct"+num).mouseout(function (e){
        $("#ctd"+num).hide();
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
function articleGo(num) {
	location.href="<%=cp%>/dietClass/articleOn?num="+num;
}

</script>
<div class="body-container" style="width: 1100px; margin: 100px auto;" align="center">
	<div style="width: 1100px; font-size: 30px; font-weight: bold;" align="center">회원님의 분석결과</div>
	<div style="width:1100px; height:150px; font-size:20px; margin-top:50px; padding: 20px;" align="center">
	<table style="width: 1000px;">
	<tr style="height: 50px; background: skyblue; color: #ffffff; text-align: center;">
		<td>BMI지수</td>
		<td>기초대사량</td>
		<td>정상체중</td>
		<td>상태</td>
	</tr>
	<tr style="text-align: center; height: 50px;">
		<td>${bmi}</td>
		<td>${bbody} Kcal</td>
		<td>${standard} Kg</td>
		<td>${msg}</td>
	</tr>
	</table>
	</div>
	<div class="graph" id="graph" style="width:450px; height:450px; margin-top: 20px;"></div>
	<div id="recommand" style="width: 1100px; margin-top: 100px;">
		<c:forEach var="dto" items="${recommandList}">
    	<table id="ct${dto.classNum}" onmouseover="on(${dto.classNum});" style="width: 1000px; height:420px; border-spacing: 0; border-collapse: collapse; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc; margin: 20px 0;">
    	<tr>
    	<td style="height: 425px; width: 280px; overflow: hidden;">
    	<img align="right" style="height: 100%; width: 335px;" src="<%=cp%>/uploads/dietClass/${dto.saveFileName}">
    	</td>
    	<td valign="top" style="padding: 35px 20px;" width="300px;">
    	<p><b style="font-size: 30px;">${dto.className}</b></p>
    	<b style="color: #ff6699; font-size: 20px;">${dto.classGoal}</b><br><br>
    	<br>
    	<div id="ctd${dto.classNum}" style="display: none; margin: 20px;">
    		<span style="color: #1abc9c; cursor: pointer; font-size: 16px; font-weight: bold;" onclick="javascript:location.href='<%=cp%>/dietClass/article?num=${dto.classNum}&type=${dto.classType}';">자세히 보러가기>></span>
    	</div>
    	</td>
    	<td style="background: #e3e3e3; width: 250px; color: black;" align="center">
	    	<div align="center" style="height: 340px;">
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
		    		<c:if test="${dto.classType==0}">
		    		<tr>
		    			<th width="35%">멘토</th>
		    			<td align="left" style="padding-left: 5px;">${dto.mento} 님</td>
		    		</tr>
		    		</c:if>
		    		<c:if test="${dto.classType==1}">
		    		<tr>
		    			<th width="35%">코치</th>
		    			<td align="left" style="padding-left: 5px;">${dto.coach} 님</td>
		    		</tr>
		    		</c:if>
		    		<tr>
		    			<th width="35%">운동강도</th>
		    			<c:if test="${dto.cllevel==1}">
		    			<td align="left" style="padding-left: 5px;">상</td>
		    			</c:if>
		    			<c:if test="${dto.cllevel==2}">
		    			<td align="left" style="padding-left: 5px;">중</td>
		    			</c:if>
		    			<c:if test="${dto.cllevel==3}">
		    			<td align="left" style="padding-left: 5px;">하</td>
		    			</c:if>
		    		</tr> 
		    		<c:if test="${dto.classType==0}">
		    		<tr>
		    			<th width="35%">수강기간</th>
		    			<td align="left" style="padding-left: 5px;">${dto.onperiod}일</td>
		    		</tr>
		    		</c:if>
		    		<c:if test="${dto.classType==1}">
		    		<tr>
		    			<th width="35%">수강기간</th>
		    			<td align="left" style="padding-left: 5px;">${dto.startDate}<br>~ ${dto.endDate}</td>
		    		</tr>
		    		</c:if>
		    		
		    		<c:if test="${dto.classType==1}">
		    		<tr>
		    			<th width="35%">수강시간</th>
		    			<td align="left" style="padding-left: 5px;">${dto.startTime} ~ ${dto.endTime}</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">정원</th>
		    			<td align="left" style="padding-left: 5px;">${dto.offLimit} 명</td>
		    		</tr>
		    		</c:if>
		    		<tr>
		    			<th width="35%">수강료</th>
		    			<td align="left" style="padding-left: 5px;">${dto.showTuition}</td>
		    		</tr>
	    		</table>
	    	</div>
	   		<div style="vertical-align: bottom;">
	   		<!-- 
	   		<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="classNotice();">클래스 알림받기</button>
	    	 -->
	    	<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="payGo(${dto.classNum},${dto.classType});">수강 신청하기</button>
	   		</div>
    	</td>
    </tr>
    </table>
    </c:forEach>
	</div>
</div>