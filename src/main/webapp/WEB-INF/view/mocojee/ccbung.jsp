<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">  
  <link rel="stylesheet" href="resource/mobung/css/style.css">  


<form action="<%=cp%>/moco_board/ccbung/${mode}" method="post" name="boardForm" enctype="multipart/form-data" onsubmit="return submitContents(this);">
  <h1>벙개 등록하기</h1>
  <p> 즐거운 벙개를 등록합시다! </p>
  <div class='formInput'>
    <i class='fa fa-user'></i>
    <input type='text' name='mosubName' placeholder='벙개명' />
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
	<script type="text/javascript">
	$(function(){  
		  $('input[type="time"][value="now"]').each(function(){    
		    var d = new Date(),        
		        h = d.getHours(),
		        m = d.getMinutes();
		    if(h < 10) h = '0' + h; 
		    if(m < 10) m = '0' + m; 
		    $(this).attr({
		      'value': h + ':' + m
		    });
		  });
		});
	</script>
  </div>
  
  
  <div class='formInput'>
    <i class='fa fa-stop'></i>
	<input type='time' value='now' /> 
	<script type="text/javascript">
	$(function(){  
		  $('input[type="time"][value="now"]').each(function(){    
		    var d = new Date(),        
		        h = d.getHours(),
		        m = d.getMinutes();
		    if(h < 10) h = '0' + h; 
		    if(m < 10) m = '0' + m; 
		    $(this).attr({
		      'value': h + ':' + m
		    });
		  });
		});
	</script>
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
	


