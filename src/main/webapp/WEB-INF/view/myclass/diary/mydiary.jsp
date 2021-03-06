<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.print.min.css" media='print' type="text/css">

<style type="text/css">
.hbtn {
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    background-image:none;
    color:#fff;
    line-height: 1.5;
    text-align: center;
    padding: 5px 10px;
    font-size: 12px;
    text-decoration: none;
    position: relative;
    float: left;
    border: 1px solid #ccc;    
}
.hbtn:hover, .hbtn:active {
    background-image:none;
    color:#fff;
    text-decoration: none;
}

.hbtn:focus {
    background-image:none;
    color:#fff;
    text-decoration: none;
}

.hbtn-bottom {
	border-bottom:3px solid #3DB7CC;
	font-weight: 900;
}

#calendar {
	margin: 20px auto 10px;
}

#schLoading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}

.fc-center h2{
	display: block;
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.5em;
	font-weight: bold;
	/* -webkit-margin-after: 0.83em; */
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

.fc-content .fc-title{
	font-size: 9pt;
}

/* 일정분류버튼 css */
#classifyGroup .btn, #classifyGroup .focus.btn, #classifyGroup .btn:focus, #classifyGroup .btn:hover {
    color: #fff; background-image:none;
}
.btn-blue {
    background-color:blue; border-color:blue;
}
.btn-blue:hover, .btn-blue:focus {
    background-color:blue; border-color:blue;
}
.btn-black {
    background-color:black; border-color:black;
}
.btn-black:hover, .btn-black:focus {
    background-color:black; border-color:black;
}
.btn-green {
    background-color:green; border-color:green;
}
.btn-green:hover, .btn-green:focus {
    background-color:green; border-color:green;
}
.btn-red {
    background-color:red; border-color:red;
}
.btn-red:hover, .btn-red:focus {
    background-color:red; border-color:red;
}

/* 모달대화상자 */
/* 타이틀바 */
.ui-widget-header {
	background: none;
	border: none;
	height:45px;
	line-height:35px;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
}
/* 내용 */
.ui-widget-content {
   /* border: none; */
   border-color: #cccccc; 
   margin: 0px auto 0px;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>

<script type="text/javascript">
//-------------------------------------------------------
//달력
var calendar=null;
var group="all";
var tempContent;

//start:2016-01-01 => 2016-01-01 일정
//start:2016-01-01, end:2016-01-02 => 2016-01-01 일정
//start:2016-01-01, end:2016-01-03 => 2016-01-01 ~ 2016-01-02 일정
$(function() {
		calendar = $('#calendar').fullCalendar({
			header: {
				left: '',
				center: 'title',
				 right: 'prev,next today'
			},
			locale: 'ko',
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				// start, end : moment 객체
				// 일정하나를 선택하는 경우 종일일정인경우 end는 start 보다 1일이 크다.
				//  캘런더에 start<=일정날짜또는시간<end 까지 표시함
				
				// 달력의 빈공간을 클릭하거나 선택할 경우 입력 화면
				insertForm(start, end);
				
			},
			eventClick: function(calEvent, jsEvent, view) {
				// 일정 제목을 선택할 경우 상세 일정
				articleForm(calEvent);
			},
			editable: true,
			eventLimit: true,
			events: function(start, end, timezone, callback){
				// 캘린더가 처음 실행되거나 월이 변경되면
				var dietDate=start.format("YYYY-MM-DD");
				var endDay=end.format("YYYY-MM-DD");
		        
				var url="<%=cp%>/sch/month";
                var query="start="+dietDate+"&end="+endDay+"&group="+group+"&tmp="+new Date().getTime();
				$.ajax({
				    url: url,
				    data:query,
				    dataType: 'json',
				    success: function(data, text, request) {
			        	 var isLogin=data.isLogin;
			        	 if(isLogin=="false") {
			        		   location.href="<%=cp%>/member/login";
			        		   return;
			        	}
				    	var events = eval(data.list);
				        callback(events);
				    }
				});
			},
			eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
				// 일정을 드래그 한 경우
				updateDrag(event);
			},
			eventResize: function(event, dayDelta, minuteDelta, allDay, revertFunc) {
				// 일정의 크기를 변경 한 경우
				updateDrag(event);
			},
			loading: function(bool) {
				$('#schLoading').toggle(bool);
			}
		});
});

// 분류별 검색
function classification(kind, idx) {
	$("#calendarHeader a").each(function(){
		$(this).removeClass("hbtn-bottom");
		// $(this).css("opacity","0.8");
	});
	$("#calendarHeader a:eq("+idx+")").addClass("hbtn-bottom");
	// $("#calendarHeader a:eq("+idx+")").css("opacity","1.0");
	
	group=kind;
	calendar.fullCalendar('refetchEvents');
}

// -------------------------------------------
// -- 상세 일정 보기
function articleForm(calEvent) {
	var str;
	
	var num=calEvent.id;
	var title=calEvent.title;
	var userName=calEvent.userName;
	
	var color=calEvent.color;
	var classify="";
	if(color=="blue") classify="개인일정";
	else if(color=="black") classify="가족일정";
	else if(color=="green") classify="회사일정";
	else if(color=="red") classify="부서일정";
	
	var allDay=calEvent.allDay;
	var dietDate="", startTime="", sday="";
	var endDay="", endTime="", eday="";
	var strDay;
	dietDate=calEvent.start.format("YYYY-MM-DD");
	if(calEvent.start.hasTime()) {
	    startTime=calEvent.start.format("HH:mm");
	    if(calEvent.end!=null && calEvent.start.format()!=calEvent.end.format()) {
			endDay=calEvent.end.format("YYYY-MM-DD");
			endTime=calEvent.end.format("HH:mm");
		}	    
	} else {
		if(calEvent.end!=null && calEvent.start.format()!=calEvent.end.add("-1", "days").format()) {
			endDay=calEvent.end.format("YYYY-MM-DD");
		}
		if(calEvent.end!=null)
		    calEvent.end.add("1", "days");
	}
	if(allDay==false) {
		sday=dietDate+" "+ startTime;
		eday=endDay+" "+ endTime;
		strDay="시간일정";
	}else if(allDay==false) {
		sday=dietDate+" "+ startTime;
		eday=endDay;
		endTime="";
		strDay="시간일정";
	}else {
		sday=dietDate;
		eday=endDay;
		startTime="";
		endTime="";
		strDay="하루종일";
	}
	
	var content=calEvent.content;
	if(! content) content="";
	tempContent=content;
	
	var dlg = $("#scheduleModal").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateForm(num,title,allDay,dietDate,endDay,startTime,endTime,color);
		        },
			   " 삭제 " : function() {
				   deleteOk(num);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		        }
		  },
		  height: 480,
		  width: 550,
		  title: "상세 일정",
		  close: function(event, ui) {
		  }
	});	
	
	$('#scheduleModal').load("<%=cp%>/sch/articleForm", function() {
		$("#schTitle").html(title);
		$("#schUserName").html(userName);
		$("#schClassify").html(classify);
		$("#schAllDay").html(strDay);
		$("#schdietDate").html(sday);
		$("#schEndDay").html(eday);
		$("#schContent").html(content);
		
		dlg.dialog("open");
	});
}

// -------------------------------------------
// -- 입력 및 수정 대화상자
// 일정 등록 폼
function insertForm(start, end) {
	var dlg = $("#scheduleModal").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 확인 " : function() {
		    	   insertOk();
		        },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		        }
		  },
		  height: 720,
		  width: 800,
		  title: "다이어트일기",
		  close: function(event, ui) {
		  }
	});
	
	var dietDate="";
	dietDate=start.format("YYYY-MM-DD");
	$('#scheduleModal').load("<%=cp%>/myclass/diary/inputForm?start="+dietDate, function() {

		
		$("input[name='dietDate']").val(dietDate);
		
		dlg.dialog("open");
		calendar.fullCalendar('unselect');
	});	
}

// 새로운 일정 등록
function insertOk() {
	if(! validCheck())
		return;
	
	var query=$("form[name=schForm]").serialize();
	var url="<%=cp%>/sch/created";

     $.ajax({
        type:"post"
        ,url:url
        ,data:query
        ,dataType:"json"
        ,success:function(data) {
        	   var isLogin=data.isLogin;
        	   if(isLogin=="false") {
        		   location.href="<%=cp%>/member/login";
        		   return;
        	   }
        	   
	      	   var state=data.state;
	      	   if(state=="true") {
	      		   group="all";
	      		   calendar.fullCalendar('refetchEvents');

	      		    $("#calendarHeader a").each(function(){
	      				$(this).removeClass("hbtn-bottom");
	      			});
	      			$("#calendarHeader a:eq(0)").addClass("hbtn-bottom");

	          }
          }
          ,error:function(e) {
               console.log(e.responseText);
         }
    });
    
     $("#scheduleModal").dialog("close");
}

function validCheck() {
	var title=$.trim($("input[name='title']").val());
	var color=$.trim($("select[name='color']").val());
	var allDay=$("#allDayChk:checked").val();
	var dietDate=$.trim($("input[name='dietDate']").val());
	var endDay=$.trim($("input[name='endDay']").val());
	var startTime=$.trim($("input[name='startTime']").val());
	var endTime=$.trim($("input[name='endTime']").val());
	var content=$.trim($("textarea[name='content']").val());
	
	if(! title) {
		alert("제목을 입력 하세요 !!!");
		$("input[name='title']").focus();
		return false;
	}
	
	 if(! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(dietDate)){
			alert("날짜를 정확히 입력 하세요 [yyyy-mm-dd] !!! ");
			$("input[name='dietDate']").focus();
			return false;
	 }
	 if(endDay!="" && ! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(endDay)){
			alert("날짜를 정확히 입력 하세요 [yyyy-mm-dd] !!! ");
			$("input[name='endDay']").focus();
			return false;
	 }
	
	 if(startTime!="" && ! /[0-2][0-9]:[0-5][0-9]/.test(startTime)){
			alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='startTime']").focus();
			return false;
	 }
	 if(allDay==undefined && startTime=="") {
		    alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='startTime']").focus();
			return false;
	 }
	 
	 if(endTime!="" && ! /[0-2][0-9]:[0-5][0-9]/.test(endTime)){
			alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='endTime']").focus();
			return false;
	 }
	 
	 if(allDay==undefined && endDay!="" && endTime=="") {
		 alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='endTime']").focus();
			return false;
	 }

	// 종료 날짜는 종일일정인 경우 하루가 더 커야한다.
	// 캘런더에 start<=일정날짜또는시간<end 까지 표시함
    var end;
    if(endDay!="") {
    	if(endTime!="") {
        	end=moment(endDay+"T"+endTime);
			endDay=end.format("YYYY-MM-DD");
			endTime=end.format("HH:mm");
    	} else {
        	end=moment(endDay);
        	end=end.add("1", "days");
			endDay=end.format("YYYY-MM-DD");
    	}
    	$("input[name='endDay']").val(endDay);
    }
    
	if(allDay=="true") {
		$("input[name='startTime']").val("");
		$("input[name='endTime']").val("");
		$("#allDayHidden").prop("disabled", true);
	} else {
		$("input[name='endTime']").val(endTime);
		$("#allDayHidden").prop("disabled", false);
	}
	
	return true;
}

// -------------------------------------------------
// 수정 폼
function updateForm(num, title, allDay, dietDate, endDay, startTime, endTime, color) {
	var dlg = $("#scheduleModal").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 확인 " : function() {
		    	   updateOk(num);
		        },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		        }
		  },
		  height: 480,
		  width: 550,
		  title: "일정 수정",
		  close: function(event, ui) {
		  }
	});
	
	$('#scheduleModal').load("<%=cp%>/sch/inputForm", function() {
		$("input[name='title']").val(title);
		$("select[name='color']").val(color);
		$("input[name='dietDate']").val(dietDate);
		$("input[name='endDay']").val(endDay);
		$("input[name='startTime']").val(startTime);
		$("input[name='endTime']").val(endTime);
		$("textarea[name='content']").val(tempContent);
		
		if(allDay==true || allDay=="true") {
			$("#allDayChk").prop('checked', true);
			$("#allDayHidden").prop("disabled", true);
			
			$("#startTime").hide();
			$("#endTime").hide();
		} else {
			$("#allDayChk").prop('checked', false);
			$("#allDayHidden").prop("disabled", false);
			
			$("#startTime").show();
			$("#endTime").show();
		}
		$("input[name='title']").focus();

		dlg.dialog("open");
	});	
}

// 수정 완료
function updateOk(num) {
	if(! validCheck())
		return;
	
	$("form[name=schForm] input[name=num]").val(num);
	var query=$("form[name=schForm]").serialize();
	var url="<%=cp%>/sch/update";
       
    $.ajax({
         type:"post"
         ,url:url
         ,data:query
         ,dataType:"json"
         ,success:function(data) {
      	     var isLogin=data.isLogin;
    	     if(isLogin=="false") {
    		     location.href="<%=cp%>/member/login";
    		     return;
    	     }
    		 group="all";
        	 calendar.fullCalendar('refetchEvents', num);
        	 
   			$("#calendarHeader a").each(function(){
  				$(this).removeClass("hbtn-bottom");
  			});
  			$("#calendarHeader a:eq(0)").addClass("hbtn-bottom");
         }
         ,error:function(e) {
              console.log(e.responseText);
        }
   });
    
    $("#scheduleModal").dialog("close");
}

// -------------------------------------------------------
// 일정을 드래그하거나 일정의 크기를 변경할 때 일정 수정
function updateDrag(e) {
	var num=e.id;
	var title=e.title;
	var color=e.color;
	var allDay=e.allDay;
	var dietDate="", startTime="";
	var endDay="", endTime="";
	
	dietDate=e.start.format("YYYY-MM-DD");
	if(e.start.hasTime()) {
		// 시간 일정인 경우
		startTime=e.start.format("HH:mm");
		
		if(e.end) {
		    endDay=e.end.format("YYYY-MM-DD");
		    endTime=e.end.format("HH:mm");
		    if(e.start.format()==e.end.format()) {
			    endDay="";
			    endTime="";
		    }
		}
	} else {
		// 하루종일 일정인 경우
		if(e.end) {
			endDay=e.end.format("YYYY-MM-DD");
			if(e.start.format()==e.end.add("-1", "days").format()) {
				endDay="";
			}
			e.end.add("1", "days")
		}
	}
	
	if(startTime=="" && endTime=="") {
		allDay="true";
	} else {
		allDay="false";
	}
	
	var content=e.content;
	if(!content)
		content="";

	var query="num="+num
           +"&title="+title
           +"&color="+color
           +"&allDay="+allDay
           +"&dietDate="+dietDate
           +"&endDay="+endDay
           +"&startTime="+startTime
           +"&endTime="+endTime
           +"&content="+content;
	
	var url="<%=cp%>/sch/update";
	$.ajax({
         type:"POST"
         ,url:url
		 ,data:query
		 ,dataType:"json"
		 ,success:function(data) {
  	          var isLogin=data.isLogin;
 	          if(isLogin=="false") {
 		           location.href="<%=cp%>/member/login";
 		           return;
 	          }
         }
         ,error:function(e) {
              console.log(e.responseText);
          }
	});
}

// -------------------------------------------
function deleteOk(num) {
	if(confirm("삭제 하시겠습니까 ?")) {
		$.post("<%=cp%>/sch/delete", {num:num}, function(data){
     	   var isLogin=data.isLogin;
    	   if(isLogin=="false") {
    		   location.href="<%=cp%>/member/login";
    		   return;
    	   }
    	   
			calendar.fullCalendar('removeEvents', num);
		}, "json");
	}
	 $("#scheduleModal").dialog("close");
}

// -------------------------------------------------
// 입력 및 수정 화면에서 일정 분류를 선택 한 경우
function classifyChange(classify) {
	$("#btnTitle").removeClass("btn-blue")
	                     .removeClass("btn-black")
	                     .removeClass("btn-green")
	                     .removeClass("btn-red");
	$("#btnDropdown").removeClass("btn-blue")
	                              .removeClass("btn-black")
	                              .removeClass("btn-green")
	                              .removeClass("btn-red");
	
	if(classify=="blue") {
		$("#btnTitle").html("개인일정")
		$("#btnTitle").addClass("btn-blue");
		$("#btnDropdown").addClass("btn-blue");
	} else if(classify=="black") {
		$("#btnTitle").html("가족일정")
		$("#btnTitle").addClass("btn-black");
		$("#btnDropdown").addClass("btn-black");
	} else if(classify=="green") {
		$("#btnTitle").html("회사일정")
		$("#btnTitle").addClass("btn-green");
		$("#btnDropdown").addClass("btn-green");
	} else if(classify=="red") {
		$("#btnTitle").html("부서일정")
		$("#btnTitle").addClass("btn-red");
		$("#btnDropdown").addClass("btn-red");
	}
	$("#scheduleModal input[name='color']").val(classify);
}

// 종일일정에 따른 시간 입력폼 보이기/숨기기
$(function(){
	$(document).on("click","#allDayChk",function(){
		var allDay=$("#allDayChk:checked").val();
		if(allDay=='true') {
			$("#startTime").hide();
			$("#endTime").hide();
			$("#allDayHidden").prop("disabled", false);
		} else {
			$("#startTime").show();
            $("#endTime").show();
			$("#allDayHidden").prop("disabled", true);
		}
	});
});



//------------------------------------------------------------
 

$(function(){
	$( "body" ).on( "click", ".clsLookIng", function() {
		var t=$(this);
		
		var dlg = $("#ing").dialog({
			  modal: true,
			  buttons: {
			       " 선택 " : function() {
			    	   selectIng(t);
			        },
			       " 닫기 " : function() {
			    	   //$(this).dialog("close");
			    	   $("#ing").dialog("close");
			        }
			  },
	          position:{
	              my:"left top",
	              at:"center center"
	          },
			  height: 700,
			  width: 700,
			  title: "식단찾기",
			  open: function(){
				  $(this).load("<%=cp%>/myclass/diary/ing");  
			  },
			  close: function() {
			  }
		});	

	});
});


$(function(){
	$( "body" ).on( "click", ".clsLookExer", function() {
		var t=$(this);
		
		var dlg = $("#exercise").dialog({
			  modal: true,
			  buttons: {
			       " 선택 " : function() {
			    	   selectExercise(t);
			        },
			       " 닫기 " : function() {
			    	   $("#exercise").dialog("close");
			        }
			  },
	          position:{
	              my:"left top",
	              at:"center center"
	          },
			  height: 700,
			  width: 700,
			  title: "운동찾기",
			  open: function(){
				  $(this).load("<%=cp%>/myclass/diary/exercise");  
			  },
			  close: function() {
			  }
		});	

	});
});

function selectIng(t){
	var ing = $(":checkbox[name='ingChk']:checked").val();
	var ing2 = $(":checkbox[name='ingChk']:checked").attr("data-unit");
	var ing3 = $(":checkbox[name='ingChk']:checked").attr("data-num");
	
	t.next().attr('placeholder', ing2);
	t.next().next().val(ing3);
	t.val(ing);
	$("#ing").dialog("close");
	
	//t.next().attr('input[name="ingrerdientsNum"]', ing3);
	//t.next().val('input[name="ingrerdientsNum"]', ing3);
	//$('input[name="ingrerdientsNum"]').val(ing3);
}

function selectExercise(t){
	var exer = $(":checkbox[name='exerChk']:checked").val();
	var exer2 = $(":checkbox[name='exerChk']:checked").attr("data-unit");
	var exer3 = $(":checkbox[name='exerChk']:checked").attr("data-num");
	
	
	$('#exerciseTime').attr('placeholder', exer2+" 입력");
	$('input[name="exerciseNum"]').val(exer3);
	$('.exerciseTime').html(exer2);
	
	t.val(exer);
	$("#exercise").dialog("close");
}

function add1(){
 	var add = "<div>";
 		add+= "<input name='weight' type='text' class='boxTF clsLookIng' style='width:53%;' readonly='readonly' placeholder='재료선택(클릭)'>";
		add+= "<input name='TotalUnit' type='text' class='boxTF' style='width:26%;' placeholder='먹은 양'>";
    	add+= "<span>";
    	add+= "<img src='<%=cp%>/resource/images/minus.png' style='height: 15px; width: 15px; margin-top: 5px; cursor: pointer;' onclick='remove1(this)'>";
    	add+= "</span>";
    	add+= "<input type='hidden' name='ingrerdientsNum' value=''>";
    	add+= "<div>";
    	
    	$("#add1").append(add);
}
function remove1(td){
	$(td).closest("div").remove();	
}

function add2(){
 	var add = "<div>";
 		add+= "<input name='weight' type='text' class='boxTF clsLookIng' style='width:53%;' readonly='readonly' placeholder='재료선택(클릭)'>";
		add+= "<input name='TotalUnit' type='text' class='boxTF' style='width:26%;' placeholder='먹은 양'>";
		add+= "<span>";
		add+= "<img src='<%=cp%>/resource/images/minus.png' style='height: 15px; width: 15px; margin-top: 5px; cursor: pointer;' onclick='remove2(this)'>";
		add+= "</span>";
		add+= "<input type='hidden' name='ingrerdientsNum' value=''>";
		add+= "</div>";
	
	$("#add2").append(add);	

}
function remove2(td){
	$(td).closest("div").remove();	
}

function add3(){
 	var add = "<div>";
 		add+= "<input name='weight' type='text' class='boxTF clsLookIng' style='width:53%;' readonly='readonly' placeholder='재료선택(클릭)'>";
		add+= "<input name='TotalUnit' type='text' class='boxTF' style='width:26%;' placeholder='먹은 양'>";
		add+= "<span>";
		add+= "<img src='<%=cp%>/resource/images/minus.png' style='height: 15px; width: 15px; margin-top: 5px; cursor: pointer;' onclick='remove3(this)'>";
		add+= "</span>";
		add+= "<input type='hidden' name='ingrerdientsNum' value=''>";
		add+= "</div>";
	
	$("#add3").append(add);	

}
function remove3(td){
	$(td).closest("div").remove();	
}


function mySearchExercise(c) {
	var f=document.mySearchList;
	if(c=="reload") {
		f.searchKey.value="exerciseName";
		f.searchValue.value="";
	}
	
	var query = $("form[name=mySearchList]").serialize();
	var url="<%=cp%>/myclass/diary/exercise";
	
	$.ajax({
         type:"POST"
         ,url:url
		 ,data:query
		 ,success:function(data) {
			 $("#exercise").html(data);
		 } ,error:function(e) {
              console.log(e.responseText);
         }
	});
}

function mySearchIng(c) {
	var f=document.mySearchList2;
	if(c=="reload") {
		f.searchKey.value="ingredientsName";
		f.searchValue.value="";
	}
	
	var query = $("form[name=mySearchList2]").serialize();
	var url="<%=cp%>/myclass/diary/ing";
	
	$.ajax({
         type:"POST"
         ,url:url
		 ,data:query
		 ,success:function(data) {
			 $("#ing").html(data);
		 } ,error:function(e) {
              console.log(e.responseText);
         }
	});
}

function listExercise(page) {
	var f=document.mySearchList;
	f.pageNo.value = page;
	
	var query = $("form[name=mySearchList]").serialize();
	var url="<%=cp%>/myclass/diary/exercise";
	
	$.ajax({
         type:"POST"
         ,url:url
		 ,data:query
		 ,success:function(data) {
			 $("#exercise").html(data);
		 } ,error:function(e) {
              console.log(e.responseText);
         }
	});
}

function listIng(page) {
	var f=document.mySearchList2;
	f.pageNo.value = page;
	
	var query = $("form[name=mySearchList2]").serialize();
	var url="<%=cp%>/myclass/diary/ing";
	
	$.ajax({
         type:"POST"
         ,url:url
		 ,data:query
		 ,success:function(data) {
			 $("#exercise").html(data);
		 } ,error:function(e) {
              console.log(e.responseText);
         }
	});
}

</script>

<div class="body-container" style="width: 1100px; margin: 100px auto;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span>다이어트 일기</h3>
    </div>
    
    <div>
            <div id="calendar"></div>
    </div>
</div>

<div id="scheduleModal" style="display: none;"></div>
<div id="ing" style="display: none;"></div>
<div id="exercise" style="display: none;"></div>
