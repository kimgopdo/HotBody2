<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>

<style type="text/css">
/* 바탕 배경 이미지 */
.pop-address-search .pop-address-search-inner { background-image: url(http://www.0000.com/img/backImg.png);}
/* 회사 로고 이미지 */
.pop-address-search .pop-address-search-inner .logo { background: url(http://www.0000.com/img/logo.png) no-repeat; background-position:center; }
/* 바탕 배경색상 */
.pop-address-search .pop-address-search-inner { background-color:#ECECEC; }
/* 검색창 색상 */
.pop-address-search .pop-address-search-inner .wrap input { background-color:#FFFFFF; }
/* 검색버튼 색상 */
.pop-address-search .pop-address-search-inner .wrap { background-color:#FFFFFF; }
/* 본문 배경색(홀수) */
.pop-address-search .pop-address-search-inner .result table.data-col tbody tr:nth-child(odd) td {background:#FFFFFF}
/* 본문 배경색(짝수) */
.pop-address-search .pop-address-search-inner .result table.data-col tbody tr:nth-child(even) td {background:#FFFFFF}
</style>

<script type="text/javascript">
function sendOk() {
	var uid="${sessionScope.member.userId}";
   	if(! uid) {
      location.href="<%=cp%>/member/login";
      return;
   	}
	var mode = "${mode}";
	
	var f = document.mocobungForm;
	var formData=new FormData(f);
	
	if(mode=='created')
		var url="<%=cp%>/mocobung/${mocoNum}/b_created";
	else if(mode=='u_bung')
		var url="<%=cp%>/mocobung/${mocoNum}/u_bung";
		
	$.ajax({
		type:"post"
		,url:url
		,processData: false
        ,contentType: false
		,data: formData
		,dataType:"json"
		,success:function(data) {
			var type=data.type;
			if(data.state=="true"){
				alert("등록완료"); 
				location.href="<%=cp%>/mocojee/${mocoNum}/main";
			}
		}
	    ,error:function(e) {
	    	alert("등록실패");
	    	console.log(e.responseText);
	    }
	});
}


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
	<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">벙개 등록</div>
	<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>


	<form id="mocobungForm" action="" method="post" name="mocobungForm" enctype="multipart/form-data">
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="40">
		<td width="100">벙개명</td>
		<td>
			<input type="text" name="mosubName" style="width: 98%; height: 35px;" value="${dto.mosubName}">
			
		</td>
	</tr>
	
		
	<tr height="10px;"></tr>
			<tr>
		  		<td width="100" valign="top">모임 날짜</td>
		  		<td>
				   <input type="text" readonly="readonly" class="moDate" name="moDate" style="width: 200px;" value="${dto.moDate}"> 
		  		</td>
			</tr>
		
	
	<tr height="10px;"></tr>
	<tr> 
	<td width="100" valign="top"> 모임 지역</td>
		<td>
			<select name="moSpot" id="moSpot" style="font-size: 9pt; font-family: 굴림체; width: 194px; height: 30px;"> 
		                <option  value="전체보기">전체보기</option> 
		                <option  value="서울/경기">서울/경기</option> 
		                <option  value="인천/부천">인천/부천</option> 
		                <option  value="춘천/강원">춘천/강원</option> 
		                <option  value="부산/울산/경남">부산/울산/경남</option> 
		                <option  value="대구/경북">대구/경북</option> 
		                <option  value="전주/전북">전주/전북</option> 
		                <option  value="광주/전남">광주/전남</option> 
		                <option  value="청주/충북">청주/충북</option> 
		                <option  value="청주/충북">청주/충북</option> 
		                <option  value="대전/충남">대전/충남</option> 
		                <option  value="제주">제주</option> 
		            </select>
          </td>
	</tr>

	<tr height="10px;"></tr>
			<tr>
		  		<td width="100" valign="top">모임 장소</td>
		  		<td>
		  			<p>
					<input style="width: 200px; height: 35px;" type="text" readonly="readonly" name="zip" id="sample6_postcode" placeholder="우편번호">
					<button class="btn02" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
		  			</p>
		  			<p style="margin-top: 10px;">
						<input style="width: 300px; height: 35px;" type="text" readonly="readonly" name=moPlace1 id="sample6_address" placeholder="주소" value="${dto.moPlace1}">
						<input style="width: 250px; height: 35px;" type="text" name="moPlace2" id="sample6_address2" placeholder="상세주소" value="${dto.moPlace2}">		  		
		  			</p>
		  		</td>
			</tr>
	
	<tr height="40">
		<td width="100" valign="top">시작 /종료 시간</td>
		<td>
			<input type="time" id="time" name="moStart" style="width: 20%; height: 35px;" value="${dto.moStart}"> ~ <input type="time" id="time" name="moEnd" style="width: 20%; height: 35px;" value="${dto.moEnd}"> 까지					
		</td>
	</tr>
	
	
	<tr height="40">
		<td width="100">회비</td>
		<td>
			<input type="text" name="moCost" style="width: 20%; height: 35px;" value="${dto.moCost}"> 원
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	
	<tr height="40">
		<td width="100" valign="top">최대 참석자수</td>
		<td>
			<input type="text" name="maxPeople" style="width: 20%; height: 35px;" value="${dto.maxPeople}"> 명
		</td>
	</tr>	

	</table>
	
	
	
	<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
	<div style="width: 1000px; margin: 20px auto 0;" align="center">
		<button type="button" class="btn-default02" onclick="sendOk();">${mode=='u_bung'?'수정완료':'등록하기'}</button>
		<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/mocojee/${mocoNum}/main';">${mode=='u_bung'?'수정취소':'등록취소'}</button>
		<c:if test="${mode=='u_bung'}">
			<input type="hidden" name="mosubName" value="${dto.mosubName}">
			<input type="hidden" name="moDate" value="${dto.moDate}">
			<input type="hidden" name="moSpot" value="${dto.moSpot}">
			<input type="hidden" name="moPlace1" value="${dto.moPlace1}">
			<input type="hidden" name="moPlace2" value="${dto.moPlace2}">
			<input type="hidden" name="moStart" value="${dto.moStart}">
			<input type="hidden" name="moEnd" value="${dto.moEnd}">
			<input type="hidden" name="moCost" value="${dto.moCost}">
			<input type="hidden" name="maxPeople" value="${dto.maxPeople}">			
		</c:if>
	</div>
	</form>
</div>
</body>
</html>
