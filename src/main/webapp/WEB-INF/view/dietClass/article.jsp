<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
jQuery.fn.center = function() {
	this.css("position","absolute");
	this.css("top",Math.max(0,(($(window).height()- $(this).outerHeight())/2)-$(window).scrollTop())+"px");
	this.css("left",Math.max(0,(($(window).width()- $(this).outerWidth())/2)-$(window).scrollLeft())+"px");
	
	return this;
}

/////////////////////////////////미완성
$(function() {
	$("#paymentBtn").click(function() {
		$("#loading").center();
		$("#loadingLayout").fadeTo("slow",1);	//배경화면이 보이게끔 불투명으로 천천히 처리
		$("#loadingLayout").hide();	//숨김
		location.href='<%=cp%>/dietClass/payment';
	});
});
</script>

<div class="body-container" style="width: 1000px;">

<div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 제목 </h3>
</div>

	<a href="<%=cp%>/dietClass/list" style="color: #333333;"><img style="width: 30px;" src="<%=cp%>/resource/images/dano_arrow.png"></a>
    <p style="font-size: 35px; font-weight: bold; margin-top: 20px;">클래스 이름</p>
	<div style="width: 650px; height: 370px; float: left;">
		<img style="vertical-align: middle;" src="https://dietnote.net/static/mydano/class/detail/new/program_leg.jpg">
	</div>
	<div id="classinfo" style="float: left; font-size: 16px; width: 350px; height: 320px;">
		<p style="font-weight: bold;">클래스날짜</p>
		<p style="color: #666666;">2017년 12월 4일~31일</p>
		
		<p style="font-weight: bold;">클래스시간</p>
		<p style="color: #666666;">오후 6시~8시</p>
		
		<p style="font-weight: bold;">클래스장소</p>
		<p style="color: #666666;">서울특별시 마포구 숭문4길 15 5층 (주)HOTBODY</p>
		
		<span style="font-weight: bold; font-size: 30px; vertical-align: bottom;"><br>￦99,000원</span>
   	</div>
	<div style="vertical-align: bottom; float: left; width: 350px;">
    	<button id="paymentBtn" type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="#">수강 신청하기</button>
	</div>
	
	<div style="font-size: 17px; font-weight: bold;">
		<div style="float:left;">
			<p style="padding-top: 20px;">코치</p>
			<p>김김김 코치님</p>
		</div>
		<div style="float:left; margin-left: 165px;">
			<p style="font-weight: bold; padding-top: 20px;">클래스정원</p>
			<p>60명</p>
		</div>
		<div style="float:left; margin-left: 165px;">
			<p style="padding-top: 20px;">운동강도</p>
			<img style="width: 100px; height: auto;" src="<%=cp%>/resource/images/level1.PNG">
		</div>
	</div>


	<div style="width: 1000px; float: left;">
		<hr>
	</div>

</div>

	<div id="loadingLayout" style="display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index: 90000; background: #eeeeee;"> 
	<!-- style="display: none;" : 초기상태는 눈에보이지 않도록해놓는다. -->
	<!-- 화면전체를 덮을 꺼다. -->
		<img id="loading" src="<%=cp%>/resource/images/loading.gif" border="0">
	</div>