
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	$(function() {
		$("#tab-container").tabs();
	});
	
	
	function modalSendLogin() {
		   var f=document.loginForm;
		   
		   if(!f.userId.value) {
		       f.userId.focus();
		       return false;
		    }   

		    if(!f.userPwd.value) {
		       f.userPwd.focus();
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
		         if(state=="true") {
		            location.href="<%=cp%>/";
				} else {
					alert("아이디 또는 비밀번호를 확인해 주세요.");
				}
			},
			error : function(jqXHR) {
				console.log(jqXHR.responseText);
			}
		});

	}
</script>

<!-- 이미지 테두리 없애기 -->
<style type="text/css">
<!--
IMG {border: none;}
-->
</style>
 
<!-- 텍스트 밑줄없애기-->
<style type="text/css">
<!--
A:link { text-decoration:none ; }
A:visited { text-decoration:none ; }
A:active { text-decoration:none ; }
A:hover { text-decoration:none; }
-->
</style>  
<!-- 텍스트 링크속성 변경하기 -->
<style type="text/css">
<!--
A:link { color:#컬러코드 ;text-decoration:none ; }
A:visited { color:#컬러코드 ;text-decoration:none ; }
A:active { color:#컬러코드 ; text-decoration:none ; }
A:hover { color:#컬러코드 ; text-decoration:none; }
-->
</style> 

</head>
<body>

	
	<table style="width: 100%;">
	<tr height="40px;">
	<td >
					<!-- 로그인 / 로그아웃 버튼-->
			<c:if test="${empty sessionScope.member}" >
				<button style="float: right; color:white; background:black; margin-right: 50px" type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myLoginModal">Login</button>
			</c:if>
			<c:if test="${not empty sessionScope.member}">
				<button style="float: right; color:white; background:black; margin-right: 50px" type="button" class="btn btn-primary btn-lg"
					onclick="javascript:location.href='<%=cp%>/member/logout';">
					Logout</button>
			</c:if>
		</td>
	
	</tr>
		<tr height="100px" style="border-bottom: 2px solid ;  ">
		<td align="center" style="padding-bottom: 30px;">
			<img style="max-height: 100px" src="<%=cp%>/resource/images/hotbodylogo.png">
		</td>

		</tr>

	</table>


	<!-- 상위 메뉴 탭기능 구현 -->
	<div id="tab-container" 
		style="height: 300px; background:white; background-image: url('<%=cp%>/resource/images/20160330115141134_0.jpg'); ">
		<ul style="background: no-repeat; border: 0px;">
			<li style="background: no-repeat; border: none;"><a href="#tabs-1"><span style="color: white;">클래스</span></a></li>
			<li style="background: no-repeat; border: none;"><a href="#tabs-2"><span style="color: white;">쇼핑몰</span></a></li>
			<li style="background: no-repeat; border: none;"><a href="#tabs-3"><span style="color: white;">모꼬지</span></a></li>
			<li style="background: no-repeat; border: none;"><a href="#tabs-4"><span style="color: white;">공지사항</span></a></li>
			<li style="background: no-repeat; border: none;"><a href="#tabs-5"><span style="color: white;">Q&A</span></a></li>




		</ul>
		<div id="tabs-1" >
			<ul style="list-style: none; text-decoration: none; ">
				<li><a href="#"><span style="color: white;">온라인 클래스</span></a></li>
				<li><a href="#"><span style="color: white;">오프라인 클래스</span></a></li>

			</ul>

		</div>
		<div id="tabs-2" style="margin-left: 80px; ">
			<ul style="list-style: none;">
			</ul>
		</div>
		<div id="tabs-3" style="margin-left: 160px;">
			<ul style="list-style: none;">
			</ul>
		</div>
		<div id="tabs-4" style="margin-left: 240px;">
			<ul style="list-style: none;">

				<li><a href="#"><span style="color: white;">공지사항</span></a></li>
				<li><a href="#"><span style="color: white;">이벤트</span></a></li>
			</ul>
		</div>
		<div id="tabs-5" style="margin-left: 320px;">
		</div>



		<!-- 로그인 모달-->
		<div class="modal fade" id="myLoginModal" tabindex="-1" role="dialog"
			aria-labelledby="myLoginModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" style="width: 320px;">
				<div class="modal-content">
					<div class="modal-header" style="height: 50px;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myLoginModalLabel">Login</h4>
					</div>
					<form name="loginForm" method="post">
						<div class="modal-body" style="height: 130px;">
							<table style="margin-top: 1px;">
								<tr height="30">
									<td>아 이 디 &nbsp;<input type="text" name="userId"
										style="color: #D5D5D5;" placeholder="Id"></td>
								</tr>
								<tr height="30">
									<td style="padding-top: 20px;">비밀번호 <input type="password"
										name="userPwd"
										style="margin-left: 1px; width: 206px; color: #D5D5D5;"
										placeholder="Password"></td>
								</tr>
								<tr height="30">
									<td
										style="padding-left: 17px; font-size: 11px; padding-bottom: 3px; padding-top: 10px;"><a
										href="#" style="margin-left: 140px; width: 206px;">아이디 /
											비밀번호 찾기</a></td>
								</tr>
							</table>
						</div>
						<div class="modal-footer" style="height: 70px;">
							<a href="#"><button type="button" class="btn btn-default"
									data-dismiss="modal" style="height: 35px; float: left">
									<span style="font-size: 11px;">회원가입</span>
								</button></a> <a href="#"><button type="button" class="btn btn-default"
									style="height: 35px;" onclick="modalSendLogin();">
									<span style="font-size: 11px;">login</span>
								</button></a>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>