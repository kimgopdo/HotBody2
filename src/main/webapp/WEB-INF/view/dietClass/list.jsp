<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
$(function() {
      $('.ct').mouseover(function (e){
          $('.ctd').show();
      });
      $('.ct').mouseout(function (e){
          $('.ctd').hide();
      });
});
</script>


<div class="body-container" style="width: 1000px;">


<div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 제목 </h3>
</div>



    <table class="ct" style="width: 1000px; border-spacing: 0; border-collapse: collapse; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;">
    <tr>
    	<td style="width: 280px; height:490px; overflow: hidden;">
    	<img align="right" style="width:100%; height: 100%;" src="https://dietnote.net/static/mydano/class/desktop/program_leg.png?#">
    	</td>
    	<td valign="top" style="padding: 35px 20px;" width="350px;">
    	<p><b style="font-size: 30px;">미니스커트 챌린지</b></p>
    	<b style="color: #ff6699; font-size: 20px;">허벅지, 종아리 집중공략<br>슬림하체 만들기</b><br><br>
    	<span><b style="color: #333333;">"저주받은 하체따윈 없다. 노력으로 흘린 땀은 저주도 이긴다." 하체컴플렉스로 미니스커트 입기 꺼렸던 이 땅의 수많은 하비인들을 위해 탄생한 프로그램입니다. 살은 빼도 해결되지 않는 하체비만, 이젠 자신있게 미니스커트 입어줍시다!</b></span>
    	<br>
    	<div class="ctd" style="display: none; margin: 20px;">
    		<a href="<%=cp%>/dietClass/article" style="color: #666666;">자세히 보러가기>></a>
    	</div>
    	</td>
    	<td style="background: #e3e3e3; width: 250px;" align="center">
	    	<div align="center" style="height: 405px;">
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
		    		<tr>
		    			<th width="35%">프로그램 구성</th>
		    			<td align="left" style="padding-left: 5px;">골반교정 스트레칭</td>
		    		</tr>
		    		<c:forEach var="#" items="#">
		    		<tr>
		    			<th width="35%"></th>
		    			<td align="left" style="padding-left: 5px;">골반교정 스트레칭</td>
		    		</tr>
		    		<tr>
		    			<th width="35%"></th>
		    			<td align="left" style="padding-left: 5px;">골반교정 스트레칭</td>
		    		</tr>
		    		<tr>
		    			<th width="35%"></th>
		    			<td align="left" style="padding-left: 5px;">골반교정 스트레칭</td>
		    		</tr>
		    		</c:forEach>
		    		<tr>
		    			<th width="35%">운동강도</th>
		    			<td align="left" style="padding-left: 5px;">상/중/하</td>
		    		</tr> 
		    		<tr>
		    			<th width="35%">장소</th>
		    			<td align="left" style="padding-left: 5px;">어디어디</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">수강정원</th>
		    			<td align="left" style="padding-left: 5px;">600명</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">수강기간</th>
		    			<td align="left" style="padding-left: 5px;">4주(12월4일~31일)</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">수강료</th>
		    			<td align="left" style="padding-left: 5px;">99,000원</td>
		    		</tr>
	    		</table>
	    	</div>
	   		<div style="vertical-align: bottom;">
	    	<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="#">수강 신청하기</button>
	   		</div>
    	</td>
    </tr>
     
    
    </table>
    </div>
	