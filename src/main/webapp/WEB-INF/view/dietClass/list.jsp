<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function on(num) {
	$("#ct"+num).mouseover(function (e){
        $("#ctd"+num).show();
    });
    
    $("#ct"+num).mouseout(function (e){
        $("#ctd"+num).hide();
    });
}
function classNotice() {
	swal("Write something here:", {
		  content: "input",
		})
		.then((value) => {
		  swal(${value});
		});
}
function articleGo(num) {
	location.href="<%=cp%>/dietClass/articleOn?num="+num;
}

function AddComma(data_value) {

    var txtNumber = '' + data_value;    // 입력된 값을 문자열 변수에 저장합니다.

    if (isNaN(txtNumber) || txtNumber == "") {    // 숫자 형태의 값이 정상적으로 입력되었는지 확인합니다.
        alert("숫자만 입력 하세요");
        return;
    }

    else {
        var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');    // 정규식 형태 생성
        var arrNumber = txtNumber.split('.');    // 입력받은 숫자를 . 기준으로 나눔. (정수부와 소수부분으로 분리)
        arrNumber[0] += '.'; // 정수부 끝에 소수점 추가

        do {
            arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2'); // 정수부에서 rxSplit 패턴과 일치하는 부분을 찾아 replace 처리
        } while (rxSplit.test(arrNumber[0])); // 정규식 패턴 rxSplit 가 정수부 내에 있는지 확인하고 있다면 true 반환. 루프 반복.

        if (arrNumber.length > 1) { // txtNumber를 마침표(.)로 분리한 부분이 2개 이상이라면 (즉 소수점 부분도 있다면)
            return arrNumber.join(''); // 배열을 그대로 합칩. (join 함수에 인자가 있으면 인자를 구분값으로 두고 합침)
        }
        else { // txtNumber 길이가 1이라면 정수부만 있다는 의미.
            return arrNumber[0].split('.')[0]; // 위에서 정수부 끝에 붙여준 마침표(.)를 그대로 제거함.
        }
    }
}
</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">
	<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/dietClass/created'" style="float: right; width: 80px;">글올리기</button>
	<div style="height: 30px;"></div>
	<c:forEach var="dto" items="${onClass}">
    <table id="ct${dto.classNum}" onmouseover="on(${dto.classNum});" style="width: 1000px; height:420px; border-spacing: 0; border-collapse: collapse; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc; margin: 20px 0;">
    <tr>
    	<td style="width: 280px; overflow: hidden;">
    	<img align="right" style="width:100%; height: 425px;" src="<%=cp%>/uploads/dietClass/${dto.saveFileName}">
    	</td>
    	<td valign="top" style="padding: 35px 20px;" width="300px;">
    	<p><b style="font-size: 30px;">${dto.className}</b></p>
    	<b style="color: #ff6699; font-size: 20px;">${dto.classGoal}</b><br><br>
    	<span><b style="color: #333333;">${dto.classGoalD}</b></span>
    	<br>
    	<div id="ctd${dto.classNum}" style="display: none; margin: 20px;">
    		<span style="color: #1abc9c; cursor: pointer; font-size: 16px; font-weight: bold;" onclick="articleGo(${dto.classNum})">자세히 보러가기>></span>
    	</div>
    	</td>
    	<td style="background: #e3e3e3; width: 250px; color: black;" align="center">
	    	<div align="center" style="height: 340px;">
	    		<table style="width: 90%; margin: 35px 15px; line-height: 2em; resize: none;">
		    		<tr>
		    			<td>
		    			<%-- 
		    				<c:if test="#">
		    				<span style="background: #333333; color: #ffffff; font-size: 20px;">마감</span>
		    				</c:if>
		    			 --%>
		    				<span style="background: #ff6600; color: #ffffff; font-size: 20px;">진행중</span>
		    			</td>
		    		</tr>
		    		<tr height="20px;"></tr>
		    		<tr>
		    			<th width="35%">멘토</th>
		    			<td align="left" style="padding-left: 5px;">${dto.mento} 님</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">운동강도</th>
		    			<c:if test="${dto.cllevel==1}">
		    			<td align="left" style="padding-left: 5px;">상</td>
		    			</c:if>
		    			<c:if test="${dto.cllevel==2}">
		    			<td align="left" style="padding-left: 5px;">중</td>
		    			</c:if>
		    			<c:if test="${dto.cllevel==3}">
		    			<td align="left" style="padding-left: 5px;">하</td>
		    			</c:if>
		    		</tr> 
		    		<tr>
		    			<th width="35%">수강기간</th>
		    			<td align="left" style="padding-left: 5px;">${dto.onperiod}일</td>
		    		</tr>
		    		<tr>
		    			<th width="35%">수강료</th>
		    			<td align="left" style="padding-left: 5px;">${dto.showTuition}</td>
		    		</tr>
	    		</table>
	    	</div>
	   		<div style="vertical-align: bottom;">
	   		<!-- 
	   		<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="classNotice();">클래스 알림받기</button>
	    	 -->
	    	<button type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="#">수강 신청하기</button>
	   		</div>
    	</td>
    </tr>
    </table>
    </c:forEach>
    </div>
	