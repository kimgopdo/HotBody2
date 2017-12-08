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


<table  style=" width: 600px; margin: 10px auto" >

	<tr align="center">
		<td ><img src="<%=cp%>/resource/images/myshop_icon03.gif" onclick="location.href='<%=cp%>/#';"><br><b>장바구니<b></td>
		<td><img style="display: none;" src="<%=cp%>/resource/images/myshop_icon01.gif"></td>
		<td><img src="<%=cp%>/resource/images/myshop_icon07.gif" onclick="location.href='<%=cp%>/mypage/mileageList';"><br><b>마일리지<b></td>
	</tr>
		<tr align="center">
		<td><img src="<%=cp%>/resource/images/main_menu_icon04.png" onclick="location.href='<%=cp%>/#';"><br><b>회원탈퇴<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon05.png" onclick="location.href='<%=cp%>/#';"> <br><b>회원정보수정<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon07.png" onclick="location.href='<%=cp%>/#';"><br><b>상담내역<b></td>
	</tr>
		<tr align="center">
		<td ><img  src="<%=cp%>/resource/images/record-27195_1280.png" onclick="location.href='<%=cp%>/#';"><br><b>다이어리<b></td>
		<td><img style="display: none;" src="<%=cp%>/resource/images/myshop_icon07.gif"></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon03.png" onclick="location.href='<%=cp%>/mypage/orderList';"><br><b>주문내역<b></td>
	</tr>

</table>


<div style="height: 100px">
</div>

	
</body>
</html>