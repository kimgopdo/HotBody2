<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
function selectConfirm(num){
	//클래스 내용을 확인하였습니다-1
	if(num==1){
		$("#paymentMethod").slideDown('slow');
		$("#reconfirm").slideUp('slow');
	} else{
		$("#reconfirm").slideDown('slow');
		$("#paymentMethod").slideUp('slow');
	}
}

</script>


<div class="body-container" style="width: 100%; padding-left: 0px;padding-right: 0px;" align="center">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 결제 </h3>
    </div>
    
    <div style="width: 1000px;">
	<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">수강하실 클래스</p>
    </div>
	<table style="border-collapse: collapse; width: 1000px;">
	<tr style="height: 50px; background: #bbddd4;">
		<th style="text-align: center;">
			클래스명
		</th>
		<th style="text-align: center;" width="25%">
			수강날짜
		</th>
		<th style="text-align: center;" width="15%">
			가격
		</th>
		<th style="text-align: center;" width="15%">
			발생포인트
		</th>
	</tr>
	
	<tr style="height: 100px; border-bottom: 1px solid #e6e6e6;" align="center">
		<td style="font-weight: bold; padding: 5px 0; border-right: 1px solid #e6e6e6;" align="left">
			<img style="height: 100px; width: auto;" src="https://dietnote.net/static/mydano/class/detail/new/program_leg.jpg"> 클래스이름
		</td>
		<td style="border-right: 1px solid #e6e6e6;">
		2017년 12월 1일~30일
		</td>
		<td style="border-right: 1px solid #e6e6e6;">
		99,000원
		</td>
		<td style="border-left: 1px solid #e6e6e6;">
		400원
		</td>
	</tr>
	</table>

	<div style="width: 1000px; margin-top: 20px;" align="right">
		클래스 내용을 확인하셨습니까?&nbsp;&nbsp;&nbsp;
		<input type="radio" name="selectConfirm" onclick="selectConfirm(1)"><b> 예&nbsp;&nbsp;</b>
		<input type="radio" name="selectConfirm" onclick="selectConfirm(0)"><b> 아니오</b>
	</div>
	
	<div id="reconfirm" style="width:1000px; margin-top: 20px; display: none;" align="right">
		<p style="color: tomato; font-weight: bold;">클래스 내용을 확인 후 진행해주세요.</p>
	</div>
	
	<div id="agreement" style="width: 100%;">
		<div style="width: 100%; background: #e6e6e6; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 1000px; display: inline-block; vertical-align: top;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">이용약관 동의</p>
			</div>
		</div>
	</div>
	
	<div id="paymentMethod">
		<div style="width: 100%; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 200px; display: inline-block; vertical-align: top;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">결제수단</p>
			</div>
			<div style="width: 800px; display: inline-block; line-height: 2.5em;" align="left">
				<span><input type="radio" name="payType" onclick="#"><b> 무통장입금 (가상계좌 발급)</b></span><br>
				<span><input type="radio" name="payType" onclick="#"><b> 신용/체크카드</b></span><br>
				<span><input type="radio" name="payType" onclick="#"><b> 온라인 계좌이체</b></span><br>
				<span><input type="radio" name="payType" onclick="#"><b> 휴대폰 결제</b></span><br>
				<span><input type="radio" name="payPoint" onclick="#"><b> 포인트 사용 : </b></span>
				<input type="text" id="#" name="#" style="width: 100px; height: 25px;">원 <span style="color: tomato;">(총 사용가능 포인트 : 1234점)</span>
			</div>
		</div>
		
		<div style="width: 100%; background: #e6e6e6; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 200px; display: inline-block; vertical-align: top;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">결제금액</p>
			</div>
			<div style="width: 800px; display: inline-block;" align="left">
				<span style="font-size: 25px; color: #0a9696; font-weight: bold; margin-bottom: 20px;">99000원</span>
			</div>
		</div>
		<div style="width: 1000px;" align="right">
		<button id="paymentBtn" type="button" style="width:300px; height: 50px; background: #bbddd4; border: 0px; font-weight: bold;" onclick="#">수강 신청완료</button>
		</div>	
	</div>
	
</div>