<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.guest-write{
	border: 1px solid #d5d5d5;
	padding: 10px;
	min-height: 50px;
}

.listGuestBody{
border-radius: 0.1875rem;
}


</style>


 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
<link rel="stylesheet" href="<%=cp%>/resource/css11/style.css">

<script type="text/javascript">
var pageNo=1;
var totalPage=${total_page};

$(function(){
	listPage(1);
});

// $(window).scrollTop() : 브라우저 스크롤 위치 값
// $(window).height() : 윈도우 높이
// $(document).height() : 현재페이지의 높이
// $(document).scroll() : 스크롤이 변경될때마다 이벤트를 발생시킴

$(function(){ // 무한 스크롤 
	$(window).scroll(function() {
	    if ($(window).scrollTop() +100 >= $(document).height() - $(window).height()) {
	    	if(pageNo<totalPage) {
	    		++pageNo;
	    		listPage(pageNo);
	    	}
	    }
	});
});

function listPage(page) {
	var url="<%=cp%>/guest/list";
	
	// json으로 넘겨 받음
	$.post(url, {pageNo:page}, function(data){
		printGuest(data);
	}, "json");
}

function printGuest(data) {
	// console.log(data);
	var uid="${sessionScope.member.userId}";
	var dataCount=data.dataCount;
	totalPage=data.total_page;
	
	var out="";
	if(dataCount!=0) {
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var userName=data.list[idx].userName;
			var userId=data.list[idx].userId;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			
			out+="    <tr height='35' bgcolor='#eeeeee' id='tr"+num+"'>";
			out+="      <td width='50%' style='padding-left: 5px; padding-top:10px; border-right:none ; '>"+ userId+"</td>";
			if(uid==userId || uid=="admin") {
			out+="      <td width='50%' align='right' style='padding-right: 5px; border-left:none;'>" + created;
				out+=" | <a onclick='deleteGuest(\""+num+"\");'>삭제</a></td>" ;
			} else {
				out+=" | <a href='#'>신고</a></td>" ;
			}
			out+="    </tr>";
			out+="    <tr style='height: 50px;'>";
			out+="      <td colspan='2' style='padding: 5px;' valign='top' background-color: #fffff;>"+content+"</td>";
			out+="    </tr>";
		}
		$("#listGuestBody").append(out);
	}
}


function sendGuest() {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		location.href="<%=cp%>/member/login";
		return;
	}
	
	var content=$.trim($("#content").val());
	if(! content) {
		$("#content").focus();
		return;
	}
	
	var q="content="+encodeURIComponent(content);
	var url="<%=cp%>/guest/insert";
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var s=data.state;
			
			if(s=="loginFail") {
				location.href="<%=cp%>/member/login";
				return;
			}
			
			$("#content").val("");
			$("#listGuestBody").empty();
			pageNo=1;
			listPage(1);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

function deleteGuest(num) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		location.href="<%=cp%>/member/login";
		return;
	}
	
	if(! confirm("위 자료를 삭제 하시겠습니까 ?")) {
		return;
	}
	
	var q="num="+num;
	var url="<%=cp%>/guest/delete";
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var s=data.state;
			
			if(s=="loginFail") {
				location.href="<%=cp%>/member/login";
				return;
			} else if(s=="true") {
				$("#listGuestBody").empty();
				/*
				for(var n=1; n<=pageNo; n++)
					listPage(n);
			    */
				pageNo=1;
				listPage(1);
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});	
	
}

</script>


<!--배너-->

<img id="insta" src="<%=cp%>/resource/design/talk.png" style="display:block; margin:80px auto 35px;">


<div class="body-container" style="width: 1000px; margin:80px auto 35px; margin-bottom: 200px;" >

    
     <div class="comments">    
		<div class="comment-wrap">
				<div class="photo">
						<div class="avatar" style="background-image: url('https://st3.depositphotos.com/8440746/13422/v/450/depositphotos_134228816-stock-illustration-user-heart-favorite-love-profile.jpg')"></div>
				</div>
				<div class="comment-block">
						<form action="">
								<textarea name="" id="content" cols="30" rows="3" placeholder="욕설과 선정적인 글은 삭제됩니다. 올바른 소통을 위해 규칙을 지켜주세요!"></textarea>
						</form>
						
						<div style="text-align: right; padding-top: 10px;">
        		<button type="button" onclick="sendGuest()"
        		       class="btn" style="padding: 8px 25px;"> 등록하기 </button>
        	</div>
        	
				</div>
		</div>
        

	   <div id="listGuest">
	     <table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
	      <thead>
		           <tr height='35'>
		                <td width='50%'>
		                    <span style='color: #3EA9CD; font-weight: 700;'>모꼬지 와글와글</span>
		                    <span>[목록]</span>
		                 </td>
		                 <td width='50%'>&nbsp;</td>
		           </tr>
	           </thead>
	     
				<tbody id="listGuestBody" style="background-color: white; border-radius: 0.1875rem;" ></tbody>
	           
			</table>
        </div>
    </div>
    </div>
    
