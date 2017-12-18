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
	out="<div class='questionLayout' style='border-bottom: 1px solid #dcdcdc;'>";
	out+="<form name='surveyForm' method='post'>";
	out+="<table id='surveyTb' style='width: 1000px;'>";
	out+="<tr id='' height='55' align='center'>";
	out+="<td width='100'>";
	out +="<span class='qOrder' style='font-size: 16px; font-weight: bold;'>3</span>&nbsp;&nbsp;";
	out +="<input type='hidden' name='qOrder'>";
	out +="</td>";
	out +="<td align='left'>";
	out +="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>";
    out +="</td>";
    out +="<td width='180'>";
    out +="<img class='btnLast' src='<%=cp%>/resource/images/downdown.png'>";
    out +="<img class='btnNext' src='<%=cp%>/resource/images/down.png'>";
    out +="<img class='btnPrev' src='<%=cp%>/resource/images/up.png'>";
    out +="<img class='btnFirst' src='<%=cp%>/resource/images/upup.png'>";
    out +="</td>";
    out +="<td width='60'>";
    out +="<img src='<%=cp%>/resource/images/bin.png' onclick='deleteQuestion(this)'>";
    out +="</td>";
    out +="</tr>";
    out +="<tr height='55' align='center'>";
    out +="<td></td>";
    out +="<td align='left'>";
    out +="<span>보기-</span><span class='exOrder'>1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='ex' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
    out +="<img id='' style='width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/plus2.png' onclick='addEx(this);'>";
    out +="</td>";
    out +="</tr>";
    out +="</table>";
    out +="</form>";
    out +="</div>";
	
	$('#questionContainer').append(out);
    questionReNo();
}


// 주관식 문제 추가
function subjectiveAdd() {
	
	var out;
	out="<div class='questionLayout' style='border-bottom: 1px solid #dcdcdc;'>";
	out+="<form name='surveyForm' method='post'>";
	out+="<table id='surveyTb' style='width: 1000px;'>";
	out+="<tr height='55' align='center' style='padding: 20px auto 20px;'>";
	out+="<td width='100'>";
	out +="<span class='qOrder' style='font-size: 16px; font-weight: bold;'>3</span>&nbsp;&nbsp;";
	out +="<input type='hidden' name='qOrder'>";
	out+="</td>";
	out+="<td align='left'>";
	out+="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>";
	out+="</td>";
	out+="<td width='180'>";
	out+="<img class='btnLast' src='<%=cp%>/resource/images/downdown.png'>";
	out+="<img class='btnNext' src='<%=cp%>/resource/images/down.png'>";
	out+="<img class='btnPrev' src='<%=cp%>/resource/images/up.png'>";
	out+="<img class='btnFirst' src='<%=cp%>/resource/images/upup.png'>";
	out+="</td>";
	out+="<td width='60'>";
	out+="<img src='<%=cp%>/resource/images/bin.png' onclick='deleteQuestion(this)'>";
	out+="</td>";
	out+="</tr>";
	out+="</table>";
	out+="</form>";    	
	out+="</div>";
	
	$('#questionContainer').append(out);
	questionReNo();
}

function questionReNo() {
	var no=1;
	$("#questionContainer .qOrder").each(function() {
		$(this).text(no);
		$(this).siblings("input[name=qOrder]").val(no);
		no++;
	});
}

function exReNo() {
	var no=1;
	$("#questionContainer .exOrder").each(function() {
		$(this).text(no);
		$(this).siblings("input[name=exOrder]").val(no);
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
		var $div = $(this).closest('.questionLayout');
		$div.prev().before($div);
		
		questionReNo();
	});
	
	$("body").on("click",".btnNext", function() {
		var $div = $(this).closest('.questionLayout');
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
	if(confirm("문항을 삭제 하시겠습니까 ?")){
		$(f).closest("div").remove();
		questionReNo();
	}
	
	// 테이블에 저장되지 않은 경우
	
	
	// 해당 문항 삭제
	
}

function addEx(t) {
	var out = "";
	out += "<tr height='55' align='center'>";
	out += "<td></td>";
	out += "<td align='left'>";
	out += "<span>보기-</span><span class='exOrder'>1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
	out += "<img style='width: 20px; height: 20px; margin-left: 18px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/minus2.png' onclick='removeEx(this);'>";
	out += "</td>";
	
	$(t).closest("table").append(out);
	exReNo();
}

function removeEx(p) {
	//location.href="<%=cp%>/mission/delete?num=${dto.classNum}&index="+index+"&day="+day;
	$(p).closest("tr").remove();
	exReNo();
}

</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">
	<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">설문 등록</div>
	<div style="float: right;">
         <button type="button" class="btn-default02" onclick="objectiveAdd();">+객관식 추가</button>
         <button type="button" class="btn-default02" onclick="subjectiveAdd();">＋주관식 추가</button>
    </div>
	<div style="width:1000px; height:1px;  margin: 40px auto 0;border-bottom: 2px solid #666666;"></div>

	<table style="width: 1000px;">
				<tr height="40" style="font-size: 16px; font-weight: bold; background: rgb(241,241,241); border-bottom: 1px solid #666666;" align="center">
					<td width="100">번호</td>
					<td>내용</td>
					<td width="180">순서변경</td>
					<td width="60">삭제</td>
				</tr>
	</table>
	
	
	<div id="questionContainer">
    	<div class='questionLayout' style="border-bottom: 1px solid #dcdcdc;">
			<form name="surveyForm" method="post">
				<table id="surveyTb" style="width: 1000px;">
				<tr height="55" align="center">
                    <td width="100">
                        <span class='qOrder' style="font-size: 16px; font-weight: bold;">1</span>&nbsp;&nbsp;
		                <input type='hidden' name='qOrder'>
                    </td>
                    <td align="left">
                    	질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>
                    </td>
                    <td width="180">
                        <img class="btnLast" src="<%=cp%>/resource/images/downdown.png">
                        <img class="btnNext" src="<%=cp%>/resource/images/down.png">
                        <img class="btnPrev" src="<%=cp%>/resource/images/up.png">
                        <img class="btnFirst" src="<%=cp%>/resource/images/upup.png">
                    </td>
                    <td width="60">
                    <img src="<%=cp%>/resource/images/bin.png" onclick="deleteQuestion(this)">
                    </td>
                 </tr>
				</table>
			</form>
		</div>
		<div class='questionLayout' style="border-bottom: 1px solid #dcdcdc;">
			<form name="surveyForm" method="post">
				<table id="surveyTb" style="width: 1000px;">
				<tr id="" height="55" align="center">
                    <td width="100">
                        <span class='qOrder' style="font-size: 16px; font-weight: bold;">2</span>&nbsp;&nbsp;
		                <input type='hidden' name='qOrder'>
                    </td>
                    <td align="left">
                    	질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='question' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>
                    </td>
                    <td width="180">
                        <img class="btnLast" src="<%=cp%>/resource/images/downdown.png">
                        <img class="btnNext" src="<%=cp%>/resource/images/down.png">
                        <img class="btnPrev" src="<%=cp%>/resource/images/up.png">
                        <img class="btnFirst" src="<%=cp%>/resource/images/upup.png">
                    </td>
                    <td width="60">
                    <img src="<%=cp%>/resource/images/bin.png" onclick="deleteQuestion(this)">
                    </td>
                 </tr>
                 <tr height="55" align="center">
                 <td></td>
                 <td align="left">
                   	<span>보기-</span><span class="exOrder">1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='ex' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>
                   	<input type="hidden" name="exOrder">
                   	<img id="" style="width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;" src="<%=cp%>/resource/images/plus2.png" onclick="addEx(this);">
                 </td>
                 </tr>
				</table>
			</form>
		</div>
	</div>
	
	
	<div style="width:1000px; height:1px;  margin: 0 auto 0;border-bottom: 2px solid #666666;"></div>
</div>