<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.surveyLayer{
  position:absolute;
  width:800px;
  height:500px;
  background:#ffffff;
  margin:-50px 0 0 -50px;
  border-spacing: 0;
  border-collapse: collapse;
  box-shadow: 8px 8px 10px silver;
}
.underline{
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom-width: 1;
	width: 200px;
	border-color: #000000;
}

</style>
<script type="text/javascript">
var cur=1;

jQuery.fn.center = function() {
	this.css("position","absolute");
	this.css("top",Math.max(0,(($(window).height()- $(this).outerHeight())/2)-$(window).scrollTop())+"px");
	this.css("left",Math.max(0,(($(window).width()- $(this).outerWidth())/2)-$(window).scrollLeft())+"px");
	return this;
}

$(function() {
	$("#surveyLayer").center();
	$(".survey").hide();
	$('#survey'+cur).show();
	$(".prevBtn").hide();
	$(".surveyOk").hide();
	
	function check(obj) {
		if(obj.find("input[type=checkbox]").length>0) {
			return obj.find("input[type=checkbox]").is(":checked");
		} else if(obj.find("input[type=radio]").length>0) {
			return obj.find("input[type=radio]").is(":checked");
		} else if(obj.find("input[type=text]").length>0) {
			if(! $.trim(obj.find("input[type=text]").val())) {
				return false;
			}
		} else if(obj.find("textarea").length>0) {
			if(! $.trim(obj.find("textarea").val())) {
				return false;
			}
		}
		
		return true;
	}
});

function arrange() {
	if(! $(".survey").first().is(":visible")) {
		$(".prevBtn").show();
	}
	if($(".survey").first().is(":visible")) {
		$(".prevBtn").hide();
	}
	
	if($(".survey").last().is(":visible")) {
		$(".nextBtn").hide();
		$(".surveyOk").show();
	}
	
	if(! $(".survey").last().is(":visible")) {
		$(".surveyOk").hide();
		$(".nextBtn").show();
	}
}
function nextView(cur) {
	var f = document.surveyForm;
	
	var answer = $(".inAns"+cur).val();
	var radio = $('.inAns'+cur).is(':checked');

	if(answer=='' && radio==false){
		alert("필수 입력값입니다.");
		return;
	}
	//라디오버튼 체크여부확인해야한다.
	
	$('#survey'+cur).hide();
	$('#survey'+(cur+1)).show();
	arrange();
}

function prevView(cur) {
	
	//대답 입력 여부 확인해야한다!!!
	$('#survey'+cur).hide();
	$('#survey'+(cur-1)).show();
	arrange();
}

function surveySubmit(type) {
	var f = $("form[name=surveyForm]").serialize();
	alert(f);

	var url = "<%=cp%>/survey/submit";
	
	$.ajax({
		type:"post"
		,url:url
		,data: f
		,dataType:"json"
		,success:function(data) {
			if(data.state=="true"){
				location.href="<%=cp%>/survey/result";
			}
		}
	    ,error:function(e) {
	    	alert("설문등록실패");
	    	console.log(e.responseText);
	    }
	});
}
</script>
</head>
<body>

<form name="surveyForm" id="surveyForm" method="post">
<div class="surveyLayer" id="surveyLayer">
	<div style="float: left; width: 200px; background: #bbddd4; height: 100%;">
	</div>
	
	<c:forEach var="dto" items="${list}">
		<div class="survey" id="survey${dto.questionOrder}" style="width: 600px; display: inline-block; float: left; margin-top: 50px; display : none;">
			<div align="center" style="width: 500px; height:100px; margin-left: 45px;">
				<hr style="height: 5px; width: 100px; background-color: #bbddd4; border: 0px; float: left;">
				<hr style="height: 5px; width: 400px; background-color: #e6e6e6; border: 0px; float: left;">
			</div>
			<div style="width: 500px; height:240px; margin-left: 45px;">
				<p style="font-weight: bold; font-size: 20px;">Q. ${dto.questionOrder}</p>
				<p>${dto.questionContent}</p>
				<c:if test="${dto.soro==1}">
					<input class="inAns${dto.questionOrder}" name="questionAnswer.${dto.questionOrder}." type="text" style="outline: none; font-size: 20px;">
					<input type="hidden" name="questionOrder${dto.questionOrder}" value="${dto.questionOrder}">
				</c:if>
				<c:if test="${dto.soro==0}">
					<c:forEach var="exdto" items="${exList}">
	                	<c:if test="${exdto.questionCode==dto.questionCode}">
			                <tr height="55" align="center" style="font-size: 13px;">
			                <td align="left" colspan="3">
		                   		<input class="inAns${dto.questionOrder}" type="radio" name="questionAnswer.${dto.questionOrder}." value="${exdto.exOrder}">&nbsp;${exdto.exContent}<br><br>
		                    </td>
			                </tr>
		            	</c:if>
	            	</c:forEach>
				</c:if>
			</div>
			<div style="width: 500px; margin-left: 45px;" align="right">
			<button class="prevBtn" type="button" style="width: 100px; height: 45px; background: #999999; border: 0px; color: #ffffff; border-radius:4px; font-weight: bold;" onclick="prevView(${dto.questionOrder});">이전</button>
			<button class="nextBtn" type="button" style="width: 100px; height: 45px; background: #1abc9c; border: 0px; color: #ffffff; border-radius:4px; font-weight: bold;" onclick="nextView(${dto.questionOrder});">다음</button>
			<button class="surveyOk" type="button" style="width: 100px; height: 45px; background: #1abc9c; border: 0px; color: #ffffff; border-radius:4px; font-weight: bold;" onclick="surveySubmit();">설문 등록</button>
			</div>
		</div>
	</c:forEach>
	
</div>
</form>
