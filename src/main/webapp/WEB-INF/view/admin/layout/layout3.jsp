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
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<link href="<%=cp%>/resource/mainboot/css/flexslider.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/resource/mainboot/css/animate.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=cp%>/resource/mainboot/css/owl.carousel.css" rel="stylesheet">
<link href="<%=cp%>/resource/mainboot/css/fileuploader.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- FONTS -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	

<!-- Bootstrap core JavaScript-->
<script src="<%=cp%>/resource/mainboot/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/jquery/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<!-- Core plugin JavaScript-->
<script src="<%=cp%>/resource/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
<!-- Custom scripts for all pages-->
<script src="<%=cp%>/resource/js/sb-admin.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/jquery.nicescroll.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/superfish.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/jquery.flexslider-min.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/owl.carousel.js"></script>
<script src="<%=cp%>/resource/mainboot/js/animate.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/mainboot/js/myscript.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
	
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="body" style="margin-left: 250px; background: #ffffff;">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

</body>
</html>