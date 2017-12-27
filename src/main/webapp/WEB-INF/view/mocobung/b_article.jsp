<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<head>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<style type="text/css">
body {
	font-family: Verdana, sans-serif;
	font-size: 14px;
}

.btn-article {
	display: inline-block;
	font-weight: normal;
	text-align: center;
	width: 50px;
	height: 30px;
	touch-action: manipulation;
	cursor: pointer;
	background-image: none;
	white-space: nowrap;
	font-size: 12px;
	user-select: none;
	border-width: 1px;
	border-style: solid;
	background-color: #ffffff;
	border-color: #cccccc;
	border-image: initial;
	padding: 10px auto;
	color: black;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 1px #999999;
	box-shadow: 2px 2px 10px silver;
	min-width: 300px;
	min-height: 30px;
	padding: 10px;
}
</style>

<script type="text/javascript">


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}

$(function(){

	var d = new Date();
	// $("#date1").datepicker();
	$(".moDate").datepicker({
		showMonthAfterYear:true
	});
	$(".moDate").datepicker("option", "defaultDate", d);
});


</script>
</head>
<body>
<div class="body-container" style="width: 1000px; margin: 100px auto;">
	<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">벙개 보기</div>
	<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>


	<form id="mocobungForm" action="" method="post" name="mocobungForm" enctype="multipart/form-data">
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="40">
		<td width="100" valign="top">벙개명</td>
		<td valign="top">
			${dto.mosubName}
		</td>
	</tr>
	
	
			<tr height="40">
		  		<td width="100" valign="top">모임 날짜</td>
		  		<td valign="top">
				   ${dto.moDate} 
		  		</td>
			</tr>
		
	

	
	<tr height="40"> 
	<td width="100" valign="top"> 모임 지역</td>
		<td valign="top">
			${dto.moSpot}
          </td>
	</tr>


	
			<tr height="40">
		  		<td width="100" valign="top">모임 장소</td>
		  		<td valign="top">
		  			${dto.moPlace1} &nbsp; ${dto.moPlace2}
		  		</td>
			</tr>
	
	<tr height="40">
		<td width="100" valign="top">시작시간</td>
		<td valign="top">
			${dto.moStart} 				
		</td>
	</tr>
	
	<tr height="40">
		<td width="100" valign="top">종료시간</td>
		<td valign="top">
			${dto.moEnd} 				
		</td>
	</tr>
	
	
	<tr height="40">
		<td width="100" valign="top">회비</td>
		<td valign="top">
			${dto.moCost} 원
		</td>
	</tr>

	
	<tr height="40">
		<td width="100" valign="top">최대 참석자수</td>
		<td valign="top">
			${dto.maxPeople} 명
		</td>
	</tr>	
	
	</table>
		
	<div>
		<input type="button" class="btn-article" value="목록"
			onclick="javascript:location.href='<%=cp%>/mocojee/${mocoNum}/main';">	
		<c:if test="${sessionScope.member.userId==dto.userId}">
			<input type="button" class="btn-article" value="수정"
				onclick="javascript:location.href='<%=cp%>/mocobung/${mocoNum}/u_bung?num=${dto.mosubNum}';">

			<input type="button" class="btn-article" value="삭제"
				onclick="deleteFB();">	
		</c:if>
		
	</div>

	</form>
</div>
</body>
</html>
