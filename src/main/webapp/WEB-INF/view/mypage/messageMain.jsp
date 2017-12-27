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
    width:301px;
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
    width: 903px;
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
    width: 903px;
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



$(function () {
	

	$("#dialog").dialog({ //이벤트 발생했을때 보여주려면 autoOpen : false로 지정해줘야 한다. 
			autoOpen: false, //레이어팝업 넓이 
			width: 605, //뒷배경을 disable 시키고싶다면 true 
			modal: true 
		});

	$(".sendingMsg").click(function () {
		$("#dialog").dialog("open");
		
	});
});

function checkId() {
	
	var f = document.sendMessage;

	var q="userId2="+f.userId2.value;
	var url ="<%=cp%>/mypage/checkId"
	
		$.ajax({
			type:"post"
			,url:url
			,data:q
			,dataType:"json"
			,success:function(data) {
				var s=data.state;
				if(s=="empty") {
					alert("없는 아이디 입니다. 다시 검색해 주세요.")
					return;
				}
				
				alert("존재하는 아이디 입니다. 메세지를 입력해주세요.")

			}
		    ,error:function(e) {
		    	console.log(e.responseText);
		    }
		});
	

}





$(function() {

    $("#fileView").on("change","input[name=uploadFile]",function() {

    	if(!$(this).val()){
    		return;
    	}
    	var b=false;
    	
    	$("input[name=uploadFile]").each(function(){
  			if(! $(this).val()) {
  				b=true;
  				return;
  			}
  		});
    	
  		if(b)
  			return;
    	
  		var fileName=$(this).val()
        	
            $('#fileView').append(
            		'<input style=" width: 60%" type="text" value="'+fileName+'" >'+
            		'<tr style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px ">'+
            		'<td>'+
            		'<input type="file" name="uploadFile" value="파일첨부" style="float: left; margin-left: 20px;" >'+
            		'</td>'+
            		'</tr>'	
                    
            		); 

});


});


function Article(mCode){
	$("#readMessage").dialog({
		width: 605, //뒷배경을 disable 시키고싶다면 true 
		modal: true,
		open:function(e){
			var q="mCode="+mCode;
			var url ="<%=cp%>/mypage/readingMessage?"+q;
			$(this).load(url); //load는 get 방식 AJAX
		}
	});
}

$(function(){ 
	//전체선택 체크박스 클릭 
	$("#allCheck").click(function(){ 
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allCheck").prop("checked")) { 
			//해당화면에 전체 checkbox들을 체크해준다 
			$("input[type=checkbox]").prop("checked",true); 
			// 전체선택 체크박스가 해제된 경우 
			} 
		else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		} 
		}) ;
		
}); 


$(function(){ 
	
	$("#deleteMessage").click(function(){ 
		var url="<%=cp%>/mypage/deleteMessage";
		var f =document.deleteMess;
		
		f.action=url;
		f.submit();

	});
}); 







</script>



</head>
<body>

<div style="height: 100px">
</div>

<div align="center">
<h3>MESSAGE</h3>
</div>

  
       <div id="dialog" title="쪽지보내기"> 
      <form name="sendMessage" method="post" enctype="multipart/form-data" action="<%=cp%>/mypage/sendMessage">
        <table style="border: 1px solid #eee;  width: 98%; margin: 5px auto 5px;">
			<tr height="31">
				<td style=" width:15%; border: 1px solid #eeeeee;margin-left: 5px; ">받는사람</td>
				<td style="border: 1px solid #eee;">
					<input type="text" name="userId2" value="" style="width: 75%; height: 25px; margin-top: 9px;">
					<input type="button" onclick="checkId()" style="float:right; height: 25px; text-align: center;margin-top: 9px; margin-right: 20px;" value="아이디확인"></td>	
			</tr>
			<tr>
			    <td style="border: 1px solid #eee; margin-left: 5px; width:15%;">제목</td>
				<td style="border: 1px solid #eee;"><input name="subject" type="text" style="width:100%; height: 25px;margin-top: 9px; "></td>	
			</tr>
			<tr>
				<td colspan="2" style="clear:both; width: 100%;" >
				<textarea name="content" style="width: 100%; overflow: auto; height: 80px;"></textarea></td>
			</tr>	
		</table>
	
		<table  style=" width: 98%; margin: 5px auto 5px;">
			<tr style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px " >
				<td colspan="2" width="100%" background="#F2F2F2" ><img src="<%=cp%>/resource/images/647e16b7feb0fe7e0f4f3b9f5f402f5e.png" style="max-height: 18px;">파일첨부</td>
			</tr>
		</table>
		<table id="fileView" style=" width: 98%; margin: 5px auto 5px;">
			<tr style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px ">
				<td colspan="2" style="width: 100%;" >
					<input type="file" name="uploadFile" value="파일첨부" style="float: left; margin-left: 20px;" >
				</td>
			</tr>
		</table>
		<table  style=" width: 98%; margin: 5px auto 5px;">
			<tr>
				<td>*첨부된 파일 최대 20개, 총 용량 50M를 넘을 수 없습니다.</td>
			</tr>	
			<tr align="center" style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px ">
				<td colspan="2"><input type="submit" value="보내기" > <input type="reset" value="취소"></td>
			</tr>
		</table>
			
		</form>
         </div>


	<div id="readMessage" title="쪽지보기"></div>

<div style=" width:905px; margin: 50px auto; ">
<div id="container">
    <ul class="tabs" style="border-bottom: none; margin: 0px auto;">
        <li class="active" rel="tab1" >전체쪽지함</li>
        <li rel="tab2" >받은쪽지함</li>
        <li rel="tab3" >보낸쪽지함</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        <form name="searchList" method="post" onsubmit="<%=cp%>/mypage/messageMain">
		<table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td style="width: 50%"> [전체 ${listSize}통]</td>
				<td style="width: 50%"><input type="button" class="sendingMsg" value="쪽지쓰기"  style="float: right;"></td>
			</tr>
			
			<tr style="width: 100%; border-style: none;">
				<td  colspan="2" style="width: 100%; border: 1px solid;padding-top: 10px;">
				<input  name="ssender" style="background:white; width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="보낸사람">
				<input name="staker" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="받는사람">
				<input  name="ssubject" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="제목">
				<input  name="scontent" style="background:white;width: 21%;height: 31px; cursor: pointer; " type="text" placeholder="내용">
				<button type="submit" style="margin-left: 15px;">찾기</button></td>
			</tr>
			
        </table>
        </form>
        <form name="deleteMess" method="post"> 
        <table style="width: 98%; margin: 10px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td colspan="5" style="width: 90%"><input id="deleteMessage" type="submit" value="삭제" ></td>
				<td colspan="2" style="width: 10%">

				<select style="height:26px; float: right" >
				<option selected="selected">전체보기</option>
				<option>중요표시 쪽지만</option>
				<option>첨부파일 쪽지만</option>
				<option>나에게 보낸 쪽지만</option>
				<option>안읽은 쪽지만</option>
				<option>읽은 쪽지만</option>
				</select>
				</td>
			</tr>
			
			<tr style="width: 100%; border-style: none; border-style: double; background:#eee ">

				<td style="width: 3%; border: 1px solid; "><input id="allCheck" type="checkbox" ></td>

				<td style="width: 12%; border: 1px solid;">보낸사람</td>
				<td style="width: 12%; border: 1px solid;">받는사람</td>
				<td style="width: 14%; border: 1px solid;">쪽지함</td>
				<td style="width: 33%; border: 1px solid;">제목</td>
				<td style="width: 10%; border: 1px solid;">크기(KB)</td>
				<td style="width: 16%; border: 1px solid;">송/수신시간</td>

			</tr>
			<tr></tr>
			
			<c:forEach var="dto" items="${list}">
			<tr style="width: 100%; border-style: none;">

				<td style="width: 3%; border: 1px solid; "><input name="mCode" type="checkbox" value="${dto.mCode}"></td>

				<td style="width: 12%; border: 1px solid;">${dto.userId}</td>
				<td style="width: 12%; border: 1px solid;">${dto.userId2}</td>
				<td style="width: 14%; border: 1px solid;">${dto.box}</td>
				<td style="width: 33%; border: 1px solid;"><a class="readingMessage" style="cursor: pointer; " onclick="Article('${dto.mCode}')" >${dto.subject}</a></td>
				<td style="width: 10%; border: 1px solid;">${dto.totalFileSize}</td>
				<td style="width: 16%; border: 1px solid;">${dto.sCreated}</td>

			</tr>
			
			</c:forEach>
			
        </table>
        </form>
			<div style="height: 100px;" align="center" >
				<a style="margin-top:20px; position: relative; top: 10px;">${paging}</a>
			</div>
			
		</div>
		
		
        <div id="tab2" class="tab_content">
        
        <form name="searchList" method="post" onsubmit="<%=cp%>/mypage/messageMain">
		<table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td style="width: 50%"> [전체 ${listSize2}통]</td>
				<td style="width: 50%"><input type="button" class="sendingMsg" value="쪽지쓰기"  style="float: right;"></td>
			</tr>
			
			<tr style="width: 100%; border-style: none;">
				<td  colspan="2" style="width: 100%; border: 1px solid;padding-top: 10px;">
				<input  name="ssender" style="background:white; width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="보낸사람">
				<input name="staker" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="받는사람">
				<input  name="ssubject" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="제목">
				<input  name="scontent" style="background:white;width: 21%;height: 31px; cursor: pointer; " type="text" placeholder="내용">
				<button type="submit" style="margin-left: 15px;">찾기</button></td>
			</tr>
			
        </table>
        </form>
        <form name="deleteMess" method="post"> 
        <table style="width: 98%; margin: 10px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td colspan="5" style="width: 90%"><input id="deleteMessage" type="submit" value="삭제" ></td>
				<td colspan="2" style="width: 10%">

				<select style="height:26px; float: right" >
				<option selected="selected">전체보기</option>
				<option>중요표시 쪽지만</option>
				<option>첨부파일 쪽지만</option>
				<option>나에게 보낸 쪽지만</option>
				<option>안읽은 쪽지만</option>
				<option>읽은 쪽지만</option>
				</select>
				</td>
			</tr>
			
			<tr style="width: 100%; border-style: none; border-style: double; background:#eee ">

				<td style="width: 3%; border: 1px solid; "><input id="allCheck" type="checkbox" ></td>

				<td style="width: 12%; border: 1px solid;">보낸사람</td>

				<td style="width: 14%; border: 1px solid;">쪽지함</td>
				<td style="width: 33%; border: 1px solid;">제목</td>
				<td style="width: 10%; border: 1px solid;">크기(KB)</td>
				<td style="width: 16%; border: 1px solid;">송/수신시간</td>

			</tr>
			<tr></tr>
			
			<c:forEach var="dto" items="${list2}">
			<tr style="width: 100%; border-style: none;">

				<td style="width: 3%; border: 1px solid; "><input name="mCode" type="checkbox" value="${dto.mCode}"></td>

				<td style="width: 12%; border: 1px solid;">${dto.userId}</td>

				<td style="width: 14%; border: 1px solid;">${dto.box}</td>
				<td style="width: 33%; border: 1px solid;"><a class="readingMessage" style="cursor: pointer; " onclick="Article('${dto.mCode}')" >${dto.subject}</a></td>
				<td style="width: 10%; border: 1px solid;">${dto.totalFileSize}</td>
				<td style="width: 16%; border: 1px solid;">${dto.sCreated}</td>

			</tr>
			
			</c:forEach>
			
        </table>
        </form>
			<div style="height: 100px;" align="center" >
				<a style="margin-top:20px; position: relative; top: 10px;">${paging}</a>
			</div>
        
        </div>
        
        <div id="tab3" class="tab_content">
        <form name="searchList" method="post" onsubmit="<%=cp%>/mypage/messageMain">
		<table style="border: 1px solid #eee; width: 98%; margin: 5px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td style="width: 50%"> [전체 ${listSize3}통]</td>
				<td style="width: 50%"><input type="button" class="sendingMsg" value="쪽지쓰기"  style="float: right;"></td>
			</tr>
			
			<tr style="width: 100%; border-style: none;">
				<td  colspan="2" style="width: 100%; border: 1px solid;padding-top: 10px;">
				<input  name="ssender" style="background:white; width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="보낸사람">
				<input name="staker" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="받는사람">
				<input  name="ssubject" style="background:white;width: 21%;height: 31px; cursor: pointer;" type="text" placeholder="제목">
				<input  name="scontent" style="background:white;width: 21%;height: 31px; cursor: pointer; " type="text" placeholder="내용">
				<button type="submit" style="margin-left: 15px;">찾기</button></td>
			</tr>
			
        </table>
        </form>
        <form name="deleteMess" method="post"> 
        <table style="width: 98%; margin: 10px auto 5px;">
			<tr style="width: 100%; border-style: none; margin-bottom: 20px;">
				<td colspan="5" style="width: 90%"><input id="deleteMessage" type="submit" value="삭제" ></td>
				<td colspan="2" style="width: 10%">

				<select style="height:26px; float: right" >
				<option selected="selected">전체보기</option>
				<option>중요표시 쪽지만</option>
				<option>첨부파일 쪽지만</option>
				<option>나에게 보낸 쪽지만</option>
				<option>안읽은 쪽지만</option>
				<option>읽은 쪽지만</option>
				</select>
				</td>
			</tr>
			
			<tr style="width: 100%; border-style: none; border-style: double; background:#eee ">

				<td style="width: 3%; border: 1px solid; "><input id="allCheck" type="checkbox" ></td>


				<td style="width: 12%; border: 1px solid;">받는사람</td>
				<td style="width: 14%; border: 1px solid;">쪽지함</td>
				<td style="width: 33%; border: 1px solid;">제목</td>
				<td style="width: 10%; border: 1px solid;">크기(KB)</td>
				<td style="width: 16%; border: 1px solid;">송/수신시간</td>

			</tr>
			<tr></tr>
			
			<c:forEach var="dto" items="${list3}">
			<tr style="width: 100%; border-style: none;">

				<td style="width: 3%; border: 1px solid; "><input name="mCode" type="checkbox" value="${dto.mCode}"></td>


				<td style="width: 12%; border: 1px solid;">${dto.userId2}</td>
				<td style="width: 14%; border: 1px solid;">${dto.box}</td>
				<td style="width: 33%; border: 1px solid;"><a class="readingMessage" style="cursor: pointer; " onclick="Article('${dto.mCode}')" >${dto.subject}</a></td>
				<td style="width: 10%; border: 1px solid;">${dto.totalFileSize}</td>
				<td style="width: 16%; border: 1px solid;">${dto.sCreated}</td>

			</tr>
			
			</c:forEach>
			
        </table>
        </form>
			<div style="height: 100px;" align="center" >
				<a style="margin-top:20px; position: relative; top: 10px;">${paging}</a>
			</div>
        
        </div>
    </div>
</div>


</div>
	
</body>
</html>