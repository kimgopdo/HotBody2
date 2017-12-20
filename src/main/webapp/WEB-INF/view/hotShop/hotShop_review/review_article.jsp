<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteReview() {
	<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	  var reviewCode = "${dto.reviewCode}";
	  var page = "${page}";
	  var query = "reviewCode="+reviewCode+"&page="+page;
	  var url = "<%=cp%>/hotShop/review_delete?" + query;

	  if(confirm("게시물을 삭제 하시겠습니까?"))
	  	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	  alert("게시물을 삭제할 수 없습니다.");
	</c:if>
	}

$(function(){
	listPage(1);
});

function listPage(page){
	var url = "<%=cp%>/hotShop/review_list";
	var num = "${dto.reviewCode}";
	var q = "reviewCode=" + num + "&page=" + page;
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listReply").html(a);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText);
		}
	});
}

function sendReply(){
	var uid="${sessionScope.member.userId}";
	if(! uid){
		location.href='<%=cp%>/member/login';
		return;
	}
	
	var content=$.trim($("#content").val());
	if(! content){
		$("#content").focus();
		return;
	}
	
	var q="content="+encodeURIComponent(content);
	q+="&reviewCode=${dto.reviewCode}";
	
	var url="<%=cp%>/hotShop/insertReply";
	
	$.ajax({
		 type:"post"
         ,url:url
         ,data:q
         ,dataType:"json"
         ,success:function(data){
        	 
            var s=data.state;
            if(s=="loginFail"){
               location.href="<%=cp%>/member/login";
               return;
            }
            $("#content").val("");
            listPage(1);
	        }
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText);
		}
	});
}

function deleteReply(cNum, page){
	if(! confirm("삭제하시겠습니까?"))
		return;
	var url="<%=cp%>/hotShop/deleteReply";
	
	$.ajax({
		 type:"post"
         ,url:url
         ,data:{cNum:cNum}
         ,dataType:"json"
         ,success:function(data){
        	 
            var s=data.state;
            if(s=="loginFail"){
               location.href="<%=cp%>/member/login";
               return;
            }
            listPage(page);
	        }
        	 ,beforeSend : function(e){
				e.setRequestHeader("AJAX", true);
			}
			,error:function(e){
				if(e.status == 403) {
					location.href='<%=cp%>/member/login';
					return;
				}
			console.log(e.responseText);
	      }
	});
}

	
</script>

<div class="body-container" style="width: 100%; min-height: 950px;">
    <div class="body-title" align="left">
        <h3><span style="font-family: Webdings">2</span> 상품 후기 </h3>
    </div>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="3" align="center">
				   <span style="font-weight: bold;">[${dto.pdName}]</span> ${dto.reviewSubject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="35%" align="left" style="padding-left: 5px;">
			      	작성자 : ${dto.userName}(${dto.userId})
			    </td>
			    <td width="30%" align="left" style="padding-left: 5px;">
			      	평점 : ${dto.starScore}
			    </td>
  			    <td width="35%" align="right" style="padding-right: 5px;">
			      	작성일 : ${dto.reviewCreated}
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			    <td colspan="3" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.reviewContent}
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" style="background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px; color: black; cursor: point;" onclick="deleteReview();">삭제</button>
			       </c:if>
			    </td>
			
			 	<td align="right">
			        <button type="button" class="btn" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 30px; color: black;" onclick="javascript:location.href='<%=cp%>/hotShop/review_list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
			
   <div>
      <table style="width:100%;  margin: 15px auto 0px; border-spacing: 0;">
         <tr height="30">
            <td align="left" style="padding-left: 5px;"><span style="font-weight: bold;">댓글쓰기</span>
         </tr>

         <tr style="width: 100%">
            <td style="padding: 5px 5px 0; width: 85%">
            <input type="text" id="content" style="width: 100%; height: 23px;"></input>
            </td>
            <td align="right" style="padding-top: 5px; padding-right: 10px; width: 5%">
               <button type="button" style="width: 80px; border: 1px solid #999999; background: white; height: 25px; color: black; border-radius: 3px;" onclick="sendReply();">댓글등록</button>
            </td>
         </tr>
      </table>
    </div>
		<div>
			<c:if test="${cNum != 0}">
			<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0;" id="listReply"></table>
			</c:if>
		</div>
    </div>
    
</div>