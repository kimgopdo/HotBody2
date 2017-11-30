<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String cp=request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
</head>
<div class="container">

	<!-- 버튼 -->
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
	  Login
	</button>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header" style="height: 50px;">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">Login</h4>
	      </div>
	      <div class="modal-body" style="height: 130px;">
		<table style="margin-top: 10px;">
			<tr height="30">
				<td style="padding-left: 17px;">아 이 디  &nbsp;<input type="text"></td>
			</tr>
			<tr height="30">
				<td style="padding-left: 15px; padding-top: 20px;">비밀번호 <input type="text"></td>
			</tr>
			<tr height="30">
				<td style="padding-left: 17px; font-size: 11px; padding-bottom: 3px; padding-top: 10px;"><a href="#" style="margin-left: 120px;">아이디 / 비밀번호 찾기</a></td>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

</body>
</html>