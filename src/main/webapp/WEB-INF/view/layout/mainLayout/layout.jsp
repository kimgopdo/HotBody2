<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
</head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
<!-- CSS -->
	<link href="<%=cp%>/resource/mainboot/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=cp%>/resource/mainboot/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="<%=cp%>/resource/mainboot/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="<%=cp%>/resource/mainboot/css/owl.carousel.css" rel="stylesheet">
	<link href="<%=cp%>/resource/mainboot/css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	

	<script src="<%=cp%>/resource/mainboot/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/mainboot/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/mainboot/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/mainboot/js/superfish.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/mainboot/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/mainboot/js/owl.carousel.js"></script>
	<script src="<%=cp%>/resource/mainboot/js/animate.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/mainboot/js/myscript.js" type="text/javascript"></script>
	<script src="<%=cp%>/resource/jquery/js/jquery-ui.min.js" type="text/javascript"></script>

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
</body>
</html>