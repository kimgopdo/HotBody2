<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
#map {
  height: 400px;
  width: 500px;
}
</style>


<script>
      function initMap() {
        var uluru = {lat: 37.548255,  lng: 126.94594};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9P3TaLYvX65owbUopBkE0LN4ntFOwiRs&callback=initMap">
</script>
<div class="body-container" style="width: 1000px; margin: 100px auto;">

	<div style="margin: 50px 0px;">
	<a href="<%=cp%>/dietClass/list" style="color: #333333; padding: 20px 20px;"><img style="width: 30px;" src="<%=cp%>/resource/images/dano_arrow.png"></a>
	</div>
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
    	<button id="paymentBtn" type="button" style="width: 100%; height: 50px; background: #1abc9c; border: 0px; color: #ffffff; font-weight: bold;" onclick="javascript:location.href='<%=cp%>/dietClass/payment';">수강 신청하기</button>
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
	
	<div id="map"></div>
	
</div>
