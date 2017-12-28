<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
	.aspect { width: 50px; height: 100px; }   
	.check{
		border: 1px solid #777777;
	}           
</style>
<script type="text/javascript">
<%-- $.datepicker.setDefaults({
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
	 buttonImage: "<%=cp%>/uploads/shopList/Calendar.png",
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
  }); --%>
</script>
<script>
var page=1;
var totalPage=${total_page};
$(function(){
	productDisList(1);
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
	    		productDisList(page);
	    	}
	    }
	};
})
$(function(){
	$("input[name=colum]").click(function(){
		productDisList(page);
	});
	$("input[name=order]").click(function(){
		productDisList(page);
	});
})
function showImg(){
	
	var imgName=$("#productName option:selected").attr('data-imgSaveFilename');
	var pdrawprice=$("#productName option:selected").attr('data-pdrawprice');
	var pdexdate=$("#productName option:selected").attr('data-pdexdate');
	//alert($("#productName").val());
	if(imgName==null){
		$("#showImgArea").text("상품이미지가 없습니다.");
		$("#pdRawPrice").val(pdrawprice);
		
	}else{
		$("#showImgArea").html("<img width='50' height='80' onError='<%=cp%>/uploads/shopProduct/error.png' src=<%=cp%>/uploads/shopList/"+imgName+">");
		$("#pdRawPrice").val(pdrawprice);
	}
}
function call(){
	var price=$("#pdRawPrice").val();
	var	num=$("#pdDisNum").val();
	
		var tot=parseInt(price)*parseInt(num);
		if(! tot){
			$("#totalPrice").text("0원");
		}else{
			tot=tot.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalPrice").text(tot+"원");
		}
}
function productDisList(page){
	$("#created").removeClass("check");
	$("#exDate").removeClass("check");
	var url = "<%=cp%>/admin/hotShop/productDisInfo";
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
	$.ajax({
		type: "post"
		,url: url
		,data:data
		,success:function(a){
			$("#productDisList").html(a);
			if($(':radio[name="colum"]:checked').val()=="pdDiscode"){
				$("#created").addClass("check");
			}else if($(':radio[name="colum"]:checked').val()=="pdexdate"){
				$("#exDate").addClass("check");
			}
		}
	});
}

function productDisSend(f){
	var str=f.pdnum.value;
	console.log(str);
	str=f.pdrawprice.value;
	console.log(str);
	str=f.pdDisNum.value;
	console.log(str);
	str=f.supplycode.value;
	console.log(str);
	var data=$("form[name=productDisForm]").serialize();
	var url="<%=cp%>/admin/hotShop/productDisList";
	$.ajax({
		type:"post"
		,url:url
		,data:data
		,dataType:"json"
		,success:function(data){
			productDisList(1);
		}
	});
}
</script>
<form name="productDisForm" method="post">
<table style="width:80%; height: 100%; margin-top: 10px; margin-left: 10px; border-collapse: collapse;">
	<tr height="30px"style="border-bottom: 2px solid #373737">
		<td width="15%">상품이미지</td>                                            
		<td width="25%">상품이름</td>
		<td width="10%">원가</td>
		<td width="10%">폐기수량</td>
		<td width="7%">총액</td>
		<td width="10%">폐기사유</td>
		<td width="10%">업체명</td>
	</tr>
	<tr class="productIn" height="70px" style="border-bottom: 2px solid #e7e7e7">
		<td id="showImgArea" align="center"></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; ">
		<select id="productName" name="pdnum" onchange="showImg();">
			<option>::상품</option>
			<c:forEach var="dto" items="${productList}">
				<option value="${dto.pdnum}" data-imgSaveFilename="${dto.imgSaveFilename}" data-pdrawprice="${dto.pdRawPrice}">${dto.pdName}</option>
			</c:forEach>
		</select>
		</td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><input style="width: 100%;" type="text" name="pdrawprice" id="pdRawPrice" readonly="readonly" onkeyup='call()'></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><input style="width: 100%;" type="text" name="pdDisNum" id="pdDisNum" onkeyup='call()'></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; " id="totalPrice" ></td>
		<td style="border-left: 2px solid #e7e7e7; border-right: 2px solid #e7e7e7; "><input style="width: 100%;" type="text" name="pdDisReason" id="pdDisReason"></td>                 
		<td>
		<select id="supplyName" name="supplycode" onchange="showImg();">
			<option>::업체명</option>
			<c:forEach var="dto" items="${supplyList}">
				<option value="${dto.supplycode}">${dto.supplyname}</option>
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr><td colspan="7"><button type="button" class="btn" style="float: right;" onclick="productDisSend(this.form);">폐기</button></td></tr>
</table>
</form>

<form name="searchDateForm" method="post">
<table style="width:80%; height:100%; margin-top: 50px; margin-left: 10px; border-collapse: collapse;">
	<tr>
		<td colspan="7" style="vertical-align: bottom;">
		조회기간: 
	  		<input type="text" name="startDate" id="datepicker1" disabled="disabled" style="padding: 4px;"> ~ <input type="text" name="endDate" id="datepicker2" disabled="disabled" style="padding: 4px;">
	  		<button type="button" class="btn" onclick="productDisList(1);">조회</button>
		</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: left;">
		<input name="order" type="radio" checked="checked" value="asc">오름차순 
		<input name="order" type="radio" checked="checked" value="desc">내림차순 
		</td> 
		<td colspan="3" style="text-align: right;">
		<input name="colum" type="radio" checked="checked" value="pdDisCode">폐기순 
		<input name="colum" type="radio" value="pdexdate">유통기한순
		</td>
	</tr>
	<tr height="30px" style="border-bottom: 2px solid #373737">
		<td width="10%">상품이미지</td>
		<td width="25%">상품이름</td>   	               
		<td width="10%">원가</td>
		<td width="10%">폐기수량</td>
		<td width="10%">총액</td>
		<td id="created" width="10%">폐기날</td>                                          
		<td width="10%">업체명</td>
	</tr>
	<tbody id="productDisList">
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