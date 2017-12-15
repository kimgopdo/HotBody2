<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function objectiveAdd() {
	
	var out;
	out="<div class='questionLayout'>";
	out+="<form name='questionForm' method='post'>";
	out+="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
	out+="<tr style='border-bottom: 1px solid #cccccc;'>";
	out+="<td colspan='2'>";
	out+="<div style='float: left; padding: 5px;'>";
	out+="  <span class='questionNo'>1</span><span>번 : 객관식 문항</span>&nbsp;&nbsp;";
	out+="  <input type='hidden' name='questionNo'>";
	out+="  <input type='checkbox' name='required' value='1'>&nbsp;<label>필수응답</label>";
	out+="</div>";
	out+="<div style='float: right; padding: 5px;'>";
	out+="  <button type='button' class='btn-default02 btnLast'>▼</button>";
	out+="  <button type='button' class='btn-default02 btnNext'>▽</button>";
	out+="  <button type='button' class='btn-default02 btnPrev'>△</button>";
	out+="  <button type='button' class='btn-default02 btnFirst'>▲</button>";
	out+="  <button type='button' class='btn-default02' onclick='deleteQuestion(this.form)'>문항삭제</button>";
	out+="</div>";
	out+="</td>";
	out+="</tr>";
	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
	out+="<td width='100' bgcolor='#eeeeee' style='padding-left:5px;'>";
	out+="응답방식";
	out+="</td>";
	out+="<td style='padding-left:5px;'>";
	out+="<input type='radio' name='answerType' value='1' checked='checked'>&nbsp;<label>단일선택</label>&nbsp;&nbsp;";
	out+="<input type='radio' name='answerType' value='2'>&nbsp;<label>다중선택</label>&nbsp;&nbsp;";
	out+="</td>";
	out+="</tr>";
	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
	out+="<td width='100' valign='top' bgcolor='#eeeeee' style='padding-top:10px; padding-left:5px;'>";
	out+="질문 내용";
	out+="</td>";
	out+="<td style='padding:5px;'>";
	out+="<p><input type='text' name='question' class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>";
	out+="<p style='padding-top:10px; padding-left: 25px;'><input type='text' name='items' class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'></p>";
	out+="</td>";
	out+="</tr>";
	out+="<tr height='43'>";
	out+="<td width='100'>&nbsp;</td>";
	out+="<td style='padding: 5px;'>";
	out+="<button type='button' class='btn-default02' onclick='sendQuestion(this.form)'>문항 등록</button>";
	out+="</td>";
	out+="</tr>";
	out+="</table>";
	out+="</form>";
	out+="</div>";
	
	$('#questionContainer').append(out);
}

// 주관식 문제 추가
function subjectiveAdd() {
	
	var out;
	out="<div class='questionLayout'>";
	out+="<form name='surveyForm' method='post'>";
	out+="<table id='surveyTb' style='width: 1000px;'>";
	out+="<tr height='55' align='center' style='padding: 20px auto 20px;'>";
	out+="<td width='100'>";
	out+="  <span class='questionNo' style='font-size: 16px; font-weight: bold;'>1</span>&nbsp;&nbsp;<input type='hidden' name='pCode'>";
	out+="</td>";
	out+="<td>";
	out+="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:85%; height: 30px;' placeholder='질문을 입력 하세요'>";
	out+="</td>";
	out+="<td width='180'>";
	out+="<img class='btnLast' src='<%=cp%>/resource/images/downdown.png'>";
	out+="<img class='btnLast' src='<%=cp%>/resource/images/down.png'>";
	out+="<img class='btnLast' src='<%=cp%>/resource/images/up.png'>";
	out+="<img class='btnLast' src='<%=cp%>/resource/images/upup.png'>";
	out+="</td>";
	out+="<td width='60'>";
	out+="<img src='<%=cp%>/resource/images/bin.png' onclick='deletequestion(this.form)'>";
	out+="</td>";
	out+="</tr>";
	out+="</table>";
	out+="</form>";    	
	out+="</div>";
	
	$('#questionContainer').append(out);
}

function questionReNo() {
	var no=1;
	$("#questionContainer .questionNo").each(function() {
		$(this).text(no);
		$(this).siblings("input[name=questionNo]").val(no);
		no++;
	});
}

$(function() {
	$("body").on("click",".btnFirst", function() {
		var $div = $(this).closest('.questionLayout');
		$('#questionContainer').find('.questionLayout:first').before($div);
		
		questionReNo();
	});
	
	$("body").on("click", ".btnPrev", function() {
		$div.prev().before($div);
		
		questionReNo();
	});
	
	$("body").on("click",".btnNext", function() {
		$div.next().after($div);
		
		questionReNo();
	});
	
	$("body").on("click",".btnLast", function() {
		var $div = $(this).closest('.questionLayout');
		$('#questionContainer').find('.questionLayout:last').after($div);
		
		questionReNo();
	});
});

//설문에 대한 문항(질문) 삭제
function deleteQuestion(f) {
	if(! confirm("문항을 삭제 하시 겠습니까 ? "))
		return;
	
	// 테이블에 저장되지 않은 경우
	if(f.questionNum == undefined || f.questionNum.value==0) {
		$(f).parent(".questionLayout").remove();
		return;
	}
	
	// 해당 문항 삭제
	
}

function addEx(t) {
	var out = "";
	out += "<tr height='55' align='center'>";
	out += "<td></td>";
	out += "<td align='left'>";
	out += "보기-1 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
	out += "<img id='' style='width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/plus2.png' onclick='addEx(this);'>";
	out += "</td>";
	alert(out);
	$("#dd").append(out);
}
</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">
	<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">설문 등록</div>
	<div style="float: right;">
         <button type="button" class="btn-default02" onclick="objectiveAdd();">+객관식 추가</button>
         <button type="button" class="btn-default02" onclick="subjectiveAdd();">＋주관식 추가</button>
    </div>
	<div style="width:1000px; height:1px;  margin: 40px auto 0;border-bottom: 2px solid #666666;"></div>
	<!-- 내용 -->
	
	
	
	<div id="questionContainer">
    	<div class='questionLayout'>
			<form name="surveyForm" method="post">
				<table id="surveyTb" style="width: 1000px;">
				<tr height="40" style="font-size: 16px; font-weight: bold; background: rgb(241,241,241); border-bottom: 1px solid #666666;" align="center">
					<td width="100">번호</td>
					<td>내용</td>
					<td width="180">순서변경</td>
					<td width="60">삭제</td>
				</tr>
				<tr height="55" align="center">
                    <td>
                        <span class='questionNo' style="font-size: 16px; font-weight: bold;">1</span>&nbsp;&nbsp;
                        <input type='hidden' name='pCode'>
                    </td>
                    <td align="left">
                    	질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>
                    </td>
                    <td>
                        <img class="btnLast" src="<%=cp%>/resource/images/downdown.png">
                        <img class="btnNext" src="<%=cp%>/resource/images/down.png">
                        <img class="btnPrev" src="<%=cp%>/resource/images/up.png">
                        <img class="btnFirst" src="<%=cp%>/resource/images/upup.png">
                    </td>
                    <td>
                    <img src="<%=cp%>/resource/images/bin.png" onclick="deletequestion(this.form)">
                    </td>
                 </tr>
                 <tr id="" height="55" align="center">
                    <td>
                        <span class='questionNo' style="font-size: 16px; font-weight: bold;">2</span>&nbsp;&nbsp;
                        <input type='hidden' name='pCode'>
                    </td>
                    <td align="left">
                    	질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>
                    </td>
                    <td>
                        <img class="btnLast" src="<%=cp%>/resource/images/downdown.png">
                        <img class="btnNext" src="<%=cp%>/resource/images/down.png">
                        <img class="btnPrev" src="<%=cp%>/resource/images/up.png">
                        <img class="btnFirst" src="<%=cp%>/resource/images/upup.png">
                    </td>
                    <td>
                    <img src="<%=cp%>/resource/images/bin.png" onclick="deletequestion(this.form)">
                    </td>
                 </tr>
                 <tr id="dd" height="55" align="center">
                 <td></td>
                 <td align="left">
                   	보기-1 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>
                   	<img id="" style="width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;" src="<%=cp%>/resource/images/plus2.png" onclick="addEx(this);">
                 </td>
                 </tr>
	                 
				</table>
			</form>
		</div>
	</div>
	
	<div style="width:1000px; height:1px;  margin: 0 auto 0;border-bottom: 2px solid #666666;"></div>
</div>