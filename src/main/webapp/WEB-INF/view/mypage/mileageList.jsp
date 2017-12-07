
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(function() {
    $("#datepicker1, #datepicker2").datepicker({
        dateFormat: 'yy.mm.dd'
    });
});

</script>


</head>
<body>

<div style="height: 100px">
</div>

<div align="center" >
<h3>마일리지</h3><br>
고객님의 사용가능 적립금 금액 입니다.
</div>

<table  style="border: 2px solid silver; margin: 40px auto; width: 1000px;">
	<tr>
		<td style="width: 30%; padding: 5px;padding-top: 15px ">▷ 총적립금 </td>
		<td style=" width: 10%; text-align: right;padding-top: 15px" ><b>0원</b></td>
		<td align="center" style="border-right: 2px solid silver; width: 10%;padding-top: 15px"></td>
		<td style="width: 30%; padding: 5px;padding-top: 15px">▷ 사용가능적립금</td>
		<td style=" width: 10%; text-align: right;padding-top: 15px"><b>0원</b></td>
		<td style="width: 10%"></td>
	</tr>
	<tr>
		<td style="width: 30%; padding: 5px; padding-bottom: 15px">▷ 사용된적립금 </td>
		<td style="width: 10%;  text-align: right; padding-bottom: 15px"><b>0원</b></td>
		<td  align="center" style="border-right: 2px solid silver; width: 10%; padding-bottom: 15px"></td>
		<td style="width: 30%;  padding: 5px; padding-bottom: 15px">▷ 주문건수</td>
		<td style=" width: 10%; text-align: right; padding-bottom: 15px"><b>0(0회)</b></td>
		<td style="width: 10%; padding-bottom: 15px"></td>
	</tr>


</table>


<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px; font-size: 12px">
	<tr style="text-align: center; height: 40px">
		<td style="width: 20%; border-right: 1px solid silver; background-color: #D8D8D8;">적립내역보기</td>
		<td style="width: 20%; border-right: 1px solid silver;"><a onclick="location.href='<%=cp%>/mypage/usedMileageList';">적립금사용내역보기</a></td>

		<td style="width: 60%"></td>
	</tr>
</table>


<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px; font-size: 12px">
	<tr height="40px" style="text-align: center; background-color: #F2F2F2 ">
		<td  style="width: 15%; border:1px solid silver; ">
		주문날짜
		</td>
		<td  style="width: 15%; border:1px solid silver; ">
		적립금
		</td>
		<td  style="width: 15%; border:1px solid silver; ">
		관련 주문
		</td>
		<td  style="width: 55%; border:1px solid silver; ">
		적립내용
		</td>
		<!--  
<c:forEach var="dto" items="${list}">
</c:forEach>
-->
	</tr>
	
	<tr height="30px" style="text-align: center; ">
		<td  style="width: 15%;  ">
		
		</td>
		<td  style="width: 15%;  ">
		
		</td>
		<td  style="width: 15%; ">
		
		</td>
		<td  style="width: 55%;  ">
		
		</td>
	</tr>

</table>
<div style="height: 100px;" align="center" >
	<!--<img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_first.gif">
	<img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_prev.gif">-->
	<a style="margin-top:20px; position: relative; top: 10px;">${paging}</a>
	<!--  <img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_next.gif">
	<img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_last.gif">-->
</div>
</body>



</html>

