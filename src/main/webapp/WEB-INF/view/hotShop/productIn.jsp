<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
	/* Overall wrapper */
.monthly {
	background: #F3F3F5;
	color: #545454;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	position: relative;
}

/* Top bar containing title, navigation, and buttons */
.monthly-header {
	position: relative;
	text-align: center;
	padding: 0.5em;
	background: #fff;
	height: 3em;
	box-sizing: border-box;
}
/* Center area of top bar containing title and buttons */
.monthly-header-title {
	text-transform: uppercase;
}

/* Buttons for reverting to "today", and closing event list */
.monthly-header-title a:link,
.monthly-header-title a:visited {
	display: inline-block;
	border: 1px solid #ccc;
	color: #545454;
	text-decoration: none;
	height: 1.75em;
	line-height: 1.65em;
	padding: 0 0.65em 0 0.65em;
	box-sizing: border-box;
	transition: background .1s;
}
/* Add some roundy-ness */
.monthly-header-title a:first-of-type {
	border-top-left-radius: 1em;
	border-bottom-left-radius: 1em;
}
.monthly-header-title a:last-of-type {
	border-top-right-radius: 1em;
	border-bottom-right-radius: 1em;
}
.monthly-header-title a:hover {
	background: #8b8b8b;
	border: 1px solid #8b8b8b;
	color: #fff;
}
.monthly-header-title a:active {
	background: #222;
	border: 1px solid #222;
	transition: none;
}
/* current month/yr block */
.monthly-header-title-date,
.monthly-header-title-date:hover {
	background: #eee!important;
	border: 1px solid #ccc!important;
	color: #545454!important;
	cursor: default;
}
/* Button to reset to current month */
.monthly-reset {
	border-left: 0!important;
}
.monthly-reset::before {
	content: '\21BB';
	margin-right: 0.25em;
}
/* Button to return to month view */
.monthly-cal {
	border-right: 0!important;
}
.monthly-cal::before {
	content: '\2637';
	margin-right: 0.25em;
}

/* wrapper for left/right buttons to make the clickable area bigger */
.monthly-prev,
.monthly-next {
	position: absolute;
	top: 0;
	width: 3em;
	height: 100%;
	opacity: .5;
}
.monthly-prev {
	left: 0;
}
.monthly-next {
	right: 0;
}
.monthly-prev:hover,
.monthly-next:hover {
	opacity: 1;
}

/* Arrows */
.monthly-prev:after,
.monthly-next:after {
	content: '';
	position: absolute;
	top: 50%;
	left: 50%;
	border-style: solid;
	border-color: #222;
	width: 0.6em;
	height: 0.6em;
	margin: -0.4em 0 0 -0.4em;
	-webkit-transform: rotate(45deg);
		-ms-transform: rotate(45deg);
	        transform: rotate(45deg);
}
/* Left Arrow */
.monthly-prev:after{
	border-width: 0 0 0.2em 0.2em;
}
/* Right Arrow */
.monthly-next:after {
	border-width: 0.2em 0.2em 0 0;
}

/* Day of the week headings */
.monthly-day-title-wrap {
	display: table;
	table-layout: fixed;
	width: 100%;
	background: #fff;
	border-bottom: 1px solid #EBEBEB;
}
.monthly-day-title-wrap div {
	width: 14.28%!important;
	display: table-cell;
	box-sizing: border-box;
	position: relative;
	text-align: center;
	text-transform: uppercase;
}

/* Calendar days wrapper */
.monthly-day-wrap {
	display: table;
	table-layout: fixed;
	width: 100%;
	overflow: hidden;
}
.monthly-week {
	display: table-row;
	width: 100%;
}
/* Calendar Days */
.monthly-day, .monthly-day-blank {
	width: 14.28%!important;
	display: table-cell;
	vertical-align: top;
	box-sizing: border-box;
	position: relative;
	color: inherit;
	background: #fff;
	box-shadow: 0 0 0 1px #EBEBEB;
	-webkit-transition: .25s;
	transition: .25s;
	padding: 0;
	text-decoration: none;
}

/* Trick to make the days' width equal their height */
.monthly-day:before {
	content: '';
	display: block;
	padding-top: 100%;
	float: left;
}

/* Hover effect for non event calendar days */
.monthly-day-wrap > a:hover {
	background: #A1C2E3;
}

/* Days that are part of previous or next month */
.monthly-day-blank {
	background: #F3F3F5;
}

/* Event calendar day number styles */
.monthly-day-event > .monthly-day-number {
	position: absolute;
	line-height: 1em;
	top: 0.2em;
	left: 0.25em;
}

/* Non-Event calendar day number styles */
.monthly-day-pick > .monthly-indicator-wrap {
	margin: 0;
}

.monthly-day-pick > .monthly-day-number:before,
.monthly-day-pick > .monthly-day-number:after {
	content: '';
	display: block;
	padding-top: calc(50% - 0.8em);
	width: 0;
	height: 0;
}

/* Days in the past in "picker" mode */
.monthly-past-day:after{
	content: '';
	width: 150%;
	height: 2px;
	-webkit-transform-origin: left top;
		-ms-transform-origin: left top;
	        transform-origin: left top;
	-webkit-transform: rotate(45deg);
		-ms-transform: rotate(45deg);
	        transform: rotate(45deg);
	background: rgba(0, 0, 0, 0.1);
	position: absolute;
	left: 0;
	top: 0;
}
.monthly-past-day:hover {
	background: #fff!important;
}

/* Current day style */
.monthly-today .monthly-day-number {
	color: #FFF;
	background: #EA6565;
	border-radius: 0.75em;
	top: 0.08em;
	left: 0.05em;
	font-size: 0.9em;
	padding: 0;
	width: 1.25em;
	height: 1.25em;
	line-height: 1.25em;
	text-align: center;
}
.monthly-day-pick.monthly-today .monthly-day-number {
	padding: 0.15em;
	margin: calc(50% - 0.7em) auto auto auto;
	font-size: 1em;
}

/* Wrapper around events */
.monthly-indicator-wrap {
	position: relative;
	text-align: center;
	line-height: 0;
	max-width: 1.5em;
	margin: 0 auto;
	padding-top: 1.2em;
}

/* Event indicator dots */
.monthly-day .monthly-event-indicator {
	display: inline-block;
	margin: 0.05em;
	width: 0.5em;
	height: 0.5em;
	border-radius: 0.25em;
	vertical-align: middle;
	background: #7BA7CE;
}

.monthly-day .monthly-event-indicator span {
	color: transparent;
}

.monthly-day .monthly-event-indicator:hover {
	cursor: pointer;
}
/* Listing of events under calendar */
.monthly-event-list {
	background: rgba(233, 235, 236, 0.9);
	overflow: auto;
	position: absolute;
	top: 2.5em;
	width: 100%;
	height: calc(100% - 2.5em);
	display: none;
	-webkit-transition: .25s;
	transition: .25s;
	-webkit-transform: scale(0);
		-ms-transform: scale(0);
	        transform: scale(0);
}

/* Days in Events List */
.monthly-list-item {
	position: relative;
	padding: 0.5em 0.7em 0.25em 4em;
	display: none;
	border-top: 1px solid #D6D6D6;
	text-align: left;
}

.monthly-list-item:after{
    padding: 0.4em 1em;
    display: block;
    margin-bottom: 0.5em;
 }

.monthly-event-list .monthly-today .monthly-event-list-date {
	color: #EA6565;
}

/* Events in Events List */
.monthly-event-list .listed-event {
	display: block;
	color: #fff;
	padding: 0.4em 1em;
	border-radius: 0.2em;
	margin-bottom: 0.5em;
}

.monthly-list-item a:link, .monthly-list-item a:visited {
	text-decoration: none;
}

.item-has-event {
	display: block;
}

.item-has-event:after{
    display: none!important;
}

.monthly-event-list-date {
	width: 4em;
	position: absolute;
	left: 0;
	top: 1.2em;
	text-align: center;
    font-weight: bold;
    line-height: 1.2em;
}

.monthly-list-time-start,
.monthly-list-time-end {
	font-size: .8em;
	display: inline-block;
}
.monthly-list-time-end:not(:empty):before {
	content: '\2013';
	padding: 0 2px;
}

/* Events List custom webkit scrollbar */
.monthly-event-list::-webkit-scrollbar {width: 0.75em;}

/* Track */
.monthly-event-list::-webkit-scrollbar-track {background: none;}

/* Handle */
.monthly-event-list::-webkit-scrollbar-thumb {
	background: #ccc;
	border: 1px solid #E9EBEC;
	border-radius: 0.5em;
}
.monthly-event-list::-webkit-scrollbar-thumb:hover {background: #555;}

/* Language-specific. Default is English. */
.monthly-reset:after		{ content: 'Today'; }
.monthly-cal:after			{ content: 'Month'; }
.monthly-list-item:after	{ content: 'No Events'; }

.monthly-locale-fr .monthly-reset:after		{ content: "aujourd'hui"; }
.monthly-locale-fr .monthly-cal:after		{ content: "mois"; }
.monthly-locale-fr .monthly-list-item:after	{ content: 'aucun 챕v챕nement'; }


/*
Calendar shows event titles if the device width allows for at least 3em per day (rounded
up to 25em total). This assumes the calendar font is close to the baseline font size and
the calendar takes up close to the full media width as the window is made smaller or the
font is zoomed. If one or both of these is not true, this will need to be overridden by
a layout-specific width, or you will need to use a library like css-element-queries to 
establish the rules based on the calendar element width rather than the device width.
*/
@media (min-width: 25em) {
	.monthly-day-event {
		padding-top: 1.3em;
	}
	.monthly-day-event > .monthly-indicator-wrap {
		width: auto;
		max-width: none;
	}
	.monthly-indicator-wrap {
		padding: 0;
	}
	.monthly-day:before {
		padding-top: calc(100% - 1.2em);
	}
	.monthly-day .monthly-event-indicator {
		display: block;
		margin: 0 0 1px 0;
		width: auto;
		height: 1.5em;
		line-height: 1.2em;
		padding: 0.125em 0 0.1em 0.125em;
		border-radius: 0;
		overflow: hidden;
		background-color: #333;
		color: #333;
		text-decoration: none;
		white-space: nowrap;
		box-sizing: border-box;
	}
	.monthly-day .monthly-event-indicator.monthly-event-continued {
		box-shadow: -1px 0 0 0;
	}
	.monthly-day .monthly-event-indicator span {
		display: block;
		width: auto;
		margin: 0;
		color: #fff;
		padding: 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	#mycalendar {
		width: 100%;
		margin: 2em auto 0 auto;
		max-width: 80em;
		border: 1px solid #666;
	}   
	.aspect { width: 50px; height: 100px; }   
	.check{
		border: 1px solid #777777;
	}           
</style>
<script type="text/javascript">
$.datepicker.setDefaults({
	 inline: true, 
	 dateFormat: "yy-mm-dd",    /* 날짜 포맷 */ 
	 prevText: 'prev', 
	 nextText: 'next', 
	 showButtonPanel: true,    /* 버튼 패널 사용 */ 
	 changeMonth: true,        /* 월 선택박스 사용 */ 
	 changeYear: true,        /* 년 선택박스 사용 */ 
	 showOtherMonths: true,    /* 이전/다음 달 일수 보이기 */ 
	 selectOtherMonths: true,    /* 이전/다음 달 일 선택하기 */ 
	 showOn: "button", 
	 buttonImage: "img/calendar03.gif",
	 buttonImageOnly: true, 
	 minDate: '-30y', 
	 closeText: '닫기', 
	 currentText: '오늘', 
	 showMonthAfterYear: true,        /* 년과 달의 위치 바꾸기 */ 
	 /* 한글화 */ 
	 monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	 monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
	 dayNames : ['일', '월', '화', '수', '목', '금', '토'],
	 dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
	 dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
	 showAnim: 'slideDown'
  });


$(function() {
    $("#datepicker1, #datepicker2").datepicker();
    $("#datepicker3, #datepicker4").datepicker();
    $("#datepickerDate").datepicker();
  });
</script>
<script>
var page=1;
var totalPage=${total_page};
$(function(){
	productInList(1);
	/* if ($("body").height() < $(window).height()) {
		++page;
		productInList(page);
	} */
})
$(function(){
	window.onscroll = function(ev) {
	    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	if(page<totalPage) {
	    		++page;
	    		productInList(page);
	    	}
	    }
	};
})
$(function(){
	$("input[name=colum]").click(function(){
		productInList(page);
	});
	$("input[name=order]").click(function(){
		productInList(page);
	});
})
function showImg(){
	
	var imgName=$("#productName option:selected").attr('data-imgSaveFilename');
	//alert($("#productName").val());

	if(imgName=="null"){
		$("#showImgArea").text("상품이미지가 없습니다.");
	}else{
		$("#showImgArea").html("<img width='50' height='80' onError='<%=cp%>/uploads/shopProduct/error.png' src=<%=cp%>/uploads/shopProduct/"+imgName+">");
	}
}
function call(){
	var price=$("#pdRawPrice").val();
	var	num=$("#pdInNum").val();
	
		var tot=parseInt(price)*parseInt(num);
		if(! tot){
			$("#totalPrice").text("0원");
		}else{
			tot=tot.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalPrice").text(tot+"원");
		}
}
function productInList(page){
	$("#created").removeClass("check");
	$("#exDate").removeClass("check");
	var url="<%=cp%>/hotShop/productInInfo";
	var data=
		"colum="+$(':radio[name="colum"]:checked').val()
		+"&order="+$(':radio[name="order"]:checked').val()
		+"&page="+page;
	if($('input[name="startDate"]').val()!=""
			||$('input[name="endDate"]').val()!=""){
		
		var checkDate=$('input[name="startDate"]').val();
		if(checkDate==""){
			alert("조회기간을 설정해주세요");
			checkDate.focus();
			return;  
		}
		data+="&startDate="+checkDate;
		checkDate=$('input[name="endDate"]').val();
		if(checkDate==""){
			alert("조회기간을 설정해주세요");
			checkDate.focus();
			return;
		}
		data+="&endDate="+checkDate;
	}
	alert(data);
	$.ajax({
		type: "post"
		,url: url
		,data:data
		,success:function(a){
			$("#productInList").html(a);
			if($(':radio[name="colum"]:checked').val()=="pdincode"){
				$("#created").addClass("check");
			}else if($(':radio[name="colum"]:checked').val()=="pdexdate"){
				$("#exDate").addClass("check");
			}
		}
	});
}

function productInSend(f){
	var str=f.pdnum.value;
	console.log(str);
	str=f.pdrawprice.value;
	console.log(str);
	str=f.pdinnum.value;
	console.log(str);
	str=f.pdexdate.value;
	console.log(str);
	str=f.supplycode.value;
	console.log(str);
	var data=$("form[name=productInForm]").serialize();
	var url="<%=cp%>/hotShop/productInlist";
	$.ajax({
		type:"post"
		,url:url
		,data:data
		,dataType:"json"
		,success:function(data){
			productInList(1);
		}
	});
}

</script>
<form name="productInForm" method="post">
<table style="width:100%; margin-top: 100px; border-collapse: collapse;">
	<tr height="30px"style="border-bottom: 2px solid #373737">
		<td width="15%">상품이미지</td>                                            
		<td width="25%">상품이름</td>
		<td width="10%">원가</td>
		<td width="10%">입고수량</td>
		<td width="10%">총액</td>
		<td width="10%">유통기한</td>
		<td width="10%">입고날</td>
		<td width="10%">업체명</td>
	</tr>
	<tr class="productIn" height="70px" style="border-bottom: 2px solid #e7e7e7">
		<td id="showImgArea">상품이미지</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">
		<select id="productName" name="pdnum" onchange="showImg();">
			<option>::상품</option>
			<c:forEach var="dto" items="${productList}">
				<option value="${dto.pdnum}" data-imgSaveFilename="${dto.imgSaveFilename}">${dto.pdName}</option>
			</c:forEach>
		</select>
		</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><input style="width: 70px;" type="text" name="pdrawprice" id="pdRawPrice" onkeyup='call()'></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><input style="width: 70px;" type="text" name="pdinnum" id="pdInNum" onkeyup='call()'></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; " id="totalPrice" ></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><input style="width: 90px;" name="pdexdate" type="text" id="datepickerDate"></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">입고날(자동생성)</td>                 
		<td>
		<select id="supplyName" name="supplycode" onchange="showImg();">
			<option>::업체명</option>
			<c:forEach var="dto" items="${supplyList}">
				<option value="${dto.supplycode}">${dto.supplyname}</option>
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr><td colspan="8"><button type="button" class="btn" style="float: right;" onclick="productInSend(this.form);">입고</button></td></tr>
</table>
</form>

<form name="searchDateForm" method="post">
<table style="width:100%; margin-top: 50px; margin-bottom:100px; border-collapse: collapse;">
	<tr>
		<td colspan="8">
		조회기간: 
	  		<input type="text" name="startDate" id="datepicker1" disabled="disabled"> ~ <input type="text" name="endDate" id="datepicker2" disabled="disabled">
	  		<button type="button" class="btn" onclick="productInList(1);">조회</button>
		</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: left;"><input name="order" type="radio" checked="checked" value="asc">오름차순 <input name="order" type="radio" checked="checked" value="desc">내림차순 </td> <td colspan="4" style="text-align: right;"><input name="colum" type="radio" checked="checked" value="pdincode">입고순 <input name="colum" type="radio" value="pdexdate">유통기한순</td>
	</tr>
	<tr height="30px" style="border-bottom: 2px solid #373737">
		<td width="10%">상품이미지</td>
		<td width="25%">상품이름</td>                  
		<td width="10%">원가</td>
		<td width="10%">입고수량</td>
		<td width="10%">총액</td>
		<td id="exDate" width="10%">유통기한</td>
		<td id="created" width="10%">입고날</td>                                          
		<td width="10%">업체명</td>
	</tr>
	<tbody id="productInList">
	</tbody>
</table>
</form>
<input type="hidden" id="SJson"></input>
<script type="text/javascript">
function sales(){
	var f=document.scheduleForm;
	var str=f.name.value
	if(str==""){
		alert("일정내용을 입력해주세요");
		f.sdname.focus();
		return;
	}
	alert(str);
	str=f.startdate.value;
	if(str==""){
		alert("일정 시작일을 입력해주세요");
		f.startdate.focus();
		return;
	}
	alert(str);
	str=f.enddate.value;
	if(str==""){
		alert("일정 종료일을 입력해주세요");
		f.enddate.focus();
		return;
	}
	alert(str);
	str=f.starttime.value;
	if(str==""){
		alert("일정 시작시간을 입력해주세요");
		f.starttime.focus();
		return;
	}
	alert(str);
	str=f.endtime.value;
	if(str==""){
		alert("일정 종료시간을 입력해주세요");
		f.endtime.focus();
		return;
	}
	alert(str);
	var scheduleData=$("form[name=scheduleForm]").serialize();
	var url="<%=cp%>/hotShop/schedule";
	$.ajax({
		type:"post"
		,url:url
		,data:scheduleData
		,dataType:"json"
		,success:function(data){
			console.log(data);
			console.log(data.scheduleList);
			alert(data.scheduleList);
		}
	});
}


</script>