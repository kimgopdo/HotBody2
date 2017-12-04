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
</head>
<body>
      <!-- 왼쪽 사이드 바 -->
   <div id="leftSide" class="vertical-align" style="width: 10%; height: 100%; top:0px; left: 0px; position: fixed;z-index: 10;">
      <div style="margin-left: 28%; margin-top: 460px;">
         <button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            <span class="glyphicon glyphicon-shopping-cart"></span>
         </button>
      </div>
	</div>
</body>
</html>