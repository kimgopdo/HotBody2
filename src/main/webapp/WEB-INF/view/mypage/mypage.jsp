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


$(function(){
	showBasketList();
})
function showBasketList() {
	 
	      // Most effect types need no options passed by default
	      var options = {};
	 		
	      // Run the effect
	      $( "#quickBasketList" ).effect("clip", options, 500);
};
function showBasket(){
	$("#basket_check").animate({
		"opacity" : "0",
		"display" : "none"
	},"slow")
	$("#basket_check").animate({
		"display" : "block",
		"opacity" : "1"
	},"fast")
}
function hideBasket(){
	$("#basket_check").animate({
		"opacity" : "0",
		"display" : "none"
	},"fast")
}

function BasketList(){
	alert("dddd")
	var cookie=getCookie("hotbodyBasket").split(",");
	var uid="${sessionScope.member.userId}";
	var q;
	console.log(cookie);
	
	alert("ssss")
	<%-- if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	}else  --%>if(cookie){
		var url="<%=cp%>/hotShop/basketList?cookie="+cookie;
		$.ajax({
			type:"get"
			,url:url
			,success:function(e){
				console.log(e);
				$("#BList").html(e);
			}
			,errer:function(e){
				console.log(e);
			}
		})
	} 
}


$( function() {
    $( "#basketList" ).dialog({
      autoOpen: false,
      width : "800px",
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#basket" ).on( "click", function() {
      $( "#basketList" ).dialog( "open" );
    });
  } );

</script>
</head>
<body>


<div style="height: 100px">
</div>

<div align="center">
<h3>MY PAGE</h3>
</div>


  	<div id="basketList" title="장바구니" style="display: none;">
	  	<table id="BList" style="width:800px;">
	  		
		</table>
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
		<td ><img id="basket" src="<%=cp%>/resource/images/myshop_icon03.gif" onclick="javascript:BasketList();"><br><b>장바구니<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon03.png" onclick="location.href='<%=cp%>/mypage/orderList';"><br><b>주문내역<b></td>
		
		<td><img src="<%=cp%>/resource/images/myshop_icon07.gif" onclick="location.href='<%=cp%>/mypage/milelageList';"><br><b>마일리지<b></td>
	</tr>
		<tr align="center">
		<td><img src="<%=cp%>/resource/images/main_menu_icon04.png" onclick="location.href='<%=cp%>/#';"><br><b>회원탈퇴<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon05.png" onclick="location.href='<%=cp%>/#';"> <br><b>회원정보수정<b></td>
		<td><img src="<%=cp%>/resource/images/main_menu_icon07.png" onclick="location.href='<%=cp%>/#';"><br><b>상담내역<b></td>
		</tr>
		
</table>


<div style="height: 150px">
</div>

	
</body>
</html>