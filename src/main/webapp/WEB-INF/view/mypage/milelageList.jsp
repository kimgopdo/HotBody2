
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
        dateFormat: 'yy-mm-dd'
    });
});



$(function() {

	
	$("#today").click(function() {
		var date =new Date();
		
		var day = date.getDate();
		if(day<10)day="0"+day;
		var month = date.getMonth()+1;
		if(month<10)month="0"+month;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		var lastday =today;

		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});
	
	$("#week").click(function() {
		var date =new Date();
		
		var day = date.getDate();
		if(day<10)day="0"+day;
		var month = date.getMonth()+1;
		if(month<10)month="0"+month;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		date.setDate(date.getDate()-7);
		day = date.getDate();
		if(day<10)day="0"+day;
		month = date.getMonth()+1;
		if(month<10)month="0"+month;
		year = date.getFullYear();
		var lastday =year+ '-' + month + '-' +day;
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});
	
	
	
	$("#month").click(function() {
		var date =new Date();
		
		var day = date.getDate();
		if(day<10)day="0"+day;
		var month = date.getMonth()+1;
		if(month<10)month="0"+month;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		date.setMonth(date.getMonth()-1);
		day = date.getDate();
		if(day<10)day="0"+day;
		month = date.getMonth()+1;
		if(month<10)month="0"+month;
		year = date.getFullYear();
		var lastday =year+ '-' + month + '-' +day;		
		
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});
	
	$("#tmonth").click(function() {
		var date =new Date();
		var day = date.getDate();
		if(day<10)day="0"+day;
		var month = date.getMonth()+1;
		if(month<10)month="0"+month;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		date.setMonth(date.getMonth()-3);
		day = date.getDate();
		if(day<10)day="0"+day;
		month = date.getMonth()+1;
		if(month<10)month="0"+month;
		year = date.getFullYear();
		var lastday =year+ '-' + month + '-' +day;		
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
		
	
	});
	
	$("#smonth").click(function() {
		var date =new Date();
		var day = date.getDate();
		if(day<10)day="0"+day;
		var month = date.getMonth()+1;
		if(month<10)month="0"+month;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		date.setMonth(date.getMonth()-6);
		day = date.getDate();
		if(day<10)day="0"+day;
		month = date.getMonth()+1;
		if(month<10)month="0"+month;
		year = date.getFullYear();
		var lastday =year+ '-' + month + '-' +day;		
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});


});

</script>


</head>
<body>

<div style="height: 100px">
</div>

<div align="center" >
<h3>MILELAGE LIST</h3><br>
고객님이 사용하신 적립금 금액 입니다.
</div>

<table  style="border: 2px solid silver; margin: 40px auto; width: 1000px;">
	<tr>
		<td style="width: 30%; padding: 5px;padding-top: 15px ">▷ 총적립금 </td>
		<td style=" width: 10%; text-align: right;padding-top: 15px" ><b>${dto.totalMilelage}원</b></td>
		<td align="center" style="border-right: 2px solid silver; width: 10%;padding-top: 15px"></td>
		<td style="width: 30%; padding: 5px;padding-top: 15px">▷ 사용가능적립금</td>
		<td style=" width: 10%; text-align: right;padding-top: 15px"><b>${dto.useableMilelage}원</b></td>
		<td style="width: 10%"></td>
	</tr>
	<tr>
		<td style="width: 30%; padding: 5px; padding-bottom: 15px">▷ 사용된적립금 </td>
		<td style="width: 10%;  text-align: right; padding-bottom: 15px"><b>${dto.usedMilelage}원</b></td>
		<td  align="center" style="border-right: 2px solid silver; width: 10%; padding-bottom: 15px"></td>
		<td style="width: 30%;  padding: 5px; padding-bottom: 15px">▷ 주문건수</td>
		<td style=" width: 10%; text-align: right; padding-bottom: 15px"><b>${dto.orderCount}회</b></td>
		<td style="width: 10%; padding-bottom: 15px"></td>
	</tr>


</table>


<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px; font-size: 12px">
	<tr style="text-align: center; height: 40px">
		<td style="width: 20%; border-right: 1px solid silver; background-color: #D8D8D8;">적립내역보기</td>
		<td style="width: 20%; border-right: 1px solid silver;"><a onclick="location.href='<%=cp%>/mypage/usedMilelageList';">적립금사용내역보기</a></td>

		<td style="width: 60%"></td>
	</tr>
</table>

<form name="searchDate" method="post" action="<%=cp%>/mypage/milelageList">
<table style="border:3px solid silver; width: 1000px; margin: 40px auto 0px; height: 100px;">
	<tr style="text-align: center;">
		<td  style="width: 30%; font-size: 12px">
			<button value="today" id="today" type="button" style="padding: 2px" >오늘</button>
			<button value="week" id="week" style="margin: 0; position: relative; left: -6px; padding: 2px" type="button" >1주일</button>
			<button value="month" id="month" style="margin: 0; position: relative; left: -12px; padding: 2px" type="button" >1개월</button>
			<button value="tmonth" id="tmonth" style="margin: 0; position: relative; left: -18px; padding: 2px" type="button" >3개월</button>
			<button value="smonth" id="smonth" style="margin: 0; position: relative; left: -24px; padding: 2px" type="button">6개월</button>
		</td>
		<td align="left" style="width: 40%;">
			<input style="width: 100px ; text-align: center; border-style: 1px solid; height: 25px; position: relative; top:6px" type="text" id="datepicker1" name="datepicker1"><span style="position: relative;top: 6px;" > ~ </span>
			<input style="width: 100px; text-align: center; border-style: 1px solid; height: 25px; position: relative; top:6px " type="text" id="datepicker2" name="datepicker2">		
			<input type="image" style="position: relative; top:6px; " src="<%=cp%>/resource/images/btn_search.gif" >
		</td>
				<td style="width: 30%">

		</td>
	</tr>
</table>
</form>
<table style=" width: 1000px; margin: 0px auto;">
	<tr>
		<td><h6>＊기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.
		</td>

	</tr>
</table>



<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px; font-size: 12px">
	<tr height="40px" style="text-align: center; background-color: #F2F2F2 ">
		<td  style="width: 15%; border:1px solid silver; ">
		주문일자
		</td>
		<td  style="width: 15%; border:1px solid silver; ">
		상품구매금액
		</td>
		<td  style="width: 15%; border:1px solid silver; ">
		적립금액
		</td>
		<td  style="width: 55%; border:1px solid silver; ">
		상품정보
		</td>
 
	</tr>
	
<c:forEach var="list" items="${list}">
	<tr height="80px" style="text-align: center; ">
		<td  style="width: 15%; border-bottom: 1px solid silver;  ">
		${list.payDate}
		</td>
		<td  style="width: 15%;  border-bottom: 1px solid silver;">
		${list.totalPay}
		</td>
		<td  style="width: 15%; border-bottom: 1px solid silver;">
		${list.milelage}
		</td>
		<td  style="width: 55%;  border-bottom: 1px solid silver;">
		<a href="<%=cp%>/hotShop/shopArticle?pdnum=${list.pdNum}">${list.pdBoardName}</a>
		</td>
	</tr>
</c:forEach>

</table>
<div style="height: 100px;" align="center" >
	<!--<img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_first.gif">
	<img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_prev.gif">-->
	 <a style="margin-top:20px; position: relative; top: 10px;">${paging}</a>
	<!--  <img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_next.gif">
	<img style="margin-top: 20px" src="<%=cp%>/resource/images/btn_page_last.gif">-->
</div>

<div style="height: 100px">
</div>
</body>



</html>

