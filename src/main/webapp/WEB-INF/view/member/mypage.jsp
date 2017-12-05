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
</head>
<body>


<div style="height: 100px">
</div>

<div align="center">
<h3>MY PAGE</h3>
</div>


<table  style="border: 1px solid; margin: 40px auto; width: 1000px;">
	<tr>
		<td style="width: 30%; padding: 5px;padding-top: 20px ">▷ 가용적립금 </td>
		<td style=" width: 10%; text-align: right;padding-top: 20px" ><b>0원</b></td>
		<td align="center" style="border-right: 1px solid; width: 10%;padding-top: 20px"><img src="<%=cp%>/resource/images/btn_result.gif"></td>
		<td style="width: 30%; padding: 5px;padding-top: 20px">▷ 총적립금</td>
		<td style=" width: 10%; text-align: right;padding-top: 20px"><b>0원</b></td>
		<td style="width: 10%"></td>
	</tr>
	<tr>
		<td style="width: 30%; padding: 5px;padding-bottom: 20px">▷ 사용적립금 </td>
		<td style="width: 10%;  text-align: right;padding-bottom: 20px "><b>0원</b></td>
		<td  align="center" style="border-right: 1px solid; width: 10%;padding-bottom: 20px"></td>
		<td style="width: 30%;  padding: 5px; padding-bottom: 20px">▷ 총주문</td>
		<td style=" width: 10%; text-align: right;padding-bottom: 20px"><b>0(0회)</b></td>
		<td style="width: 10%"></td>
	</tr>


</table>


<table  style=" width: 600px; margin: 10px auto" >

	<tr align="center">
		<td ><img src="<%=cp%>/resource/images/myshop_icon03.gif" onclick="location.href='<%=cp%>/#';"><br><b>장바구니<b></td>
		<td><img style="display: none;" src="<%=cp%>/resource/images/myshop_icon01.gif"></td>
		<td><img src="<%=cp%>/resource/images/myshop_icon07.gif" onclick="location.href='<%=cp%>/mileage/mileageList';"><br><b>마일리지<b></td>
	</tr>
		<tr align="center">
		<td><img src="<%=cp%>/resource/images/main_menu_icon04.png" onclick="location.href='<%=cp%>/#';"><br><b>회원탈퇴<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon05.png" onclick="location.href='<%=cp%>/#';"> <br><b>회원정보수정<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon07.png" onclick="location.href='<%=cp%>/#';"><br><b>상담내역<b></td>
	</tr>
		<tr align="center">
		<td ><img  src="<%=cp%>/resource/images/record-27195_1280.png" onclick="location.href='<%=cp%>/#';"><br><b>다이어리<b></td>
		<td><img style="display: none;" src="<%=cp%>/resource/images/myshop_icon07.gif"></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon03.png" onclick="location.href='<%=cp%>/order/orderList';"><br><b>주문내역<b></td>
	</tr>

</table>


<div style="height: 100px">
</div>

	
</body>
</html>