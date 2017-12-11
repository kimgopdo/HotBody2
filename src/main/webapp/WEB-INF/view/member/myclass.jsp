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


<div style="height: 100px">
</div>

<div align="center">
	<h3>임지훈님 MY CLASS</h3>
</div>



<table  style="margin: 80px auto; width: 900px;">
	<tr align="center">
		<td><a href="<%=cp%>/myclass/diary/mydiary"><img src="<%=cp%>/resource/images/diary.png"></a><br><b>다이어트 일기</b></td>
		<td><a href="<%=cp%>/myclass/exercise/myexercise"><img src="<%=cp%>/resource/images/exercise.png"></a><br><b>오늘의 운동</b></td>
		<td><a href="<%=cp%>/myclass/message/main"><img src="<%=cp%>/resource/images/message.png"></a><br><b>쪽지</b></td>
	</tr>
	
	<tr height="200" align="center" style="margin-top: 80px;">
		<td><a href="<%=cp%>/myclass/addingrerdients/list"><img src="<%=cp%>/resource/images/diary.png"></a><br><b>재료등록및보기</b></td>
		<td><a href="<%=cp%>/myclass/addexercise/list"><img src="<%=cp%>/resource/images/diary.png"></a><br><b>운동등록및보기</b></td>	
	</tr>
</table>

<div style="height: 100px">
</div>

	
</body>
</html>