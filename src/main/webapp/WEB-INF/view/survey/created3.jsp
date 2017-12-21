<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function() {
	objectiveAdd();
});

function objectiveAdd() {
	//설문번호
	var qNum = questionReNo();
	//보기번호 : 1
	var exNum = exReNo();
	
	var out;
	out="<div class='questionLayout' style='border-bottom: 1px solid #dcdcdc;'>";
	//out+="<form name='surveyForm' method='post'>";
	out+="<table class='surveyTb' style='width: 1100px;'>";
	out+="<tr id='' height='55' align='center'>";
	out+="<td width='100'>";
	out +="<span class='qOrder' style='font-size: 16px; font-weight: bold;'>3</span>&nbsp;&nbsp;";
	out +="<input type='hidden' name='qOrder"+qNum+".'>";
	out +="<input type='hidden' name='sOrO"+qNum+".' value='0'>";
	out +="</td>";
	out +="<td width='120'>";
	out +="<select name='qType"+qNum+".' style='height: 30px;'>";
	out +="<option value='pro'>전문성</option>";
	out +="<option value='afford'>여유(시간)</option>";
	out +="<option value='habits'>식습관</option>";
	out +="<option value='will'>의지</option>";
	out +="</select>";
	out +="</td>";
	out +="<td align='left'>";
	out +="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='qContent"+qNum+".' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>";
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
    out +="<td colspan='2'></td>";
    out +="<td align='left'>";
    out +="<input type='hidden' name='exOrder"+qNum+"."+exNum+"' value='1'>";
    out +="<span>보기-</span><span class='exOrder'>1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='exContent"+qNum+"."+exNum+"' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
    out +="<img class='addEx' id='' style='width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/plus2.png'>";
    out +="</td>";
    out +="<td> 점수 : ";
    out +="<select name='exScore"+qNum+"."+exNum+"'>";
    out +="<option value='5'>5</option>";
    out +="<option value='10'>10</option>";
    out +="<option value='15'>15</option>";
    out +="<option value='20'>20</option>";
    out +="</select>";
    out +="</td>";
    out +="</tr>";
    out +="</table>";
    //out +="</form>";
    out +="</div>";
	
	$('#questionContainer').append(out);
    questionReNo();
}


// 주관식 문제 추가
function subjectiveAdd() {
	//설문번호
	var qNum = questionReNo();
	
	var out;
	out="<div class='questionLayout' style='border-bottom: 1px solid #dcdcdc;'>";
	//out+="<form name='surveyForm' method='post'>";
	out+="<table class='surveyTb' style='width: 1100px;'>";
	out+="<tr height='55' align='center' style='padding: 20px auto 20px;'>";
	out+="<td width='100'>";
	out +="<span class='qOrder' style='font-size: 16px; font-weight: bold;'>3</span>&nbsp;&nbsp;";
	out +="<input type='hidden' name='qOrder"+qNum+".'>";
	out +="<input type='hidden' name='sOrO"+qNum+".' value='1'>";
	out+="</td>";
	out +="<td width='120'></td>";
	out+="<td align='left'>";
	out+="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='qContent"+qNum+".' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>";
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
	//out+="</form>";    	
	out+="</div>";
	
	$('#questionContainer').append(out);
	questionReNo();
}


function questionReNo() {
	var no=1;
	$("#questionContainer .qOrder").each(function() {
		if(no%2==0)
			$(this).parents('.questionLayout').css('background-color', '#eeeeee');
		else
			$(this).parents('.questionLayout').css('background-color', '#ffffff');
		$(this).text(no);
		$(this).siblings("input[name*=qOrder]").val(no);
		$(this).siblings("input[name*=qOrder]").attr('name','qOrder'+no+".");
		$(this).siblings("input[name*=sOrO]").attr('name','sOrO'+no+".");
		$(this).parent().siblings().children("select[name*=qType]").attr('name','qType'+no+".");
		$(this).parent().siblings().next().children("input[name*=qContent]").attr('name','qContent'+no+".");
	
		no++;
	});
	
	return no;
}


function exReNo(d){
	var no=1;
	var qNum = $(d).closest('.questionLayout').children().children().children().children().children(".qOrder").html();
	
	$(d).closest(".questionLayout").find('.exOrder').each(function() {
		$(this).text(no);
		$(this).siblings("input[name*=exOrder]").val(no);
		$(this).siblings("input[name*=exOrder]").attr('name','exOrder'+qNum+"."+no);
		$(this).siblings("input[name*=exContent]").attr('name','exContent'+qNum+"."+no);
		$(this).parent().next().children("select[name*=exScore]").attr('name','exScore'+qNum+"."+no);
		var dd = $(this).parent().next().children("select[name*=exScore]");
		
		console.log(dd);
		no++;
	});
	return no;
}

$(function() {
	$("body").on("click",".btnFirst", function() {
		var $div = $(this).closest('.questionLayout');
		$('#questionContainer').find('.questionLayout:first').before($div);
		
		questionReNo();
		exReNo(this);
	});
	
	$("body").on("click", ".btnPrev", function() {
		var $div = $(this).closest('.questionLayout');
		$div.prev().before($div);
		
		questionReNo();
		exReNo(this);
	});
	
	$("body").on("click",".btnNext", function() {
		var $div = $(this).closest('.questionLayout');
		$div.next().after($div);
		
		questionReNo();
		exReNo(this);
	});
	
	$("body").on("click",".btnLast", function() {
		var $div = $(this).closest('.questionLayout');
		$('#questionContainer').find('.questionLayout:last').after($div);
		
		questionReNo();
		exReNo(this);
	});
	
	$("body").on("click",".removeEx", function() {
		var $div = $(this).parent().parent().parent().children();
		$(this).closest('tr').remove();
		exReNo($div);
	});

	$("body").on("click",".addEx", function() {
		var out = "";
		var qNum = $(this).parent().parent().prev().children().children("input[name*=qOrder]").val();
		var exNum = exReNo(this);
		
		out += "<tr height='55' align='center'>";
		out += "<td colspan='2'></td>";
		out += "<td align='left'>";
		out += "<input type='hidden' name='exOrder"+qNum+"."+exNum+"'>";
		out += "<span>보기-</span><span class='exOrder'>1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='exContent"+qNum+"."+exNum+"' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
		out += "<img class='removeEx' style='width: 20px; height: 20px; margin-left: 18px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/minus2.png'>";
		out += "</td>";
		out +="<td> 점수 : ";
	    out +="<select name='exScore"+qNum+"."+exNum+"'>";
	    out +="<option value='5'>5</option>";
	    out +="<option value='10'>10</option>";
	    out +="<option value='15'>15</option>";
	    out +="<option value='20'>20</option>";
	    out +="</select>";
	    out +="</td>";
		
		$(this).closest("table").append(out);
		exReNo(this);
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

function surveySubmit() {
	$("#count").val(questionReNo()-1);
	
	var f = $("form[name=surveyAll]").serialize();
	var url="<%=cp%>/survey/submit";
	
	alert(f);
	
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("설문등록완료");
			}
		}
	    ,error:function(e) {
	    	alert("설문등록실패");
	    	console.log(e.responseText);
	    }
	});
}
</script>
<div class="body-container" style="width: 1100px; margin: 100px auto;">
	<div style="font-size: 40px; width: 1100px; margin: 20px auto 0; font-weight: bold; color: #666666;">설문 등록</div>
	<div style="float: right;">
         <button type="button" class="btn-default02" onclick="objectiveAdd();">+객관식 추가</button>
         <button type="button" class="btn-default02" onclick="subjectiveAdd();">＋주관식 추가</button>
    </div>
	<div style="width:1100px; height:1px;  margin: 40px auto 0;border-bottom: 2px solid #666666; border-collapse: collapse;"></div>

	<table style="width: 1100px; border-bottom: 1px solid #666666; border-collapse: collapse;">
				<tr height="40" style="font-size: 16px; font-weight: bold; background: rgb(241,241,241);" align="center">
					<td width="100">번호</td>
					<td width="120">질문유형</td>
					<td>내용</td>
					<td width="180">순서변경</td>
					<td width="60">삭제</td>
				</tr>
	</table>
	
	<form action="" name="surveyAll" method="post">
	<input type="hidden" name="count" id="count">
	
	<div id="questionContainer">
	<%-- 
    	<div class='questionLayout' style="border-bottom: 1px solid #dcdcdc;">
				<table class="surveyTb" style="width: 1100px;">
				<tr height="55" align="center">
                    <td width="100">
                        <span class='qOrder' style="font-size: 16px; font-weight: bold;">1</span>&nbsp;&nbsp;
		                <input type='hidden' name='qOrder' value="1">
		                <input type='hidden' name='sOrO' value="1">
                    </td>
                    <td width="120"></td>
                    <td align="left">
                    	질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='qContent' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>
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
		</div>
		 --%>
		<%-- <div class='questionLayout' style="border-bottom: 1px solid #dcdcdc;">
				<table class="surveyTb" style="width: 1100px;">
				<tr id="" height="55" align="center">
                    <td width="100">
                        <span class='qOrder' style="font-size: 16px; font-weight: bold;">2</span>&nbsp;&nbsp;
		                <input type='hidden' name='qOrder' value="2">
		                <input type='hidden' name='sOrO' value="0">
                    </td>
                    <td width="120">
                    	<select name="qType" style="height: 30px;">
                    		<option value="pro">전문성</option>
                    		<option value="afford">여유(시간)</option>
                    		<option value="habits">식습관</option>
                    		<option value="will">의지</option>
                    	</select>
                    </td>
                    <td align="left">
                    	질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='qContent' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>
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
                 <td colspan="2"></td>
                 <td align="left">
                   	<span>보기-</span><span class="exOrder">1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='exContent' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>
                   	<input type="hidden" name="exOrder" value="1">
                   	<img id="" style="width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;" src="<%=cp%>/resource/images/plus2.png" onclick="addEx(this);">
                 </td>
                 <td> 점수 : 
                 	<select name="exScore">
                 		<option value="0">0</option>
                 		<option value="5">5</option>
                 		<option value="10">10</option>
                 		<option value="15">15</option>
                 		<option value="20">20</option>
                 	</select>
                 </td>
                 </tr>
				</table>
		</div> --%>
	</div>
	</form>
	
	<div style="width:1100px; height:1px;  margin: 0 auto 0;border-bottom: 2px solid #666666;  border-collapse: collapse;"></div>
	<div style="width: 1100px; margin: 20px auto 0;" align="center">
		<button type="button" class="btn-default02" onclick="surveySubmit();">${mode=='update'?'수정완료':'등록하기'}</button>
	</div>
</div>