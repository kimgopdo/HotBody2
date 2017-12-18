<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/hotbody/resource/jquery/js/jquery.oLoader.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

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

//마일리지 사용을 체크했을 경우,
function inputAbled() {
	var tuition = "${dto.tuition}";
	if($("input:checkbox[name=payPoint]").is(':checked') == true){
		$("#useMilelage").attr("disabled",false);
	}
	if($("input:checkbox[name=payPoint]").is(':checked') == false){
		$("#useMilelage").val('');
		$("#total").html(tuition+"원");
		$("#useMilelage").attr("disabled",true);
	}
}

//마일리지 입력 후 계산
function inputOut() {
	var tuition = parseInt("${dto.tuition}");
	var use = parseInt($("#useMilelage").val());
	var milelage = parseInt("${milelage}");
	
	if(use==tuition && use<milelage){
		if($("input:checkbox[name=payType]").is(':checked')){
			$("input:checkbox[name=payType]").prop("checked",false);
		}
	}
	else if(use>tuition){
		swal("총결제금액보다 많은 마일리지를 입력했습니다.");
		$("#useMilelage").val('');
		return;
	}
	else if(use>milelage){
		swal("사용가능한 마일리지를 확인해주세요.");
		$("#total").html(tuition+"원");
		$("#useMilelage").val('');
		return;
	}
	$("#total").html(tuition-use+"원");	
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
	var uid="${sessionScope.member.userId}";
   	if(! uid) {
   		location.href="<%=cp%>/member/login";
      return;
   	}
   	
	if(! $("input:checkbox[name=payType]").is(':checked')){
		swal("결제수단을 선택해주세요");
		return;
	}
	if($("input:checkbox[name=payPoint]").is(':checked') == true){
		if($("#useMilelage").val()==""){
			swal({
				  title: "마일리지가 입력되지 않았습니다!",
				  text: "마일리지 사용을 취소하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  $("input[name=payPoint]").prop("checked",false);
					  $("#useMilelage").attr("disabled",true);
				  } else {
				  }
				});
			return;
		}
	}
	var q = $("form[name=paymentForm]").serialize();
	
	var url="<%=cp%>/dietClass/paymentSubmit";
		
	$.ajax({
		type:"post"
		,url:url
		,data: q
		,dataType:"json"
	    ,error:function(e) {
	    	alert("등록실패");
	    	console.log(e.responseText);
	    }
	});
	
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
					  location.href="<%=cp%>/member/myclass";
				  } else {
					  //다시 리스트로
				    location.href="<%=cp%>/dietClass/list?type="+${dto.classType};
				  }
				});
			}
		});
}
</script>

<div class="body-container" style="width: 100%; padding-left: 0px;padding-right: 0px; margin: 100px auto;" align="center">
    
    <div style="width: 1000px;">
	<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">수강하실 클래스</p>
    </div>
    
    <form id="paymentForm" action="" method="post" name="paymentForm">
	<table style="border-collapse: collapse; width: 1000px;">
	<tr style="height: 50px; background: #bbddd4;">
		<th width="20%"></th>
		<th style="text-align: center;">
			클래스명
		</th>
		<th style="text-align: center;" width="25%">
			<c:if test="${dto.classType=='0'}">수강기간</c:if>
			<c:if test="${dto.classType=='1'}">수강날짜</c:if>
		</th>
		<th style="text-align: center;" width="15%">
			가격
		</th>
		<th style="text-align: center;" width="15%">
			적립 마일리지
		</th>
	</tr>
	<tr style="height: 100px; border-bottom: 1px solid #e6e6e6;" align="center">
		<td>
			<div style="width: 200px; height: 100px; float: left; overflow: hidden;">
				<img style="vertical-align: middle; width: 100%;" src="<%=cp%>/uploads/dietClass/${dto.saveFileName}">
			</div>
		</td>
		<td style="border-right: 1px solid #e6e6e6;">
		${dto.className}
		</td>
		<td style="border-right: 1px solid #e6e6e6;">
		${dto.onperiod}일
		</td>
		<td style="border-right: 1px solid #e6e6e6;">
		${dto.showTuition}
		</td>
		<td style="border-left: 1px solid #e6e6e6;">
		${dto.point}원
		</td>
	</tr>
	</table>

	<div style="width: 1000px; height:40px; margin-top: 20px;" align="right">
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
			<b> 위 서비스 이용약관에 동의합니다. &nbsp;</b><input type="checkbox" name="agree1" value="1" onclick="selectAgree();">
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
			<b>위 개인정보취급방침에 동의합니다. &nbsp;</b><input type="checkbox" name="agree2" value="1" onclick="selectAgree();">
			</div>
		</div>
	</div>
	
	<div id="paymentMethod" style="display: none;">
		<div style="width: 100%; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 200px; display: inline-block; vertical-align: top;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">결제수단</p>
			</div>
			<div style="width: 800px; display: inline-block; line-height: 2.5em;" align="left">
				<span><input type="checkbox" name="payType" value="1" onclick="oneCheckbox(this)"><b> 무통장입금 (가상계좌 발급)</b></span><br>
				<span><input type="checkbox" name="payType" value="2" onclick="oneCheckbox(this)"><b> 신용/체크카드</b></span><br>
				<span><input type="checkbox" name="payType" value="3" onclick="oneCheckbox(this)"><b> 온라인 계좌이체</b></span><br>
				<span><input type="checkbox" name="payType" value="4" onclick="oneCheckbox(this)"><b> 휴대폰 결제</b></span><br>
				<span><input type="checkbox" name="payPoint" onclick="inputAbled();"><b> 포인트 사용 : </b></span>
				<input type="text" id="useMilelage" name="useMilelage" style="width: 100px; height: 25px;" onblur="inputOut();" disabled="disabled">원 <br> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: tomato;">(총 사용가능 마일리지 : ${milelage}점)</span>
			</div>
		</div>
		
		
		<div style="width: 100%; height:200px; background: #e6e6e6; padding: 20px 20px; margin-top: 50px;">
			<div style="width: 200px; display: inline-block; vertical-align: middle;">
				<p style="font-size: 25px; font-weight: bold; margin-bottom: 20px;" align="left">총 결제금액</p>
			</div>
			<div style="width: 800px; display: inline-block;" align="left">
				<span id="total" style="font-size: 25px; color: #0a9696; font-weight: bold; margin-bottom: 20px;">${dto.tuition}원</span>
				<input type="hidden" name="totalPay" value="${dto.tuition}">
				<input type="hidden" name="milelage" value="${dto.point}">
				<input type="hidden" name="classNum" value="${dto.classNum}">
			</div>
		</div>
		<div style="width: 1000px; margin-top: 30px;" align="center">
		<button id="paymentBtn" type="button" style="width:1000px; height: 50px; background: #bbddd4; border: 0px; font-weight: bold;" onclick="paymentOk();">수강 신청완료!</button>
		</div>	
	</div>
	</form>
</div>