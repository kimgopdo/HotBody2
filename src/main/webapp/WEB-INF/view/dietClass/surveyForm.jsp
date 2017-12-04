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
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<style type="text/css">
.surveyLayer{
  position:absolute;
  width:800px;
  height:500px;
  background:#ffffff;
  margin:-50px 0 0 -50px;
  border-spacing: 0;
  border-collapse: collapse;
  box-shadow: 8px 8px 10px silver;
}
.underline{
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom-width: 1;
	width: 200px;
	border-color: #000000;
}

</style>
<script type="text/javascript">
jQuery.fn.center = function() {
	this.css("position","absolute");
	this.css("top",Math.max(0,(($(window).height()- $(this).outerHeight())/2)-$(window).scrollTop())+"px");
	this.css("left",Math.max(0,(($(window).width()- $(this).outerWidth())/2)-$(window).scrollLeft())+"px");
	return this;
}

$(function() {
	$("#surveyForm").center();
});

</script>
</head>
<body>


<div class="surveyLayer" id="surveyForm">
	<div style="float: left; width: 200px; background: #bbddd4; height: 100%;">
	
	</div>
	
	<div style="width: 600px; display: inline-block; float: left; margin-top: 50px;">
		<div align="center" style="width: 500px; height:100px; margin-left: 45px;">
			<hr style="height: 5px; width: 100px; background-color: #bbddd4; border: 0px; float: left;">
			<hr style="height: 5px; width: 400px; background-color: #e6e6e6; border: 0px; float: left;">
		</div>
		<div style="width: 500px; height:240px; margin-left: 45px;">
			<p style="font-weight: bold; font-size: 20px;">Q. 1</p>
			<p>질문내용</p>
			<input class="underline" type="text" style="outline: none; font-size: 20px;">
			
		</div>
		
		<div style="width: 500px; margin-left: 45px;" align="right">
			<button id="paymentBtn" type="button" style="width: 100px; height: 45px; background: #999999; border: 0px; color: #ffffff; border-radius:4px; font-weight: bold;" onclick="">이전</button>
			<button id="paymentBtn" type="button" style="width: 100px; height: 45px; background: #1abc9c; border: 0px; color: #ffffff; border-radius:4px; font-weight: bold;" onclick="">다음</button>
		</div>
	</div>
	
</div>
</body>
</html>
