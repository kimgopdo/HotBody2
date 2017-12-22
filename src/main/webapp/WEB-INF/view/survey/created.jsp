<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
var count = "${count}";

$(function() {
	objectiveAdd();
});

function objectiveAdd() {
	
	$("#questionContainer").empty();
	//설문번호
	//보기번호 : 1
	var exNum = exReNo();
	
	var out;
	out="<div class='questionLayout' style='border-bottom: 1px solid #dcdcdc;'>";
	out+="<table class='surveyTb' style='width: 1100px;'>";
	out+="<tr id='' height='55' align='center'>";
	out +="<input type='hidden' name='questionOrder' id='questionOrder' value=''>";
	out +="<input type='hidden' name='soro' value='0'>";
	out +="<td width='120'>";
	out +="<select name='questionType' style='height: 30px;'>";
	out +="<option value='pro'>전문성</option>";
	out +="<option value='afford'>여유(시간)</option>";
	out +="<option value='habits'>식습관</option>";
	out +="<option value='will'>의지</option>";
	out +="</select>";
	out +="</td>";
	out +="<td align='left'>";
	out +="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='questionContent' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>";
    out +="</td>";
    out +="<td width='100'>";
    out +="</td>";
    out +="</tr>";
    out +="<tr height='55' align='center'>";
    out +="<td></td>";
    out +="<td align='left'>";
    out +="<input type='hidden' name='exOrder' value='1'>";
    out +="<span>보기-</span><span class='exOrder'>1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='exContent' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
    out +="<img class='addEx' id='' style='width: 20px; height: 20px; margin-left: 15px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/plus2.png'>";
    out +="</td>";
    out +="<td> 점수 : ";
    out +="<select name='exScore'>";
    out +="<option value='5'>5</option>";
    out +="<option value='10'>10</option>";
    out +="<option value='15'>15</option>";
    out +="<option value='20'>20</option>";
    out +="</select>";
    out +="</td>";
    out +="</tr>";
    out +="</table>";
    out +="</div>";
	
	$('#questionContainer').append(out);
}


// 주관식 문제 추가
function subjectiveAdd() {
	$("#questionContainer").empty();
	//설문번호
	
	var out;
	out="<div class='questionLayout' style='border-bottom: 1px solid #dcdcdc;'>";
	out+="<table class='surveyTb' style='width: 1100px;'>";
	out+="<tr height='55' align='center' style='padding: 20px auto 20px;'>";
	out +="<input type='hidden' name='questionOrder' id='questionOrder' value=''>";
	out +="<input type='hidden' name='soro' value='1'>";
	out +="<td width='120'></td>";
	out+="<td align='left'>";
	out+="질문 : &nbsp;&nbsp;&nbsp;<input type='text' name='questionContent' style='width:90%; height: 30px; margin-left: 10px;' placeholder='질문을 입력 하세요'>";
	out+="</td>";
	out+="<td width='100'>";
	out+="</td>";
	out+="</tr>";
	out+="</table>";
	out+="</div>";
	
	$('#questionContainer').append(out);
}


function exReNo(d){
	var no=1;
	var qNum = $(d).closest('.questionLayout').children().children().children().children().children(".questionOrder").html();
	
	$(d).closest(".questionLayout").find('.exOrder').each(function() {
		$(this).text(no);
		$(this).siblings("input[name*=exOrder]").val(no);
		no++;
	});
	return no;
}


$(function() {
	$("body").on("click",".removeEx", function() {
		var $div = $(this).parent().parent().parent().children();
		$(this).closest('tr').remove();
		exReNo($div);
	});

	$("body").on("click",".addEx", function() {
		var out = "";
		var qNum = $(this).parent().parent().prev().children().children("input[name*=questionOrder]").val();
		var exNum = exReNo(this);
		
		out += "<tr height='55' align='center'>";
		out += "<td></td>";
		out += "<td align='left'>";
		out += "<input type='hidden' name='exOrder'>";
		out += "<span>보기-</span><span class='exOrder'>1</span> : &nbsp;&nbsp;&nbsp;<input type='text' name='exContent' style='width:85%; height: 30px;' placeholder='보기를 입력 하세요'>";
		out += "<img class='removeEx' style='width: 20px; height: 20px; margin-left: 18px; cursor: pointer; margin-top: 5px;' src='<%=cp%>/resource/images/minus2.png'>";
		out += "</td>";
		out +="<td> 점수 : ";
	    out +="<select name='exScore'>";
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
function deleteQuestion(num) {
	if(confirm("문항을 삭제 하시겠습니까 ?")){
		
		var f = "questionOrder="+num;
		var url = "<%=cp%>/survey/delete";
		
		alert(f);
		$.ajax({
			type:"post"
			,url:url
			,data: f
			,dataType:"json"
			,success:function(data) {
				if(data.state=="true"){
					alert("삭제완료");
				}
				location.reload();
			}
		    ,error:function(e) {
		    	alert("삭제실패");
		    	console.log(e.responseText);
		    }
		});
	}
	
}

function reOrder(num,type) {
	var f = "questionOrder="+num+"&type="+type;
	var url = "<%=cp%>/survey/updateOrder";
	
	alert(f);
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				alert("수정완료");
			} else if(data.state=="first"){
				alert("첫번째 설문입니다.");
			} else if(data.state=="last"){
				alert("마지막 설문입니다.");
			}
			location.reload();
		}
	    ,error:function(e) {
	    	alert("수정실패");
	    	console.log(e.responseText);
	    }
	});
}

function surveySubmit() {
	document.getElementById("questionOrder").value=count;
	
	var f = $("form[name=surveyform]").serialize();
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
				count++;
			}
			location.reload();
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
					<td width="120">질문유형</td>
					<td>내용</td>
					<td width="100"></td>
				</tr>
	</table>
	
	<form action="" name="surveyform" method="post">
	
	<div id="questionContainer">
	</div>
	
	</form>
	
	<div style="width:1100px; height:1px;  margin: 0 auto 0;border-bottom: 2px solid #666666;  border-collapse: collapse;"></div>
	<div style="width: 1100px; margin: 20px auto 0;" align="center">
		<button type="button" class="btn-default02" onclick="surveySubmit();">${mode=='update'?'수정완료':'등록하기'}</button>
	</div>
	
	<div id="questionRContainer" style="margin-top: 50px;">
		<c:forEach var="dto" items="${surveyList}">
		
		
			<c:if test="${dto.soro==1}">
			<div style="border: 1px solid; padding: 10px; border-radius: 4px; margin-top: 20px;">
			<table style="width: 1060px; border-radius: 4px; margin: 10px;">
				<tr height="40" style="font-size: 20px; font-weight: bold; color: #679467;" align="left">
						<td>Q. ${dto.questionOrder}</td>
						<td width="160">
                        <img src="<%=cp%>/resource/images/downdown.png" onclick="reOrder('${dto.questionOrder}',1)">
                       <img src="<%=cp%>/resource/images/down.png" onclick="reOrder('${dto.questionOrder}',2)">
                       <img src="<%=cp%>/resource/images/up.png" onclick="reOrder('${dto.questionOrder}',3)">
                       <img src="<%=cp%>/resource/images/upup.png" onclick="reOrder('${dto.questionOrder}',4)">
	                    </td>
	                    <td width="60">
	                    <img src="<%=cp%>/resource/images/bin.png" onclick="deleteQuestion('${dto.questionOrder}')">
	                    </td>
				</tr>
				<tr height="55" align="center" style="font-size: 15px; font-weight: bold;">
                    <td align="left" colspan="3">
                    	${dto.questionContent}
                    </td>
                 </tr>
			</table>
			</div>
			</c:if>
			
			
			<c:if test="${dto.soro==0}">
			<div style="border: 1px solid; padding: 10px; border-radius: 4px; margin-top: 20px;">
			<table style="width: 1060px; border-radius: 4px; margin: 10px;">
				<tr height="40" style="font-size: 20px; font-weight: bold; color: #679467;" align="left">
					<td>Q. ${dto.questionOrder}</td>
					<td width="160">
                       <img src="<%=cp%>/resource/images/downdown.png" onclick="reOrder('${dto.questionOrder}',1)">
                       <img src="<%=cp%>/resource/images/down.png" onclick="reOrder('${dto.questionOrder}',2)">
                       <img src="<%=cp%>/resource/images/up.png" onclick="reOrder('${dto.questionOrder}',3)">
                       <img src="<%=cp%>/resource/images/upup.png" onclick="reOrder('${dto.questionOrder}',4)">
                    </td>
                    <td width="60">
                    <img src="<%=cp%>/resource/images/bin.png" onclick="deleteQuestion('${dto.questionOrder}')">
                    </td>
				</tr>
				<tr height="55" align="center" style="font-size: 15px; font-weight: bold;">
                   <td align="left" colspan="3">
                   	${dto.questionContent}&nbsp;&nbsp;&nbsp;(${dto.questionType})
                   </td>
                </tr>
                <c:forEach var="exdto" items="${exList}">
                <c:if test="${exdto.questionCode==dto.questionCode}">
	                <tr height="55" align="center" style="font-size: 13px;">
	                <td align="left" colspan="3">
                   	<input type="radio" name="ch${exdto.questionCode}">&nbsp;${exdto.exContent}
                    </td>
	                </tr>
	            </c:if>
	            </c:forEach>
			</table>
			</div>
			</c:if>
			
		</c:forEach>
	</div>
</div>