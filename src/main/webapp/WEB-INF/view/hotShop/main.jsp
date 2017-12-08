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
<style type="text/css">
.aspect { width: 300px; height: 400px; }
</style>
</head>
<body>
      
         <ul id="#" class="list" >
         <c:forEach begin="0" end="10">
               <li class="list">
                  <div class="aspect">
                     <img src="<%=cp%>/resource/images/road.jpg">
                  </div>
                  <div align="left">
                  <span style=" text-align: left;">상품명</span> <img src=""><br>
                  <span style=" text-align: left;">상품명</span>
                  </div>
               </li>
         </c:forEach>
         </ul>
</body>
</html>