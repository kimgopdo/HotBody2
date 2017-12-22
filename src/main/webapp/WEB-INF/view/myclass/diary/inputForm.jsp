<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript">
$(function() {
    $("input[name=startDay]").datepicker();
    $("input[name=endDay]").datepicker();
});



</script>

<form name="schForm" method="post">
<!-- 다이어트 작성부분 -->
<div>
<table style="margin: 10px auto 0px; width: 100%; border-spacing: 0px;">
	  <tr height="40">
	  	<td style="color: blue; font-weight: bold;"> 다이어트 일기 </td>
	  </tr>
	  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">제&nbsp;&nbsp;목</td>
		      <td> 
                     <input name='title' type='text' class='boxTF' style="width:85%;" placeholder='제목'>
              </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">작성자</td>
		      <td> 
		             ${sessionScope.member.userName}
		      </td>
	  </tr>
	  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">금일체중</td>
		      <td> 
		            <input name='weight' type='text' class='boxTF' style="width:20%;" placeholder='금일체중'> Kg
		      </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">시작일자</td>
		      <td> 
		        	<input name="startDay" type="text" readonly="readonly" class="boxTF" style="background: #fff; width: 120px;" placeholder="시작날짜">
		      </td>
	  </tr>
		 		
	  <tr style="border-bottom:1px solid #ccc;"> 
		      <td width="100" style="font-weight:600; padding-right:15px; padding-top:5px; text-align: right;" valign="top">내&nbsp;&nbsp;용</td>
		      <td valign="top" style="padding:5px 0px 5px 0px;"> 
		           <textarea name="content" cols="50" rows="3" class="boxTA" style="width:85%; height: 80px; resize: none;"></textarea>
		           <input type="hidden" name="num" value="0">
		      </td>
	  </tr>
</table>
</div>	  

<!-- 식단작성부분 -->
	<div style="width: 40%; float: left; border-right:1px solid #ccc;">
	<table>
	  <tr height="40">
	  		<td style="margin-top: 15px; color: blue; font-weight: bold;"> 식단작성 </td>
	  		<td style="padding-left: 40px;">
	  			<input type="button" value="아침식단 추가 " onclick="add1()">
	  		</td>
	  		
	  </tr>
	    
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">식사분류</td>
		      <td style="font-weight: bold; color: #666666; font-size:15px; padding-left: 70px;" align="left">아침</td>
	  </tr>
		
	  <tr> 
		      <td width="100" style="font-weight:600; padding-right:15px; padding-top:5px; text-align: right;" valign="top">식&nbsp;&nbsp;단</td>
		      <td valign="top" style="padding:5px 0px 10px 0px;" id ="add1"> 
		      	<div>
		           <input name='weight' type='text' class='boxTF' style="width:53%;" placeholder='재료선택(클릭)' onclick='lookIng()'>
		           <input name='weight' type='text' class='boxTF' style="width:26%;" placeholder='량'>          
		           <input type="hidden" name="num" value="0">
		        </div>    
		      </td>
	  </tr>
	</table>
	</div>


	<div style="float: left; width: 28%; border-right:1px solid #ccc;">
	<table>    
	  <tr height="40">
	  		<td style="padding-left: 35px;">
	  			<input type="button" value="점심식단 추가 " onclick="add2()">
	  		</td>
	  		
	  </tr>
	  <tr height="40"> 
		      <td style="font-weight: bold; color: #666666; font-size:15px; padding-left: 70px;" align="left">점심</td>
	  </tr>
		
	  <tr> 
		      <td valign="top" style="padding:5px 0px 5px 12px;" id ="add2"> 
		      	<div>
		           <input name='weight' type='text' class='boxTF' style="width:55%;" placeholder='재료선택(클릭)' onclick="lookIng()" >
		           <input name='weight' type='text' class='boxTF' style="width:25%;" placeholder='량'>
		           <input type="hidden" name="num" value="0">
		        </div>
		      </td>
	  </tr>
	</table>
	</div>

	<div style="float: left; width: 28%;">
	<table>    
	  <tr height="40">
	  		<td style="padding-left: 35px;">
	  			<input type="button" value="저녁식단 추가 " onclick="add3()">
	  		</td>
	  		
	  </tr>
	  <tr height="40"> 
		      <td style="font-weight: bold; color: #666666; font-size:15px; padding-left: 70px;" align="left">저녁</td>
	  </tr>
		
	  <tr> 
		      <td valign="top" style="padding:5px 0px 5px 12px;" id ="add3"> <!-- 시계방향으로 위,오른쪽,아래,왼쪽 -->
		      	<div>
		           <input name='weight' type='text' class='boxTF' style="width:55%;" placeholder='재료선택(클릭)' onclick="lookIng()">
		           <input name='weight' type='text' class='boxTF' style="width:25%;" placeholder='량'>  
		           <input type="hidden" name="num" value="0">
		      	</div>
		      </td>
		      
	  </tr>
	</table>
	</div>

<!-- 운동과 미션 -->
<div style="border-top: 1px solid #ccc; clear: both;">
<table style="margin: 10px auto 0px; width: 100%; border-spacing: 0px;">   
	  <tr height="40">
	  		<td style="margin-top: 15px; color: blue; font-weight: bold;"> 운동과 미션 </td>
	  </tr>
	  
	  <tr height="40">
	  		<td style="font-weight:600; text-align: right; padding-right:15px;" align="center">미션리스트</td>
	  		<td style="font-weight:600;">(오늘 완료한 미션을 체크하세요!!)</td>
	  </tr>
	  
	  <tr height="40" >
	  		  <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">미&nbsp;&nbsp;션</td>
		      <td> 
                     <input name='title' type='text' class='boxTF' style="width:98%;">
              </td>
	  		  <td>&nbsp;&nbsp;<input type="checkbox" class="checkbox" id="msChk"  name="msChk" value="true"></td>
	  </tr>
	  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">운동</td>
		      <td> 
		        	<input id="" name="" type="text" class="boxTF" style="width: 150px;" placeholder="운동선택(클릭)" onclick="lookExercise()">
		      </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">운동시간</td>
		      <td> 
		        	<input id="" name="" type="text" class="boxTF" style="width: 120px;" placeholder="????로 입력"> ????
		      </td>
	  </tr>
</table>
</div>

<div id="ing" style="display: none;"></div>
<div id="exercise" style="display: none;"></div>
  
</form>