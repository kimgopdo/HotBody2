<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/hotbody/resource/jquery/js/jquery.oLoader.min.js"></script>

<script type="text/javascript">
function oneCheckbox(p){
	//결제수단 체크박스 하나만 체크하기
    var obj = document.getElementsByName("payType");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != p){
            obj[i].checked = false;
        }
    }
}


function selectConfirm(num){
	//클래스 내용을 확인하였습니다-1
	if(num==1){
		$("input:checkbox[id='confirm2']").prop("checked", false);

		$("#agreement").slideDown('slow');
		$("#reconfirm").slideUp('slow');
	} else{
		$("input:checkbox[id='confirm1']").prop("checked", false);
		
		$("#reconfirm").slideDown('slow');
		$("#agreement").slideUp('slow');
	}
}

function selectAgree() {
	//두 약관에 모두 동의하면
	if($('input:checkbox[name=agree1]').is(':checked') && $('input:checkbox[name=agree2]').is(':checked'))
		$("#paymentMethod").slideDown('slow');
	else
		$("#paymentMethod").slideUp('slow');
}

function paymentOk() {
	$('body').oLoader({
		  wholeWindow: true, //makes the loader fit the window size
		  lockOverflow: true, //disable scrollbar on body
		   
		  backgroundColor: '#000000',
		  fadeInTime: 1000,
		  fadeLevel: 0.4,
		  image: '<%=cp%>/resource/images/loading.gif',
		  hideAfter: 2000,
		  complete:function() {
			  swal({
				  title: "결제가 완료되었습니다.",
				  text: "마이클래스로 이동하시겠습니까?",
				  icon: "success",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  //마이클래스로 가기
					  location.href="<%=cp%>/dietClass/article";
				  } else {
					  //다시 리스트로
				    location.href="<%=cp%>/dietClass/list";
				  }
				});
			}
		});
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
		<input type="checkbox" id="confirm1" onclick="selectConfirm(1)"><b> 예&nbsp;&nbsp;</b>
		<input type="checkbox" id="confirm2" onclick="selectConfirm(0)"><b> 아니오</b>
	</div>
	
	<div id="reconfirm" style="width:1000px; margin-top: 20px; display: none;" align="right">
		<p style="color: tomato; font-weight: bold;">클래스 내용을 확인 후 진행해주세요.</p>
	</div>
	
	<div id="agreement" style="width: 100%; display: none;">
		<div style="width: 100%; background: #e6e6e6; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 1000px;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">약관동의</p>
				<p style="font-weight: bold; border-bottom: 1px solid; line-height: 2.5em; border-color: #666666;" align="left">*서비스 이용약관</p>
			</div>
			<div align="left" style="overflow-y: scroll; width: 1000px; height: 260px; overflow-x:hidden; border: 1px solid #666666; background: #ffffff; padding:10px 10px; margin: 10px 10px;">
				<span class="bold txt_14">제 1 장 총 칙</span><br /><br />
                            제 1 조 (목적)<br />
                            이 약관은 &quot;기술자료임치센터&quot; 대·중소기업·농어업협력재단 홈페이지(이하 &quot;재단&quot;이라 함)의 이용조건 및 절차에<br />관한 사항을 규정하는 데 있습니다.<br /><br />
                            제 2 조 (약관의 효력 및 변경)<br />
                            ① 이 약관은 &quot;재단&quot; 홈페이지의 이용고객에게 그 내용을 공지함으로써 효력이 발생합니다.<br />
                            ② &quot;재단&quot;는 필요하다고 인정되는 경우에 이 약관을 개정할 수 있으며, 개정된 내용은 제1항과 같은 방법으로<br />
                            공지한 때로부터 그 효력을 발생합니다.<br /><br />
                            제 3 조 (약관적용 외 준칙)<br />
                            이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있는 경우에는 그 규정에 따릅니다. <br /><br />
                            제 4 조 (용어의 정의)<br />
                            ① 이 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.<br />
                            <br />
                            1. &quot;서비스&quot;라 함은 &quot;재단&quot;에서 제공하는 제반서비스(정보제공, 부가서비스 등)를 말합니다. <br />
                            2. &quot;회원&quot;이라 함은 &quot;재단&quot;와 서비스 이용계약을 체결하고 회원ID를 부여받은 개인 또는 법인을 말합니다. <br />
                            3. &quot;이용계약&quot;이라 함은 서비스 이용을 목적으로 &quot;재단&quot;와 이용자간에 체결하는 계약을 말합니다. <br />
                            4. &quot;회원ID&quot;라 함은 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고&quot;재단&quot;가 승인하는 문자와 숫자<br />
                               의 조합을 말합니다. <br />
                            5. &quot;회원정보&quot;라 함은 회원이 이용계약을 체결할 때  &quot;재단&quot;에 등록하는 회원ID,이름, 주소, 전화번호, <br />
                               이메일주소, 직업 등의 회원에 관한 정보를 말합니다. <br />
                            6. &quot;비밀번호&quot;라 함은 회원ID와 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원 자신이 <br />
                               설정한 문자와 숫자의 조합을 말합니다. <br />
                            <br />
                            <br />
			</div>
			<div style="width: 1000px;" align="right">
			<input type="checkbox" name="agree1" value="1" onclick="selectAgree();"><b> 위 서비스 이용약관에 동의합니다.</b>
			</div>
			
			<div style="width: 1000px; margin-top: 50px;">
				<p style="font-weight: bold; border-bottom: 1px solid; line-height: 2.5em; border-color: #666666;" align="left">*개인정보 수집, 제공 및 활용 동의</p>
			</div>
			<div align="left" style="overflow-y: scroll; width: 1000px; height: 260px; overflow-x:hidden; border: 1px solid #666666; background: #ffffff; padding:10px 10px; margin: 10px 10px;">
				<span class="bold txt_14">제 1 장 총 칙</span><br /><br />
                            제 1 조 (목적)<br />
                            이 약관은 &quot;기술자료임치센터&quot; 대·중소기업·농어업협력재단 홈페이지(이하 &quot;재단&quot;이라 함)의 이용조건 및 절차에<br />관한 사항을 규정하는 데 있습니다.<br /><br />
                            제 2 조 (약관의 효력 및 변경)<br />
                            ① 이 약관은 &quot;재단&quot; 홈페이지의 이용고객에게 그 내용을 공지함으로써 효력이 발생합니다.<br />
                            ② &quot;재단&quot;는 필요하다고 인정되는 경우에 이 약관을 개정할 수 있으며, 개정된 내용은 제1항과 같은 방법으로<br />
                            공지한 때로부터 그 효력을 발생합니다.<br /><br />
                            제 3 조 (약관적용 외 준칙)<br />
                            이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있는 경우에는 그 규정에 따릅니다. <br /><br />
                            제 4 조 (용어의 정의)<br />
                            ① 이 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.<br />
                            <br />
                            1. &quot;서비스&quot;라 함은 &quot;재단&quot;에서 제공하는 제반서비스(정보제공, 부가서비스 등)를 말합니다. <br />
                            2. &quot;회원&quot;이라 함은 &quot;재단&quot;와 서비스 이용계약을 체결하고 회원ID를 부여받은 개인 또는 법인을 말합니다. <br />
                            3. &quot;이용계약&quot;이라 함은 서비스 이용을 목적으로 &quot;재단&quot;와 이용자간에 체결하는 계약을 말합니다. <br />
                            4. &quot;회원ID&quot;라 함은 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고&quot;재단&quot;가 승인하는 문자와 숫자<br />
                               의 조합을 말합니다. <br />
                            5. &quot;회원정보&quot;라 함은 회원이 이용계약을 체결할 때  &quot;재단&quot;에 등록하는 회원ID,이름, 주소, 전화번호, <br />
                               이메일주소, 직업 등의 회원에 관한 정보를 말합니다. <br />
                            6. &quot;비밀번호&quot;라 함은 회원ID와 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원 자신이 <br />
                               설정한 문자와 숫자의 조합을 말합니다. <br />
                            <br />
                            <br />
			</div>
			<div style="width: 1000px;" align="right">
			<input type="checkbox" name="agree2" value="1" onclick="selectAgree();"><b> 위 개인정보취급방침에 동의합니다.</b>
			</div>
		</div>
	</div>
	
	<div id="paymentMethod" style="display: none;">
		<div style="width: 100%; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 200px; display: inline-block; vertical-align: top;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">결제수단</p>
			</div>
			<div style="width: 800px; display: inline-block; line-height: 2.5em;" align="left">
				<span><input type="checkbox" name="payType" value="p1" onclick="oneCheckbox(this)"><b> 무통장입금 (가상계좌 발급)</b></span><br>
				<span><input type="checkbox" name="payType" value="p2" onclick="oneCheckbox(this)"><b> 신용/체크카드</b></span><br>
				<span><input type="checkbox" name="payType" value="p3" onclick="oneCheckbox(this)"><b> 온라인 계좌이체</b></span><br>
				<span><input type="checkbox" name="payType" value="p4" onclick="oneCheckbox(this)"><b> 휴대폰 결제</b></span><br>
				<span><input type="checkbox" name="payPoint" onclick="#"><b> 포인트 사용 : </b></span>
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
		<div style="width: 1000px; margin-top: 30px;" align="center">
		<button id="paymentBtn" type="button" style="width:1000px; height: 50px; background: #bbddd4; border: 0px; font-weight: bold;" onclick="paymentOk();">수강 신청완료!</button>
		</div>	
	</div>
	
</div>