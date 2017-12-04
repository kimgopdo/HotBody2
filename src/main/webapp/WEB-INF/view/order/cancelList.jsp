
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

<table style="border:3px solid silver; width: 1000px; margin: 40px auto 0px; height: 100px;">
	<tr style="text-align: center;  font-size: 12px;">
		<td  style="width: 30%; ">
			<button  type="button" style="padding: 2px">오늘</button>
			<button style="margin: 0; position: relative; left: -6px; padding: 2px" type="button">1주일</button>
			<button style="margin: 0; position: relative; left: -12px; padding: 2px" type="button">1개월</button>
			<button style="margin: 0; position: relative; left: -18px; padding: 2px" type="button">3개월</button>
			<button style="margin: 0; position: relative; left: -24px; padding: 2px" type="button">6개월</button>
		</td>
		<td align="left" style="width: 40%">
			<input style="width: 100px ; text-align: center;" type="text" id="datepicker1">~
			<input style="width: 100px; text-align: center; " type="text" id="datepicker2">		
			<img style="position: relative; top:-2px; " src="<%=cp%>/resource/images/btn_search.gif">
		</td>
				<td style="width: 30%">

		</td>
	</tr>

</table>
<table style=" width: 1000px; margin: 0px auto;">
	<tr>
		<td><h6>＊기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.<br>
		＊주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</h6>
		</td>

	</tr>
</table>


<table style="border:1px solid silver; width: 1000px; margin: 40px auto 0px; font-size: 12px">
	<tr height="50px" style="text-align: center; background-color: #F2F2F2 ">
		<td  style="width: 12%; border:1px solid silver; ">
		주문일자<br>[주문번호]
		</td>
		<td  style="width: 10%; border:1px solid silver; ">
		이미지
		</td>
		<td  style="width: 40%; border:1px solid silver; ">
		상품정보
		</td>
		<td  style="width: 5%; border:1px solid silver; ">
		수량
		</td>
		<td  style="width: 10%; border:1px solid silver; ">
		상품구매금액
		</td>
		<td  style="width: 10%; border:1px solid silver; ">
		주문처리상태
		</td>
		<td  style="width: 13%; border:1px solid silver; ">
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

