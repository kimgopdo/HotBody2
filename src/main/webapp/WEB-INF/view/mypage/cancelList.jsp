
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

function formatDate(date) {

	  var day = date.getDate();
	  var monthIndex = date.getMonth();
	  var year = date.getFullYear();

	  return  year+ '-' + monthIndex + '-' +day ;
	}

$(function() {

	
	$("#today").click(function() {
		var date =new Date();
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		
		var lastday = year+ '-' + month + '-' +day;

		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});
	
	$("#week").click(function() {
		var date =new Date();
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		date.setDate(date.getDate()-7);
		
		var lastday = date.getFullYear()+ '-' + (date.getMonth()+1) + '-' +date.getDate();
		

		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});
	
	
	
	$("#month").click(function() {
		var date =new Date();
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;

		date.setMonth(date.getMonth()-1);
		
		var lastday = date.getFullYear()+ '-' + (date.getMonth()+1) + '-' +date.getDate();
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});
	
	$("#tmonth").click(function() {
		var date =new Date();
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;
		
		date.setMonth(date.getMonth()-3);
		
		var lastday = date.getFullYear()+ '-' + (date.getMonth()+1) + '-' +date.getDate();
		
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
		
	
	});
	
	$("#smonth").click(function() {
		var date =new Date();
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		var today =year+ '-' + month + '-' +day;
		
		date.setMonth(date.getMonth()-6);
		
		var lastday = date.getFullYear()+ '-' + (date.getMonth()+1) + '-' +date.getDate();
		
		$("#datepicker1").val(lastday);
		$("#datepicker2").val(today);
	
	});


});

</script>


</head>
<body>

<div style="height: 100px">
</div>

<div align="center">
<h3>CANCEL LIST</h3>
</div>

<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px;">
	<tr style="text-align: center; height: 40px">
		<td style="width: 20%; border-right: 1px solid silver;"><a onclick="location.href='<%=cp%>/order/orderList';">주문내역조회(0)</a></td>
		<td style="width: 20%; border-right: 1px solid silver; background-color: #D8D8D8;">취소/반품/교환 내역(0)</td>
		<td style="width: 60%"></td>
	</tr>
</table>

<form name="searchDate" method="post" >
<table style="border:3px solid silver; width: 1000px; margin: 40px auto 0px; height: 100px;">
	<tr style="text-align: center;">
		<td  style="width: 30%; font-size: 12px">
			<button value="today" id="today" type="button" style="padding: 2px" >오늘</button>
			<button value="week" id="week" style="margin: 0; position: relative; left: -6px; padding: 2px" type="button" >1주일</button>
			<button value="month" id="month" style="margin: 0; position: relative; left: -12px; padding: 2px" type="button" >1개월</button>
			<button value="tmonth" id="tmonth" style="margin: 0; position: relative; left: -18px; padding: 2px" type="button" >3개월</button>
			<button value="smonth" id="smonth" style="margin: 0; position: relative; left: -24px; padding: 2px" type="button">6개월</button>
		</td>
		<td align="left" style="width: 40%">
			<input style="width: 100px ; text-align: center;" type="text" id="datepicker1" >~
			<input style="width: 100px; text-align: center; " type="text" id="datepicker2" >		
			<img style="position: relative; top:-2px; " src="<%=cp%>/resource/images/btn_search.gif" onclick="">
		</td>
				<td style="width: 30%">

		</td>
	</tr>
</table>
</form>
<table style=" width: 1000px; margin: 0px auto;">
	<tr>
		<td><h6>＊기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.<br>
		＊주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</h6>
		</td>

	</tr>
</table>


<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px; font-size: 12px">
	<tr height="50px" style="text-align: center; background-color: #F2F2F2 ">
		<td  style="width: 14%; border:1px solid silver; ">
		주문일자<br>[주문번호]
		</td>
		<td  style="width: 12%; border:1px solid silver; ">
		이미지
		</td>
		<td  style="width: 42%; border:1px solid silver; ">
		상품정보
		</td>
		<td  style="width: 8%; border:1px solid silver; ">
		수량
		</td>
		<td  style="width: 12%; border:1px solid silver; ">
		상품구매금액
		</td>

		<td  style="width: 12%; border:1px solid silver; ">
		취소/교환/반품
		</td>
		<!--  
<c:forEach var="dto" items="${list}">
</c:forEach>
-->
	</tr>
	
		<tr height="100px" style="text-align: center; ">
		<td  style="width: 15%;  ">
		</td>
		<td  style="width: 10%;  ">
		</td>
		<td  style="width: 40%;  ">
		</td>
		<td  style="width: 5%;  ">
		</td>
		<td  style="width: 10%;  ">
		</td>
		<td  style="width: 10%;  ">
		</td>
		<td  style="width: 10%;  ">
		</td>
	</tr>

</table>
<div style="height: 100px">
</div>
</body>



</html>

