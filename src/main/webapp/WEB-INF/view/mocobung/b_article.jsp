<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<head>
    <!-- Core Stylesheet -->
    <link href="<%=cp%>/resource/mocozzy/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="<%=cp%>/resource/mocozzy/css/responsive/responsive.css" rel="stylesheet">
    

 
 </head>  
 		
    <!-- ****** Contatc Area Start ****** -->
    <div class="contact-area section_padding_80">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="google-map-area">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>


            <!-- Contact Info Area Start -->
            <div class="contact-info-area section_padding_80_50">
                <div class="row">
                    <!-- Single Contact Info -->
                    <div class="col-12 col-md-4">
                        <div class="single-contact-info mb-30 text-center wow fadeInUp" data-wow-delay="0.3s">
                            <h4>${dto.mosubName}</h4>
                            <p>${dto.moPlace1}<br> ${dto.moPlace2}<br> Phone: 123-456-7890</p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-12 col-md-4">
                        <div class="single-contact-info mb-30 text-center wow fadeInUp" data-wow-delay="0.6s">
                            <h4>United States</h4>
                            <p>40 Baria Sreet 133/2 NewYork City, US <br> Email: info.contact@gmail.com <br> Phone: 123-456-7890</p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-12 col-md-4">
                        <div class="single-contact-info mb-30 text-center wow fadeInUp" data-wow-delay="0.9s">
                            <h4>Viet Nam</h4>
                            <p>40 Baria Sreet 133/2 NewYork City, US <br> Email: info.contact@gmail.com <br> Phone: 123-456-7890</p>
                        </div>
                    </div>
                </div>
            </div>
	
	</div>
</div>

    <!-- ****** Contact Area End ****** -->

    <!-- Jquery-2.2.4 js -->
    <script src="<%=cp%>/resource/mocozzy/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<%=cp%>/resource/mocozzy/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="<%=cp%>/resource/mocozzy/js/bootstrap/bootstrap.min.js"></script>
    
	<!-- Google Maps -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwuyLRa1uKNtbgx6xAJVmWy-zADgegA2s"></script>
    <script src="<%=cp%>/resource/mocozzy/js/google-map/map-active.js"></script>
	



