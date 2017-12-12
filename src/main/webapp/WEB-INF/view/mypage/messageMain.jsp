<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
ul.tabs {
    margin: 0px auto;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:201px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-bottom: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;

}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 603px;
	height: 520px;
    background: #FFFFFF;
    margin-bottom: 200px;
}
.tab_content {

    font-size: 12px; 
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {

    list-style:none
}
;
 #container {
    width: 603px;
    margin: 0px auto 10px;
}

</style>

<script type="text/javascript">

$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});





$(function(){ 
	$("#button").button(); 

	
	$("#button").click(function(){

		$("#dialog").dialog("open"); 
		
		});
	
	$("#dialog").dialog({ //이벤트 발생했을때 보여주려면 autoOpen : false로 지정해줘야 한다. 
		
		autoOpen: false, //레이어팝업 넓이 
		width: 400, //뒷배경을 disable 시키고싶다면 true 
		modal: true, //버튼종류

		buttons: [ { //버튼텍스트 
			text: "Ok", //클릭이벤트발생시 동작
			click: function() { 
				$( this ).dialog("close"); 
				
				} 
		}, 
		{ //버튼텍스트 
			text: "Cancel", //클릭이벤트발생시 동작 
			click: function() { $( this ).dialog("close"); 
			} } ]  
			
			});
})

</script>



</head>
<body>

<div style="height: 100px">
</div>

<div align="center">
<h3>MESSAGE</h3>
</div>

        <div id="dialog" title="레이어팝업 제목"> 
        		해당부분은 레이어 팝업의 내용이다. br태그없이 알아서 자동 줄바꿈 처리가 되있음....
         </div>

<div style=" width:605px; margin: 50px auto; ">
<div id="container">
    <ul class="tabs" style="border-bottom: none; margin: 0px auto;">
        <li class="active" rel="tab1">쪽지보내기</li>
        <li rel="tab2">받은쪽지함</li>
        <li rel="tab3">보낸쪽지함</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
		<table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td style="width: 50%">새 쪽지 0통 / 전체 0통</td>
				<td style="width: 50%"><input type="button" id="button" value="쪽지쓰기"  style="float: right;"></td>
			</tr>
			<tr style="width: 100%; border-style: none;">
				<td  colspan="2" style="width: 100%; border: 1px solid;padding-top: 10px;">
				<input id="sender" style="background:white; width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="보낸사람">
				<input id="taker" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="받는사람">
				<input id="subject" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="제목">
				<input id="content" style="background:white;width: 21%;height: 31px; cursor: pointer; " type="text" placeholder="내용">
				<input type="button" value="찾기" style="margin-left: 15px;"></td>
			</tr>
        </table>
        <table style="width: 98%; margin: 10px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td colspan="5" style="width: 50%"><input type="button" value="삭제"></td>
				<td colspan="3" style="width: 50%">
				<select name="kind">
				<option selected="selected">전체보기</option>
				<option>중요표시 쪽지만</option>
				<option>첨부파일 쪽지만</option>
				<option>나에게 보낸 쪽지만</option>
				<option>안읽은 쪽지만</option>
				<option>읽은 쪽지만</option>
				</select>
				<input type="button" value="새로고침">
			</tr>
			
			<tr style="width: 100%; border-style: none;">
				<td style="width: 5%; border: 1px solid; "><input type="checkbox"></td>
				<td style="width: 10%; border: 1px solid;">상태</td>
				<td style="width: 12%; border: 1px solid;">보낸사람</td>
				<td style="width: 12%; border: 1px solid;">받는사람</td>
				<td style="width: 12%; border: 1px solid;">쪽지함</td>
				<td style="width: 22%; border: 1px solid;">제목</td>
				<td style="width: 12%; border: 1px solid;">크기(KB)</td>
				<td style="width: 15%; border: 1px solid;">송/수신시간</td>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr style="width: 100%; border-style: none;">
				<td style="width: 5%; border: 1px solid; "><input type="checkbox"></td>
				<td style="width: 10%; border: 1px solid;">상태</td>
				<td style="width: 12%; border: 1px solid;">보낸사람</td>
				<td style="width: 12%; border: 1px solid;">받는사람</td>
				<td style="width: 12%; border: 1px solid;">쪽지함</td>
				<td style="width: 22%; border: 1px solid;">제목</td>
				<td style="width: 12%; border: 1px solid;">크기(KB)</td>
				<td style="width: 15%; border: 1px solid;">송/수신시간</td>
			</tr>
			</c:forEach>
        </table>
		
		</div>
		
		
        <div id="tab2" class="tab_content">
        
        <table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td style="width: 50%">새 쪽지 0통 / 전체 0통</td>
				<td style="width: 50%"><input  type="button" value="쪽지쓰기" style="float: right;"></td>
			</tr>
			<tr style="width: 100%; border-style: none;">
				<td  colspan="2" style="width: 100%; border: 1px solid;padding-top: 10px;">
				<input style="background:white; width: 21%;height: 31px;" type="text" value="보낸사람">
				<input style="background:white;width: 21%;height: 31px;" type="text" value="받는사람">
				<input style="background:white;width: 21%;height: 31px;" type="text" value="제목">
				<input style="background:white;width: 21%;height: 31px;" type="text" value="내용">

				<input  type="button" value="찾기" style="margin-left: 15px;"></td>
			</tr>
        </table>
        <table style="width: 98%; margin: 10px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td colspan="5" style="width: 50%"><input type="button" value="삭제"></td>
				<td colspan="3" style="width: 50%">
				<select name="kind">
				<option selected="selected">전체보기</option>
				<option>중요표시 쪽지만</option>
				<option>첨부파일 쪽지만</option>
				<option>나에게 보낸 쪽지만</option>
				<option>안읽은 쪽지만</option>
				<option>읽은 쪽지만</option>
				</select>
				<input type="button" value="새로고침">
			</tr>
			
			<tr style="width: 100%; border-style: none;">
				<td style="width: 5%; border: 1px solid; "><input type="checkbox"></td>
				<td style="width: 14%; border: 1px solid;">상태</td>
				<td style="width: 17%; border: 1px solid;">보낸사람</td>
				<td style="width: 36%; border: 1px solid;">제목</td>
				<td style="width: 15%; border: 1px solid;">크기(KB)</td>
				<td style="width: 15%; border: 1px solid;">송/수신시간</td>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr style="width: 100%; border-style: none;">
				<td style="width: 5%; border: 1px solid; "><input type="checkbox"></td>
				<td style="width: 14%; border: 1px solid;">상태</td>
				<td style="width: 15%; border: 1px solid;">보낸사람</td>
				<td style="width: 36%; border: 1px solid;">제목</td>
				<td style="width: 15%; border: 1px solid;">크기(KB)</td>
				<td style="width: 15%; border: 1px solid;">송/수신시간</td>
			</tr>
			</c:forEach>
        </table>
        
        </div>
        
        <div id="tab3" class="tab_content">
        <table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td style="width: 50%">새 쪽지 0통 / 전체 0통</td>
				<td style="width: 50%"><input  type="button" value="쪽지쓰기" style="float: right;"></td>
			</tr>
			<tr style="width: 100%; border-style: none;">
				<td  colspan="2" style="width: 100%; border: 1px solid;padding-top: 10px;">
				<input style="background:white; width: 21%;height: 31px;" type="text" value="보낸사람">
				<input style="background:white;width: 21%;height: 31px;" type="text" value="받는사람">
				<input style="background:white;width: 21%;height: 31px;" type="text" value="제목">
				<input style="background:white;width: 21%;height: 31px;" type="text" value="내용">

				<input  type="button" value="찾기" style="margin-left: 15px;"></td>
			</tr>
        </table>
        <table style="width: 98%; margin: 10px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td colspan="5" style="width: 50%"><input type="button" value="삭제"></td>
				<td colspan="3" style="width: 50%">
				<select name="kind">
				<option selected="selected">전체보기</option>
				<option>중요표시 쪽지만</option>
				<option>첨부파일 쪽지만</option>
				<option>나에게 보낸 쪽지만</option>
				<option>안읽은 쪽지만</option>
				<option>읽은 쪽지만</option>
				</select>
				<input type="button" value="새로고침">
			</tr>
			
			<tr style="width: 100%; border-style: none;">
				<td style="width: 5%; border: 1px solid; "><input type="checkbox"></td>
				<td style="width: 14%; border: 1px solid;">상태</td>
				<td style="width: 15%; border: 1px solid;">받는사람</td>
				<td style="width: 36%; border: 1px solid;">제목</td>
				<td style="width: 15%; border: 1px solid;">크기(KB)</td>
				<td style="width: 15%; border: 1px solid;">송/수신시간</td>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr style="width: 100%; border-style: none;">
				<td style="width: 5%; border: 1px solid; "><input type="checkbox"></td>
				<td style="width: 14%; border: 1px solid;">상태</td>
				<td style="width: 15%; border: 1px solid;">받는사람</td>
				<td style="width: 36%; border: 1px solid;">제목</td>
				<td style="width: 15%; border: 1px solid;">크기(KB)</td>
				<td style="width: 15%; border: 1px solid;">송/수신시간</td>
			</tr>
			</c:forEach>
        </table>
        
       <!--  
        <div id="tab1" class="tab_content">
		<table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr height="31">
				<td style=" width:15%; border: 1px solid #eeeeee;margin-left: 5px; ">받는사람</td>
				<td style="border: 1px solid #eee;">
					<input type="text" style="width: 85%; height: 25px; margin-top: 9px;">
					<input type="button" style="height: 25px; text-align: center;margin-top: 9px; margin-left: 3px;" value="받는사람"></td>	
			</tr>
			<tr>
			    <td style="border: 1px solid #eee; margin-left: 5px; width:15%;">제목</td>
				<td style="border: 1px solid #eee;"><input type="text" style="width:100%; height: 25px;margin-top: 9px; "></td>	
			</tr>
			<tr>
				<td colspan="2" style="clear:both; width: 100%;"  ><textarea style="width: 100%; overflow: auto; height: 150px;"></textarea></td>
			</tr>	
		</table>
		
		<table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px " >
				<td colspan="2" width="100%" background="#F2F2F2" ><img src="<%=cp%>/resource/images/647e16b7feb0fe7e0f4f3b9f5f402f5e.png" style="max-height: 18px;">파일첨부</td>
			</tr>
			<tr style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px ">
				<td colspan="2" style="width: 100%;" ><input  type="text" style="width: 60%; height: 25px; float: left;"><input type="file" value="파일첨부" style="float: left; margin-left: 2px" ></td>
			</tr>
			<tr   style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px ">
				<td rowspan="2" style=" width: 90%"><input style="height: 100px"  type="text">
				</td>
				<td style=" width: 40%"><input type="button" value="삭제"></td>
			</tr>	
			<tr style=" width: 100%; margin-top: 10px; margin-bottom: 10px;">
				<td style=" width: 40%; ">0KB/50M</td>
			</tr>	
			<tr>
				<td>*첨부된 파일 최대 20개, 총 용량 50M를 넘을 수 없습니다.</td>
			</tr>	
			<tr align="center" style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px ">
				<td colspan="2"><input type="button" value="보내기"> <input type="button" value="취소"></td>
			</tr>
		</table>
		
		</div> 
        --> 


        
        
        </div>
    </div>
</div>
</div>
	
</body>
</html>