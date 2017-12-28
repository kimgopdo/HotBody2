<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#accordion1").accordion({
		  activate: function(event, ui) {
			  var h=ui.newHeader;
			  var text=h.text();
			  var num=h.attr("data-num");
		  }
	});

});
</script>

</head>
<body>
<div align="center" style="margin-top: 200px;">
	<div id="accordion1" style="width: 60%; text-align: left;">
	
	  <h3 data-num="1" style="background: #BDBDBD;">제목부분 1</h3>
	  <div style="background: #EAEAEA;">
	    <p>
	      내용부분 1
	    </p>
	  </div>
	  
  	  <h3 data-num="1" style="background: #BDBDBD;">제목부분 2</h3>
	  <div style="background: #EAEAEA;">
	    <p>
	      내용부분 2
	    </p>
	  </div>
	  
   	  <h3 data-num="1" style="background: #BDBDBD;">제목부분 3</h3>
	  <div style="background: #EAEAEA;">
	    <p>
	      내용부분 3
	    </p>
	  </div>
	  
	</div>
</div>
</body>
</html>