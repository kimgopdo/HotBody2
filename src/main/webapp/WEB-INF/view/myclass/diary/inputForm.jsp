<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function() {
    $("input[name=startDay]").datepicker();
    $("input[name=endDay]").datepicker();
});
</script>

<form name="schForm" method="post">
<table style="margin: 10px auto 0px; width: 100%; border-spacing: 0px;">
	  <tr height="40">
	  	<td style="color: blue; font-weight: bold;"> 다이어트 일기 </td>
	  </tr>
	  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">제&nbsp;&nbsp;목</td>
		      <td> 
                     <input name='title' type='text' class='boxTF' style="width:98%;" placeholder='제목'>
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
		           <textarea name="content" cols="50" rows="3" class="boxTA" style="width:97%; height: 80px; resize: none;"></textarea>
		           <input type="hidden" name="num" value="0">
		      </td>
	  </tr>
	  
	  
	  <!-- 식단작성부분 -->	  
	  <tr height="40">
	  		<td style="margin-top: 15px; color: blue; font-weight: bold;"> 식단작성 </td>
	  </tr>
	  
	  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">식사분류</td>
		      <td> 
		        	<select name='color' style="width:100px; height: 35px;">
	                     <option value='blue'> 아침 </option>
	                     <option value='black'> 점심 </option>
	                     <option value='green'> 저녁 </option>
                    </select>
		      		<a href="#">
		     	 		<img src="<%=cp%>/resource/images/search.png" height="26">
		      		</a>
		      </td>
	  </tr>
		
	  <tr style="border-bottom:1px solid #ccc;"> 
		      <td width="100" style="font-weight:600; padding-right:15px; padding-top:5px; text-align: right;" valign="top">내&nbsp;&nbsp;용</td>
		      <td valign="top" style="padding:5px 0px 5px 0px;"> 
		           <textarea name="content" cols="50" rows="3" class="boxTA" style="width:97%; height: 60px;"></textarea>
		           <input type="hidden" name="num" value="0">
		      </td>
	  </tr>

	  
	  <!-- 운동과 미션 -->	  
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
	  		  <td>&nbsp;&nbsp;<input type="checkbox" class="checkbox" id="allDayChk"  name="allDay" value="true"></td>
	  </tr>
	  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">운동</td>
		      <td> 
		        	<input id="" name="" type="text" class="boxTF" style="width: 120px;">
		      </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">운동시간</td>
		      <td> 
		        	<input id="" name="" type="text" class="boxTF" style="width: 120px;" placeholder="분으로 입력"> 분
		      </td>
	  </tr>
	  
</table>
</form>