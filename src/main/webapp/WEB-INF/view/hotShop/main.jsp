<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
#slideshow { 
    margin: 150px auto;
    position: relative;
    width: 100%;
    height: 100%;
    padding: 1% 1% 45% 1%; /*56.25 is for 16x9 resolution*/
		/* border-radius:20px; */
		/* background: rgba(0,0,0,0.2); */
   /*  box-shadow: 0 0 20px rgba(0,0,0,0.6);
  box-sizing:border-box; */
  z-index: 88;
}

#slideshow > div { 
    position: absolute; 
    height: 100%;
    top: 10px; 
    left: 10px; 
    right: 10px; 
    bottom: 10px; 
}

#slideshow > div > img {
	width:100%;
	height:100%;
	border-radius:10px;
}

#slideshow:hover i, #slideshow:hover .slider-dots{
	opacity: 1;
	}

.slidebtn {
	z-index:7;
	background:transparent;
	outline:none;
	border:none;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	padding:0 10px 0 10px;
	}

.slidebtn:active,
.slidedtn:focus {
	outline:none;}
	
.slidebtn i {
	color:#FFF;
	font-size:72px;
	opacity: 0.2;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;

	}

.prev {
    position: absolute; 
    top: 10px; 
    left: 10px; 
    bottom: 10px;
}

.next {
    position: absolute; 
    top: 10px; 
    right: 10px; 
    bottom: 10px;
}


.slider-dots {
	opacity: 0.2;
  list-style: none;
  display: inline-block;
  padding-left: 0;
  margin-bottom: 0;
  position:absolute;
  left:50%;
  bottom:3%;
  transform: translate(-50%, 0);
  z-index:7;
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;

}

.slider-dots li {
  color: #000;
  display: inline;
  font-size: 48px;
  margin-right: 5px;
  cursor:pointer;
}

.slider-dots li.active-dot {
  color: #fff;
}

/*
JQUERY SLIDER BY JohnRostislavovich - https://codepen.io/JohnRostislavovich
ALL YOU HAVE TO DO:
-copy the whole code html, css & js
-include jquery lib
-change the images
*/
.img1{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img2{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img3{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img4{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img5{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img6{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img7{
    position: relative;
    background-image: url("<%=cp%>/uploads/shopList/salad-2942257_1920.jpg");                                                               
    height: 100vh;
    background-size: cover;
}
.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     font-size:5rem;
     color: white;
     z-index: 2;
     text-align: center;
}

.aspect { width: 300px; height: 350px; }
</style>
<script>                                  
$(document).ready(function(){

	$("#slideshow > div:gt(0)").hide();

	var buttons = "<button class=\"slidebtn prev\"><i class=\"fa fa-chevron-circle-left\"></i></button><button class=\"slidebtn next\"><i class=\"fa fa-chevron-circle-right\"></i></button\>";

	var slidesl = $('.slideitem').length
	var d = "<li class=\"dot active-dot\">&bull;</li>";
	for (var i = 1; i < slidesl; i++) {
	  d = d+"<li class=\"dot\">&bull;</li>";
	}	
	var dots = "<ul class=\"slider-dots\">" + d + "</ul\>";

	$("#slideshow").append(dots).append(buttons);
	var interval = setInterval(slide, 5000);

	function intslide(func) {
		if (func == 'start') { 
	 	interval = setInterval(slide, 5000);
		} else {
			clearInterval(interval);		
			}
	}

	function slide() {
			sact('next', 0, 1200);
	}
		
	function sact(a, ix, it) {
	        var currentSlide = $('.current');
	        var nextSlide = currentSlide.next('.slideitem');
	        var prevSlide = currentSlide.prev('.slideitem');
			    var reqSlide = $('.slideitem').eq(ix);

			    var currentDot = $('.active-dot');
	    	  var nextDot = currentDot.next();
	    	  var prevDot = currentDot.prev();
			    var reqDot = $('.dot').eq(ix);
			
	        if (nextSlide.length == 0) {
	      		nextDot = $('.dot').first();
	            nextSlide = $('.slideitem').first();
	            }

	        if (prevSlide.length == 0) {
	      		prevDot = $('.dot').last();
	            prevSlide = $('.slideitem').last();
	            }
				
			if (a == 'next') {
				var Slide = nextSlide;
				var Dot = nextDot;
				}
				else if (a == 'prev') {
					var Slide = prevSlide;
					var Dot = prevDot;
					}
					else {
						var Slide = reqSlide;
						var Dot = reqDot;
						}

	        currentSlide.fadeOut(it).removeClass('current');
	        Slide.fadeIn(it).addClass('current');
			
	    	currentDot.removeClass('active-dot');
	    	Dot.addClass('active-dot');
	}	

	$('.next').on('click', function(){
			intslide('stop');						
			sact('next', 0, 400);
			intslide('start');						
		});//next

	$('.prev').on('click', function(){
			intslide('stop');						
			sact('prev', 0, 400);
			intslide('start');						
		});//prev

	$('.dot').on('click', function(){
			intslide('stop');
			var index  = $(this).index();
			sact('dot', index, 400);
			intslide('start');						
		});//prev
	//slideshow
	});

</script>
<div id="slideshow">
   <div class="img1 slideitem current">	
     <%-- <img src="<%=cp%>/uploads/shopList/salad-2942257_1920.jpg"> --%>
   </div>
   <div class="img2 slideitem">
     <%-- <img src="<%=cp%>/uploads/shopList/salad-2942257_1920.jpg"> --%>
   </div>
   <div class="img3 slideitem">                       
     <!-- <img src="http://k37.kn3.net/1B107A604.jpg"> -->
   </div>
   <div class="img4 slideitem">
    <!--  <img src=" http://wallpaperscraft.com/image/87654/1920x1080.jpg"> -->
   </div>
   <div class="img5 slideitem">
     <!-- <img src="http://hdwallpaperbackgrounds.net/wp-content/uploads/2015/09/Skyrim-Full-HD-1920x1080-Wallpapers.jpg"> -->
   </div>
   <div class="img6 slideitem">
     <!-- <img src="http://mirtajn.com/uploads/posts/2013-01/1359577392_high_altitude_eclipse_by_nethskie-d2xq0ww.jpg"> -->
   </div>
   <div class="img7 slideitem">
     <!-- <img src="http://img15.nnm.me/3/4/2/b/2/3f06025f75b6fd3544b947da06f.jpg"> -->
   </div>
</div>