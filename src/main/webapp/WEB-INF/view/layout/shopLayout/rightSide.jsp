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
<!-- 오른쪽 사이드 바 -->
   <div id="rightSide" style="width: 10%; height: 100%; float:right; top:0px; right:0; position: fixed; z-index: 10;">
      <div style="width: 160px; height: 130px; margin-top: 100px;">
         <a href="#" style="color: black;height: 60px; padding: 1px;">
            <img src="<%=cp%>/resource/shop_images/HOTBODY_Logo.png"/>
         </a>
        </div>
        <div style="margin-top: 230px; margin-right: 30px;">
            <button id="sideMenu" type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;" onclick="quickMenu();">
               <span class="glyphicon glyphicon-align-justify"></span>
            </button>
      </div>
      <div style="margin-top: 10px; margin-right: 30px;">
            <button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
               <span class="glyphicon glyphicon-search"></span>
            </button>
      </div>
      <div style="margin-top: 10px; margin-right: 32px;">
            <button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            <span class="glyphicon glyphicon-log-in"></span>
         </button>
      </div>
      <div style="margin-top: 10px; margin-right: 32px;">
            <button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            <span class="glyphicon glyphicon-user"></span>
         </button>
      </div>
      <div style="margin-top: 10px; margin-right: 32px;">
            <button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            <span class="glyphicon glyphicon-circle-arrow-up"></span>
         </button>
      </div>
   </div>
</body>
</html>