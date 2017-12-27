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
	
	var f = document.dietClassForm;
	var formData=new FormData(f);
	
	if(mode=='created')
		var url="<%=cp%>/dietClass/insert";
	else if(mode=='update')
		var url="<%=cp%>/dietClass/updateSubmit";
		
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
				location.href="<%=cp%>/dietClass/list?type="+type;
			}
		}
	    ,error:function(e) {
	    	alert("등록실패");
	    	console.log(e.responseText);
	    }
	});
}
function fileChange() {
	var upload=document.getElementById("upload").value;
	document.getElementById("fileName").value=upload.substring(0,upload.lastIndexOf("."));
}

function deleteFile() {
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		location.href="<%=cp%>/notice/deleteFile?page=${page}&num=${dto.classNum}"
	}
}

function selectClassType(typeNum) {
	if(typeNum==0){
		$("#offInfo").slideUp("slow");		
		$("#onInfo").slideDown("slow");
	}
	else{
		$("#onInfo").slideUp("slow");
		$("#offInfo").slideDown("slow");
	}
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
	var t = "${dto.classType}";
	if(t==0)
		$("#onInfo").show();
	else if(t==1)
		$("#offInfo").show();
	
	var d = new Date();
	// $("#date1").datepicker();
	$(".classDate").datepicker({
		showMonthAfterYear:true
	});
	$(".classDate").datepicker("option", "defaultDate", d);
});

</script>
</head>
<body>
<div class="body-container" style="width: 1000px; padding-left: 20px;">
	<div style="height: 50px;"></div>
	<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">클래스 등록</div>
	<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>


	<form id="dietClassForm" action="" method="post" name="dietClassForm" enctype="multipart/form-data">
	<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="40">
		<td width="120">클래스명</td>
		<td>
			<input type="text" name="className" style="width: 98%; height: 35px;" value="${dto.className}">
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<tr>
		<td width="120">클래스 난이도</td>
		<td>
			<input type="radio" name="cllevel" value="1" ${dto.cllevel=="1"?"checked='checked'":""}>
			<label for="notice"> 상 </label>
			
			<input type="radio" name="cllevel" value="2" ${dto.cllevel=="2"?"checked='checked'":""}>
			<label for="notice"> 중 </label>
			
			<input type="radio" name="cllevel" value="3" ${dto.cllevel=="3"?"checked='checked'":""}>
			<label for="notice"> 하 </label>
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<tr height="40">
		<td width="120">수강료</td>
		<td>
			<input type="text" name="tuition" style="width: 20%; height: 35px;" value="${dto.tuition}"> 원
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<tr height="40">
		<td width="120" valign="top">목적</td>
		<td>
			<textarea style="width: 98%;" rows=6; name="classGoal">${dto.classGoal}</textarea>
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<tr height="40">
		<td width="120" valign="top">목적상세</td>
		<td>
			<textarea style="width: 98%;" rows=10; name="classGoalD">${dto.classGoalD}</textarea>
		</td>
	</tr>
	
	<tr height="40">
		<td width="120" valign="top">프로그램 등록</td>
		<td>
			<button type="button" class="btn-sm" style="background: #ffffff;" data-toggle="modal" data-target="#myModal">등록</button>
		
		  	<!-- Modal -->
		 	<div class="modal fade" id="myModal" role="dialog">
		  	<div class="modal-dialog modal-lg">
		    <div class="modal-content" style="top: 100px;">
		    <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal">&times;</button>
			    <h4 class="modal-title">프로그램 등록하기</h4>
		    </div>
		   
		    <div class="modal-body" style="height: 500px; overflow-y: scroll;">
		    	<table style="line-height: 2em;">
		   			<c:if test="${mode=='created'}">
		    			<c:forEach var="dto" items="${cProgram}">
			          		<tr style="border-bottom: 1px solid #dddddd; margin: 10px 0;">
			          			<td width="40" align="center">
			          				<input type="checkbox" name="proSelect" id="pro${dto.programNum}" value="${dto.programNum}">
			          			</td>
			          			<td width="60" align="center">
			          				<img style="width: 35px; height: 35px;" src="<%=cp%>/uploads/cProgram/${dto.saveFileName}" data-programName="${dto.programName}">
			          			</td>
			          			<td>
			          				<p style="font-weight: bold;">${dto.programName}</p>
			          				<p>${dto.programContent}</p>
			          			</td>
			          		</tr>
			          	</c:forEach>
		          	</c:if>
		          	<c:if test="${mode=='update'}">
			          	<c:forEach var="dto" items="${select}">
			          		<tr style="border-bottom: 1px solid #dddddd; margin: 10px 0;">
			          			<td width="40" align="center">
			          				<input type="checkbox" name="proSelect" id="pro${dto.programNum}" value="${dto.programNum}" checked="checked">
			          			</td>
			          			<td width="60" align="center">
			          			<img style="width: 35px; height: 35px;" src="<%=cp%>/uploads/cProgram/${dto.saveFileName}" data-programName="${dto.programName}">
			          			</td>
			          			<td>
			          				<p style="font-weight: bold;">${dto.programName}</p>
			          				<p>${dto.programContent}</p>
			          			</td>
			          		</tr>
			          	</c:forEach>
			          	<c:forEach var="dto" items="${nonselect}">
			          		<tr style="border-bottom: 1px solid #dddddd; margin: 10px 0;">
			          			<td width="40" align="center">
			          				<input type="checkbox" name="proSelect" id="pro${dto.programNum}" value="${dto.programNum}" data-programName="${dto.programName}">
			          			</td>
			          			<td width="60" align="center">
			          			<img style="width: 35px; height: 35px;" src="<%=cp%>/uploads/cProgram/${dto.saveFileName}">
			          			</td>
			          			<td>
			          				<p style="font-weight: bold;">${dto.programName}</p>
			          				<p>${dto.programContent}</p>
			          			</td>
			          		</tr>
			          	</c:forEach>
			          </c:if>
		          	</table>
		        </div>
		        
		        <div class="modal-footer">
		          <button type="button" class="btn-sm" style="background: #ffffff;" data-dismiss="modal">등록완료</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<!-- 
	<tr id="showpro" style="display: none;">
		<td width="100"></td>
		<td>
			<span id="showproInfo" style="color: tomato;"></span>
		</td>
	</tr>
	<tr height="10px;"></tr>
	 -->
	 
	<tr height="40">
		<td width="120">파일등록</td>
		<td>
			<div class="form-group form_file">
			  <input id="fileName" class="form-control form_point_color01" type="text" title="첨부된 파일명" readonly style="width:430px">
			  <span class="file_load">
			        <input type="file" id="upload" name="upload" onchange="fileChange();">
			        <button type="button" class="btn-sm" style="background: #ffffff; padding: 5px; margin-left: 5px;">파일첨부</button>
			    </span>
			</div>
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td style="color: #666666; font-size: 13px;">
			(최대 10MB이하의 파일이 등록 가능합니다.)
		</td>
	</tr>
	<tr height="10px;"></tr>
	
	<c:if test="${mode=='update'}">
		<tr height="40">
			<td width="120">첨부된파일</td>
			<td>
				${dto.originalFileName}
				<c:if test="${not empty dto.saveFileName}">
					&nbsp;<a href="javascript:deleteFile();">
					<img src="<%=cp%>/resource/images/close_icon.png">
					</a>
				</c:if>
			</td>
		</tr>
		<tr height="10px;"></tr>
	</c:if>
	
	<tr>
		<td width="120">클래스 유형</td>
		<td>
		<c:if test="${mode=='update'}">
			<input type="radio" name="classType" value="0" ${dto.classType=="0"?"checked='checked'":"disabled='disabled'"}>
			<label for="notice"> 온라인 </label>
			
			<input type="radio" name="classType" value="1" ${dto.classType=="1"?"checked='checked'":"disabled='disabled'"}>
			<label for="notice"> 오프라인 </label>
		</c:if>
		<c:if test="${mode=='created'}">
			<input type="radio" name="classType" onclick="selectClassType(0)" value="0">
			<label for="notice"> 온라인 </label>
			
			<input type="radio" name="classType" onclick="selectClassType(1)" value="1">
			<label for="notice"> 오프라인 </label>
		</c:if>
		</td>
	</tr>
	
	</table>
	
	<div id="onInfo" style="width:1000px; display: none;">
		<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0;">
			<tr>
				<td width="120">멘토</td>
				<td>
					<input type="text" name="mento" style="width: 20%; height: 35px;" value="${dto.mento}">
				</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td width="120">수강기간</td>
				<td>
					<c:if test="${mode!='update'}">
					<input type="text" name="onperiod" style="width: 20%; height: 35px;" value="0"> 일
					</c:if>
					<c:if test="${mode=='update'}">
					<input type="text" name="onperiod" style="width: 20%; height: 35px;" value="${dto.onperiod}"> 일
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="offInfo" style="width:1000px; display: none;">
		<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
			<tr>
				<td width="120">코치</td>
				<td>
					<input type="text" name="coach" style="width: 20%; height: 35px;" value="${dto.coach}">
				</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td width="120">수강정원</td>
				<td>
					<c:if test="${mode!='update'}">
					<input type="text" name="offLimit" style="width: 20%; height: 35px;" value="0"> 명
					</c:if>
					<c:if test="${mode=='update'}">
					<input type="text" name="offLimit" style="width: 20%; height: 35px;" value="${dto.offLimit}"> 명
					</c:if>
				</td>
			</tr>
			
			<tr height="10px;"></tr>
			<tr>
		  		<td width="120" valign="top">클래스 장소</td>
		  		<td>
		  			<p>
					<input style="width: 200px; height: 35px;" type="text" readonly="readonly" name="zip" id="sample6_postcode" placeholder="우편번호">
					<button class="btn02" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
		  			</p>
		  			<p style="margin-top: 10px;">
						<input style="width: 300px; height: 35px;" type="text" readonly="readonly" name="location1" id="sample6_address" placeholder="주소" value="${dto.location1}">
						<input style="width: 250px; height: 35px;" type="text" name="location2" id="sample6_address2" placeholder="상세주소" value="${dto.location2}">		  		
		  			</p>
		  		</td>
			</tr>
			
			<tr height="10px;"></tr>
			<tr>
		  		<td width="120" valign="top">클래스 날짜</td>
		  		<td>
				   <input type="text" readonly="readonly" class="classDate" name="startDate" style="width: 200px;" value="${dto.startDate}"> ~ <input type="text" readonly="readonly" style="width: 200px;" class="classDate" name="endDate" value="${dto.endDate}">
		  		</td>
			</tr>
			
			<tr height="10px;"></tr>
			<tr>
		  		<td width="120" valign="top">클래스 시간</td>
		  		<td>
				   <input type="text" name="startTime" style="width: 200px;" value="${dto.startTime}"> ~ <input type="text" name="endTime"  style="width: 200px;" value="${dto.endTime}">
		  		</td>
			</tr>
		</table>
	</div>
	
	<div style="width:1000px; height:1px;  margin: 20px auto 0;border-bottom: 2px solid #666666;"></div>
	<div style="width: 1000px; margin: 20px auto 0;" align="center">
		<button type="button" class="btn-default02" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		<button type="button" class="btn-default02" onclick="javascript:location.href='<%=cp%>/dietClass/list?type=0';">${mode=='update'?'수정취소':'등록취소'}</button>
		<c:if test="${mode=='update'}">
			<input type="hidden" name="classNum" value="${dto.classNum}">
			<input type="hidden" name="classType" value="${dto.classType}">
			<input type="hidden" name="saveFileName" value="${dto.saveFileName}">
			<input type="hidden" name="originalFileName" value="${dto.originalFileName}">
		</c:if>
	</div>
	</form>
</div>
</body>
</html>
