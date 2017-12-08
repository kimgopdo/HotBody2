<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function modalSendLogin() {
	var f=document.loginForm;
	if(!f.userId.value) {
    	f.userId.focus();
    	return false;
    }	

    if(!f.pwd.value) {
    	f.pwd.focus();
    	return false;
    }
    
    var query=$('form[name=loginForm]').serialize();
    var url="<%=cp%>/member/login";
    $.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			var msg=data.message;
			if(state=="true") {
				location.href="<%=cp%>/hotShop";
			} else {
				alert(msg);
			}
		}
	  	,error:function(e) {
	    	console.log(e.responseText);
	    } 
	});
}
</script>

	<!-- 로그인 모달-->
	<div class="modal fade" id="myLoginModal" tabindex="-1" role="dialog" aria-labelledby="myLoginModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" style="width: 320px;">
	    <div class="modal-content">
	      <div class="modal-header" style="height: 50px;">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myLoginModalLabel">Login</h4>
	      </div>
	      <form name="loginForm" method="post">
	      <div class="modal-body" style="height: 130px;">
			  <table style="margin-top: 1px;">
				<tr height="30">
					<td>아 이 디&nbsp;&nbsp;&nbsp;<input type="text" name="userId" style="color : black;" placeholder="Id"></td>
				</tr>
				<tr height="30">
					<td style="padding-top: 20px;">비밀번호 <input type="password" name="pwd" style="margin-left:1px; width: 175px; color: black;" placeholder="Password"></td>
				</tr>
				<tr height="30">
					<td style="padding-left: 17px; font-size: 11px; padding-bottom: 3px; padding-top: 10px;"><a href="#" style="margin-left: 140px; width: 206px;">아이디 / 비밀번호 찾기</a></td>
				</tr>
			  </table>
	      </div>
	      <div class="modal-footer" style="height: 70px;">
	      	<a href="#"><button type="button" class="btn btn-default" data-dismiss="modal" style="height: 35px; float: left"><span style="font-size: 11px;">회원가입</span></button></a>
			<button type="button" class="btn btn-default" style="height: 35px;" onclick="modalSendLogin();"><span style="font-size: 11px;">login</span></button>
	      </div>
	    </form>
	    </div>
	  </div>
	</div>


	
<!-- 오른쪽 사이드 바 -->
   <div id="rightSide" style="width: 10%; height: 100%; float:right; top:0px; right:0; position: fixed; z-index: 10;">
      <div id="mainImge" style="width: 160px; height: 130px; margin-top: 100px; position: absolute;">
         <a href="#" style="color: black;height: 60px; padding: 1px;">
            <img src="<%=cp%>/resource/shop_images/HOTBODY_Logo.png"/>
         </a>
        </div>
        <ul class="btn_Side">
        	<li>
        		<button type="button" class="btn btn-default btn-lg quickMenuBtn" style="background: white; border: none; outline: none;" onclick="quickMenu();">
               		<span class="glyphicon glyphicon-align-justify"></span>
            	</button>
        	</li>
        	<li>
	        	<button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
	               <span class="glyphicon glyphicon-search"></span>
	            </button>
        	</li>
			<c:if test="${empty sessionScope.member}">
			<li>
			     <button type="button" name="searchBtn"  data-toggle="modal" data-target="#myLoginModal" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;" onclick="modalSendLogin();">
			        <span class="glyphicon glyphicon-log-in"></span>
			     </button>
			</li>
			</c:if>
			<c:if test="${not empty sessionScope.member}">
			<li>
			     <button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;"onclick="javascript:location.href='<%=cp%>/member/logout';">
			         <span class="glyphicon glyphicon-log-out"></span>
			     </button>
			</li>
			</c:if>
        	<li>
        		<button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            		<span class="glyphicon glyphicon-user"></span>
         		</button>
        	</li>
        	<li>
        		<button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;" onclick="fnMove('4')">
            	<span class="glyphicon glyphicon-circle-arrow-up"></span>
         	</button>
        	</li>
        </ul>
   </div>