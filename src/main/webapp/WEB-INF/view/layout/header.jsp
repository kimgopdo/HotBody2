
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
$(function(){
	$("#tab-container").tabs();
});
</script>

</head>
<body>

<div id="tab-container">
	<ul>
		<li><a href="#tabs-1"><span>첫번째</span></a></li>
		<li><a href="#tabs-2"><span>두번째</span></a></li>
		<li><a href="#tabs-3"><span>세번째</span></a></li>
	</ul>
	<div id="tabs-1">테스트 1</div>
	<div id="tabs-2">테스트 2</div>
	<div id="tabs-3">테스트 3</div>
	
	<!-- 로그인 / 로그아웃 버튼-->
	<c:if test="${empty sessionScope.member}">
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
	  Login
	</button>
	</c:if>
	<c:if test="${not empty sessionScope.member}">
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
	  Logout
	</button>
	</c:if>
	
	<!-- 로그인 모달-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" style="width: 320px;">
	    <div class="modal-content">
	      <div class="modal-header" style="height: 50px;">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">Login</h4>
	      </div>
	      <div class="modal-body" style="height: 130px;">
		<table style="margin-top: 1px;">
			<tr height="30">
				<td>아 이 디  &nbsp;<input type="text"></td>
			</tr>
			<tr height="30">
				<td style="padding-top: 20px;">비밀번호 <input type="text" style="margin-left:1px; width: 206px;"></td>
			</tr>
			<tr height="30">
				<td style="padding-left: 17px; font-size: 11px; padding-bottom: 3px; padding-top: 10px;"><a href="#" style="margin-left: 140px; width: 206px;">아이디 / 비밀번호 찾기</a></td>
			</tr>
		</table>
	      </div>
	      <div class="modal-footer" style="height: 70px;">
	      	<a href="#"><button type="button" class="btn btn-default" data-dismiss="modal" style="height: 35px; float: left"><span style="font-size: 11px;">회원가입</span></button></a>
			<a href="#"><button type="button" class="btn btn-default" data-dismiss="modal" style="height: 35px;"><span style="font-size: 11px;">login</span></button></a>
	      </div>
	    </div>
	  </div>
	</div>

</div>

</body>
</html>