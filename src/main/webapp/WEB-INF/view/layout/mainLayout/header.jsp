<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function modalFormLogin() {
	   $('#myLoginModal').modal('show');
}
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
				location.reload();
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
	  <div class="modal-dialog modal-sm" style="width: 320px; top: 200px;">
	    <div class="modal-content" style="top: 200px;">
	      <div class="modal-header" style="height: 50px;">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myLoginModalLabel">Login</h4>
	      </div>
	      <form name="loginForm" method="post">
	      <div class="modal-body" style="height: 130px;">
			  <table style="margin-top: 1px;">
				<tr height="30">
					<td>아 이 디&nbsp;&nbsp;&nbsp;<input type="text" name="userId" style="color : black; width: 176px;" placeholder="Id"></td>
				</tr>
				<tr height="30">
					<td style="padding-top: 20px;">비밀번호 <input type="password" name="pwd" style="margin-left:1px; width: 175px; color: black;" placeholder="Password"></td>
				</tr>
				<tr height="30">
					<td style="padding-left: 17px; font-size: 11px; padding-bottom: 3px; padding-top: 10px;"><a href="#" style="margin-left: 120px; width: 206px;">아이디 / 비밀번호 찾기</a></td>
				</tr>
			  </table>
	      </div>
	      <div class="modal-footer" style="height: 70px;" align="center">
	      	<button type="button" class="btn btn-default" data-dismiss="modal" style="height: 35px; width:123px;"><span style="font-size: 11px;">회원가입</span></button>
			<button type="button" class="btn btn-default" style="height: 35px; width: 123px;" onclick="modalSendLogin();"><span style="font-size: 11px;">login</span></button>
	      </div>
	    </form>
	    </div>
	  </div>
	</div>

<!-- HEADER -->
<header>
	<!-- MENU BLOCK -->
	<div class="menu_block">

		<!-- CONTAINER -->
		<div class="container clearfix">

		<!-- LOGO -->
		<div class="logo pull-left">
			<a href="<%=cp%>/index.jsp"> <span class="b1">H</span><span class="b1">O</span><span class="b1">T</span>
				<span class="b1">B</span><span class="b1">O</span><span class="b1">D</span><span class="b1">Y</span>
			</a>
		</div>
		<!-- //LOGO -->

			<!-- MENU -->
			<div class="pull-right">
				<nav class="navmenu center">
					<ul>
						<li class="first active scroll_btn"><a href="#home">Home</a></li>
						<li class="sub-menu"><a href="">클래스</a>
							<ul>
								<li><a href="<%=cp%>/dietClass/list?type=0">온라인</a></li>
								<li><a href="<%=cp%>/dietClass/list?type=1">오프라인</a></li>
							</ul></li>
						<li class="scroll_btn last"><a href="<%=cp%>">쇼핑몰</a></li>
						<li class="sub-menu"><a href="">모꼬지</a>
							<ul>
								<li><a href="<%=cp%>/moco_board/article">1</a></li>
								<li><a href="<%=cp%>">2</a></li>
								<li><a href="<%=cp%>">3</a></li>
							</ul></li>
						<li class="sub-menu"><a href="<%=cp%>">공지사항</a>
							<ul>
								<li><a href="blog.html">공지사항</a></li>
								<li><a href="blog-post.html">이벤트</a></li>
							</ul></li>
						<li class="scroll_btn last"><a href="#contacts">자주묻는질문</a></li>
						
						<c:if test="${empty sessionScope.member}">
						<li class="scroll_btn last">
							<button type="button" name="searchBtn"  data-toggle="modal" data-target="#myLoginModal" style="background: white; border: none; outline: none;" onclick="modalSendLogin();">
							로그인
							</button>
						</li>
						<li class="scroll_btn last"><a href="<%=cp%>">회원가입</a></li>
						</c:if>
						
						<c:if test="${not empty sessionScope.member}">
						<c:if test="${sessionScope.member.userId=='admin'}">
							<li class="scroll_btn last"><a href="<%=cp%>">관리자페이지</a></li>
						</c:if>
						<c:if test="${sessionScope.member.userId!='admin'}">
						<li class="scroll_btn last"><a href="<%=cp%>">마이페이지</a></li>
						</c:if>
						<li class="scroll_btn last">
							<button type="button" name="searchBtn"  data-toggle="modal" data-target="#myLoginModal" style="background: white; border: none; outline: none;" onclick="javascript:location.href='<%=cp%>/member/logout';">
							로그아웃
							</button>
						</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- //MENU -->
		</div>
		<!-- //MENU BLOCK -->
	</div>
	<!-- //CONTAINER -->
</header>
<!-- //HEADER -->
