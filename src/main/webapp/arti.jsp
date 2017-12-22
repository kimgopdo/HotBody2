<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


  <link rel="stylesheet" href="resource/mobung/css/style.css">  

<form>
  <h1>벙개 안내 </h1>
  <p> 즐거운 벙개에 대한 정보를 알려드립니다! </p>
  <div class='formInput'>
    <i class='fa fa-user'></i>
    <input name='moPlace' readonly="readonly"  value=""/>
  </div>
  
   <div class='formInput'>
    <i class='fa fa-globe'></i>
    <input type='text' name='moPlace' placeholder='모임지역' />
  </div>
  
  <div class='formInput'>
    <i class='fa fa-map-marker'></i>
    <input type='text' name='moPlace' placeholder='모임장소' />
  </div>
  
    <div class='formInput'>
    <i class='fa fa-meh-o'></i>
    <input type='text' name='maxPeople' placeholder='최대 참석자 수' />
  </div>  
  
  <div class='formInput dateSelector'>
    <i class='fa fa-calendar-o'></i>
    <input type='text' name=moDate id='hbdsdf' placeholder='모임 일시' />
  </div>
  
    <div class='formInput'>
    <i class='fa fa-play'></i>
	<input type='time' value='now' /> 
	
  </div>
  
  
  <div class='formInput'>
    <i class='fa fa-stop'></i>
	<input type='time' value='now' /> 
	
  </div>
  
   <div class='formInput dateSelector'>
    <i class='fa fa-krw'></i>
    <input type='text' name=moDate id='hbdsdf' placeholder='회비' />
  </div>

  <!-- 버튼 -->
	<button type="submit" class='button12' style="padding-bottom: 30px;" onclick="check();">벙개등록</button>
   
</form>

 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="resource/mobung/js/index.js"></script>
	

</body>
</html>
