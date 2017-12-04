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
<div id="scroll">
      	<!-- 9 까지만 보임!!!!!! -->
		    <div id="scrollContainer">
			    <ul>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>1</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>2</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>3</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>4</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>5</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>6</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>7</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>8</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>9</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>8</li>
			        <li class="aspect"><img src="<%=cp%>/resource/road.jpg" alt=""/>9</li>
			    </ul>
		    </div>
		</div>
      
         <ul id="#" class="list" >
         <c:forEach begin="0" end="10">
               <li class="list">
                  <div class="aspect">
                     <img src="<%=cp%>/resource/road.jpg">
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