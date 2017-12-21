<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.paymentPage{
	top: 100px;
	font-size: 14px;
	font-family: inherit;
	margin-bottom: 200px;
}
.paymentPage button{
	border: 1px solid #000000;
	background: #ffffff;
	font-size: 14px;
	font-weight:bolder;
}
.paymentPage tr{
	border-bottom: 2px solid #e7e7e7;
	height: 80px;
}
.paymentPage input[type=text]{
	margin-left: 5px;
	margin-right: 5px;
	padding: 2px;
	border-radius: 2px;
	border: 1px solid #e7e7e7;
	outline: none;
}
.paymentPage select{
	padding: 3px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<script>
var tel;
var email;
$(function(){
	var userId="${sessionScope.member.userId}";
	if(userId==""){
		location.href="<%=cp%>/member/login";
		return;
	}
	var count=$("input[name=pdPrice]");
	for(var n=1; n<=count.length;n++){
		var sum=$("#pdPrice"+n).val();
		var cnt=$("#no1"+n).val();
		var tot=sum*cnt;
		tot=numberWithCommas(tot);
		$("#cost"+n).text(tot);
		$("#cnt"+n).text(cnt);
	}
	totalMoney();
	pointCal();
	tel="${memberDto.tel1}";
	email="${memberDto.email2}"
	if(tel){
		var telN;
		tel=='010'? telN=0 : tel=='011'? telN=1 : tel=='016'? telN=2 : tel=='017'? telN=2 : tel=='018'? telN=3 : telN=4
			$("#phoneSelect option:eq("+telN+")").attr("selected", "selected");
	}
	if(email){
		var emailN;
		email=='naver.com'? emailN=0 : email=='gmail.com'? emailN=1 : email=='daum.net'? emailN=2 : emailN=3
		$("#emailSelect option:eq("+emailN+")").attr("selected", "selected");
	}
})
function selectInfo(n){
	if(n==0){
		tel=='010'? telN=0 : tel=='011'? telN=1 : tel=='016'? telN=2 : tel=='017'? telN=2 : tel=='018'? telN=3 : telN=4
		$("#phoneSelect2 option:eq("+telN+")").attr("selected", "selected");
		$("#tel2").val("${memberDto.tel2}");
		$("#tel3").val("${memberDto.tel3}");
		$("#memberName").val("${memberDto.userName}");
		$("#zip").val("${memberDto.postNum}");
		$("#addr1").val("${memberDto.addr1}");
		$("#addr2").val("${memberDto.addr2}");
	}else{
		$("#tel2").val("");
		$("#tel3").val("");
		$("#memberName").val("");
		$("#zip").val("");
		$("#addr1").val("");
		$("#addr2").val("");
	}
}
function add(n){//인자값 : 수량업 1  , 수량 다운 시 -1
	var sum=$("#pdPrice"+n).val();
	sum=uncomma(sum);
	var cnt=$("#no1"+n).val();
	cnt=uncomma(cnt);
	var tot=sum*cnt;
	tot=numberWithCommas(tot);
	$("#cost"+n).text(tot);
	$("#cnt"+n).text(cnt);
}
function totalMoney(){
	var totalMoney=0;
	var count=$("input[name=pdPrice]");
	for(var n=1; n<=count.length;n++){
		var sum=$("#cost"+n).text();
		sum=uncomma(sum);
		console.log(sum);
		totalMoney+=sum;
		console.log(totalMoney);
	}
	totalMoney=numberWithCommas(totalMoney);
	console.log(totalMoney);
	$("#totPay").text(totalMoney);
	$("#totPay2").text(totalMoney);
	$("#result1").text(totalMoney);
	$("#result2").text(totalMoney);
	totalMoney=uncomma(totalMoney);
	$("input[name=totalPay]").val(totalMoney);
}
function pointCal(){
	var regNumber = /^[0-9]*$/;
	var point=$("#usingPoint").val();
	if(! regNumber.test(point)){
		$("#usingPoint").val("");
		return;
	}
	var totPay=$("#totPay2").text();
	totPay=uncomma(totPay);
	if(totPay<point){
		alert("포인트가 가격보다 많습니다.");
		$("#usingPoint").val("");
		$("#point1").text(0);
		$("#point2").text(0);
		totalMoney();
		return;
	}
	totPay=totPay-point;
	totPay=numberWithCommas(totPay);
	$("#point1").text(point);
	$("#point2").text(point);
	$("#result1").text(totPay);
	$("#result2").text(totPay);
	totPay=uncomma(totPay);
	$("input[name=totalPay]").val(totPay);
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function uncomma(str) {
    str = String(str);
    var num=parseInt(str.replace(/[^\d]+/g, ''));
    return num;
}
function onlyNumber(){
       event.returnValue=false;
}
function send(){
	var n=$("form[name=paymentPageForm]").serializeArray();
	console.log(n);
	var url="<%=cp%>/hotShop/payment";
	$.ajax({
		type:"post"
		,url:url
		,data:n
		,dataType:"json"
		,async: false
		,success:function(e){
			
		}
	})
}
function clear(){
	alert("아");
	$("#usingPoint").val("");
	return;
}
</script>
<form name="paymentPageForm">
<table class="paymentPage">
	<tr>
		<td colspan="8" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;"><img src="<%=cp%>/resource/images/shop_images/shopping-cart.png">&nbsp;&nbsp; 장바구니</td>
		
	</tr>
	<tr style="height: 50px; background: #F8F2ED">
		<td>no</td>
		<td>이미지</td>
		<td>상품정보</td>
		<td>판매가</td>
		<td>수량</td>
		<td>적립포인트</td>
		<td>가격</td>
		<td>별점</td>
	</tr>

	<c:forEach var="dto" items="${list}">
	<tr style="height:150px;">
		<td width="2%">
			<input type="hidden" name="pdnum" value="${dto.pdnum}">
			<input type="hidden" id="pdPrice${dto.listNum}" name="pdPrice" value="${dto.pdPrice}">
			<input type="hidden" value="${dto.listNum}">
			${dto.listNum}
		</td>
		<td width="15%">
			<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}">
		</td>
		<td width="38%">
			${dto.pdName}<br><br>${dto.pdSumContent}
		</td>
		<td width="10%">
			<fmt:formatNumber pattern="#,###">
			${dto.pdPrice}
			</fmt:formatNumber>원
		</td>
		<td width="5%">
			<input type="number" name="amount" value="${dto.pCnt}" id="no1${dto.listNum}" min="0" style="width: 35px;" onkeypress="onlyNumber();" onclick="add(${dto.listNum}); totalMoney();">
		</td>
		<td width="5%">
			190
		</td>
		<td width="10%">
			<span id="cost${dto.listNum}"></span>원
		</td>
		<td>****</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="8" style="text-align: right;vertical-align: text-top;">총 구매 금액&nbsp;:&nbsp;&nbsp;<span id="totPay"></span>원 </td>
	</tr>
	<tr>                       
		<td colspan="4" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;"><img src="<%=cp%>/resource/images/shop_images/phone.png">&nbsp;&nbsp; 주문자정보</td>
		<td colspan="4" style="text-align: right; font-size:20px; font-weight: bold; vertical-align: bottom;"><span style="color: red;">*</span>필수입력사항</td>
	</tr>
	<tr>
		<td colspan="2">주문하시는분<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;"><input type="text" value="${memberDto.userName}"></td>
	</tr>
	<tr>
		<td colspan="2">휴대전화<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;">
			<select id="phoneSelect">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>-<input type="text" value="${memberDto.tel2}">-<input type="text" value="${memberDto.tel3}"></td>
	</tr>
	<tr>
		<td colspan="2">이메일<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;">
			<input type="text" value="${memberDto.email1}">@<input type="text" value="${memberDto.email2}">
				<select id="emailSelect">
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
				</select>
		</td>
	</tr>
	<tr height="60px">
		<td colspan="8" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;"><img src="<%=cp%>/resource/images/shop_images/delivery-truck.png">&nbsp;&nbsp; 배송정보</td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: left; "> <input type="radio" name="info" onclick="selectInfo(0)">주문자 정보와 동일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="info" onclick="selectInfo(1)">새로작성</td>

	</tr>
	<tr>
		<td colspan="2">받으시는분<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;"><input type="text" id="memberName" name="takerName"></td>
	</tr>
	<tr style="height: 100px;">
		<td colspan="2">배송지</td>
		<td colspan="6" style="text-align: left;"><input type="text" id="zip" name="postNum"> <button type="button">우편번호</button><br><input type="text" id="addr1" name="takerAddr1"><br><input type="text" id="addr2" name="takerAddr2"> </td>
	</tr>
	<tr>
		<td colspan="2">연락 가능한 번호1<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;">
			<select id="phoneSelect2" name="tel1_1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>-<input type="text" id="tel2" name="tel1_2">-<input type="text" id="tel3" name="tel1_3">
		</td>
	</tr>
	<tr>
		<td colspan="2">연락 가능한 번호2</td>
		<td colspan="6" style="text-align: left;">
			<select name="tel2_1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>-<input type="text" name="tel2_2">-<input type="text" name="tel2_3">
		</td>
	</tr>
	<tr>
		<td colspan="2">배송메세지</td>
		<td colspan="6" style="text-align: left;"><textarea rows="3" style="width: 300px;" name="memo"></textarea> </td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;"><img src="<%=cp%>/uploads/shopList/give-money.png">&nbsp;&nbsp; 결제예정금액</td>
	</tr>
	<tr>
		<td colspan="2">사용할 포인트</td>
		<td colspan="6" style="text-align: left;"> <input type="number" name="milelagePay" value="0" id="usingPoint" onkeyup="clear(); pointCal();"> </td>
	</tr>
	
	<tr>
		<td colspan="2">사용포인트</td>                            
		<td colspan="1">주문 내용</td>
		<td colspan="5" style="text-align: center; padding: 10px;">총결제예정금액</td>
	</tr>
	<tr style="height: 200px;">
		<td colspan="2" rowspan="2" style="border-right: 2px solid #e7e7e7"><span id="point1"></span>포인트</td>
		<td colspan="1" rowspan="2">
		<c:forEach var="dto" items="${list}">
		<span>${dto.pdName} 수량: <span id="cnt${dto.listNum}"></span>개<br><br></span>
		</c:forEach>
		</td>
		<td colspan="5" style="border-left: 2px solid #e7e7e7"><span id="totPay2"></span>원 - <span id="point2"></span>포인트 = <span id="result1"></span>원<input type='hidden' name='totalPay'></td>
	</tr>
	<tr>
		<td colspan="3">총액 :  <span id="result2"></span>원</td>
		<td colspan="2"><button type="button" style="width: 100%; height: 80px; padding: 0; margin: 0;" onclick="send();">주문하기</button></td>
	</tr>
</table>
<input type="hidden" name="userId" value="${sessionScope.member.userId}">
</form>