
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
$(function(){
	$("#tab-container").tabs();
});
</script>

</head>
<body>

<div id="tab-container">
	<ul>
		<li><a href="#tabs-1"><span>첫번째</span></a></li>
		<li><a href="#tabs-2"><span>두번째</span></a></li>
		<li><a href="#tabs-3"><span>세번째</span></a></li>
	</ul>
	<div id="tabs-1">테스트 1</div>
	<div id="tabs-2">테스트 2</div>
	<div id="tabs-3">테스트 3</div>
</div>

</body>
</html>