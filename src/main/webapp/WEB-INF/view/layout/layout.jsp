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

<link rel="stylesheet" href="<%=cp%>/resource/css/demo.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/Footer-white.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/Footer-with-social-icons.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/Footer-with-map.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/Footer-with-logo.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/Footer-with-button-logo.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap-theme.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="container">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>