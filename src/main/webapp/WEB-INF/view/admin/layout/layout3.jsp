<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

<!-- CSS -->
<!-- Bootstrap core CSS-->
<link href="<%=cp%>/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="<%=cp%>/resource/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="<%=cp%>/resource/css/sb-admin.css" rel="stylesheet">
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="body">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<%=cp%>/resource/mainboot/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<!-- Core plugin JavaScript-->
<script src="<%=cp%>/resource/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
<!-- Custom scripts for all pages-->
<script src="<%=cp%>/resource/js/sb-admin.min.js" type="text/javascript"></script>

</body>
</html>