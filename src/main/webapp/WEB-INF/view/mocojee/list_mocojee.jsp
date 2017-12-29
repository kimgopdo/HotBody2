<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<head>


<link rel="icon"
	href="<%=cp%>/resource/mocozzy/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link href="<%=cp%>/resource/mocozzy/style.css" rel="stylesheet">

<!-- Responsive CSS -->
<link href="<%=cp%>/resource/mocozzy/css/responsive/responsive.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

		<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script
			src="http://imdak.speedgabia.com/imwell/new/amazonsidebarmenu-master/amazonmenu.js"></script>


<script type="text/javascript">


function sendOk(){
	var uid="${sessionScope.member.userId}";
	if(! uid){
		alert("로그인 후 개설 가능합니다.")
	} else {
		location.href="<%=cp%>/mocojee/c_mocojee";
		}
		return;
	}
	
jQuery(function() {
	amazonmenu.init({
		menuid : 'mysidebarmenu'
	})
})

</script>


<style type="text/css">
.cast_title {
	margin: 80px auto 30px;
	width: 1150px;
	font-size: 25px;
	font-weight: 700;
}

#mysidebarmenu {
	display: none;
	background: #3c3737;
}

#imdakRecipe {
	padding: 50px 0 53px;
	margin: 0 auto;
	width: 1150px;
}

.speConpricen {
	text-decoration: line-through;
}

.menu:nth-child(6) a {
	color: #EE411F;
}

.menu:nth-child(6) a:hover {
	color: #EE411F;
}

.bannerGroup {
	display: none;
}

.slider01 {
	width: 1150px;
	height: 500px;
	margin: 0;
	padding: 0;
	position: relative;
	zoom: 1;
	border: solid 0px red;
}

.slider01 .slides {
	height: 500px;
	zoom: 1;
	margin: 0;
	padding: 0;
}

.slider01 .slides>li {
	
} /* Hide the slides before the JS is loaded. Avoids image jumping */
/* Direction Nav */
.slider01 .flex-direction-nav {
	*height: 0;
	margin: 0;
	padding: 0;
	list-style: none;
}

.slider01 .flex-direction-nav a {
	width: 30px;
	height: 30px;
	display: block;
	background: url(./bg_direction_nav.png) no-repeat 0 0;
	position: absolute;
	top: 42%;
	z-index: 10;
	cursor: pointer;
	text-indent: -9999px;
	opacity: 1;
	-webkit-transition: all .3s ease;
}

.slider01 .flex-direction-nav .flex-next {
	background-position: 100% 0;
	right: -50px;
	background:
		url(http://wiseux.speedgabia.com/imdak/contents/imdak_cast/r_control.png)
		center no-repeat !important;
	width: 35px;
	height: 60px;
}

.slider01 .flex-direction-nav .flex-prev {
	left: -45px;
	background:
		url(http://wiseux.speedgabia.com/imdak/contents/imdak_cast/l_control.png)
		center no-repeat !important;
	width: 30px;
	height: 60px;
}
/* Control Nav */
.slider01 .flex-control-nav {
	width: 100%;
	position: absolute;
	bottom: -15px;
	text-align: center;
	margin: 0;
	padding: 0;
	list-style: none;
}

.slider01 .flex-control-nav li {
	margin: 0 6px;
	display: inline-block;
	zoom: 1;
	*display: inline;
}

.slider01 .flex-control-paging li a {
	width: 11px;
	height: 11px;
	display: block;
	background: #666;
	background: #D0BCBB;
	cursor: pointer;
	text-indent: -9999px;
	-webkit-border-radius: 20px;
	-moz-border-radius: 20px;
	-o-border-radius: 20px;
	border-radius: 20px;
	box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3);
}

.slider01 .flex-control-paging li a:hover {
	background: #333;
	background: rgba(0, 0, 0, 0.7);
}

.slider01 .flex-control-paging li a.flex-active {
	background: #333;
	cursor: default;
}

#backtotop.visible {
    visibility: visible;
    opacity: .5;
}
#backtotop {
    color: #FFFFFF;
    background-color: #D3B48D;
}
#backtotop {
    z-index: 999;
    display: inline-block;
    position: fixed;
    visibility: hidden;
    bottom: 20px;
    right: 20px;
    width: 36px;
    height: 36px;
    line-height: 36px;
    font-size: 16px;
    text-align: center;
    opacity: .2;
}

</style>

</head>
<body>

	<div
		style="overflow: hidden; margin: 0 auto; width: 100%; ">

		<div style="width: 1150px; margin: 0 auto;">
			<div
				style="float: left; width: 170px; height: 415px; z-index: 9; position: absolute;">

				<!--//좌측 카테고리 END-->
			</div>

		</div>

		<!--카테고리인트로-->
		<div style="width: 1150px; margin: 0px auto; margin-top: 50px;">
			<img src="<%=cp%>/resource/design/mocojeelogo.jpg">
		</div>

				</div>
				


	<div id="imdakRecipe">
        <div class="slider01">
          
        <div class="flex-viewport" style="overflow: hidden; position: relative;"><ul class="slides" style="width: 600%; transition-duration: 1s; transform: translate3d(-3450px, 0px, 0px);"><li style="width: 1150px; float: left; display: block;" class="clone">
                        <p style="overflow:hidden; padding-top:15px; width:100%;">
                       
								</p><p style="width:530px; float:left;">
								<a href="//blog.naver.com/PostThumbnailView.nhn?blogId=imdaknew&amp;logNo=221054805983&amp;categoryNo=64&amp;parentCategoryNo=64&amp;from=postList" target="_blank">
									<img src="<%=cp%>/resource/moco_01.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_05_hover_170801.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_05_170801.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=1949935" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_06_170801.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_06_170801.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_06_170801.jpg'">
								</a>
							</p>
						<p style="float:right; width:530px;">
								<a href="//blog.naver.com/PostThumbnailView.nhn?blogId=imdaknew&amp;logNo=220994037714&amp;categoryNo=64&amp;parentCategoryNo=64&amp;from=postList" target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_07_170801.jpg" alt="저칼로리 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_07_hover_170801.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_07_170801.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=1952865" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_08_170801.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_08_170801.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_08_170801.jpg'">
								</a>
							</p>
						 <p></p>
				</li>
			<li style="width: 1150px; float: left; display: block;" class="">
			
                       <p style="overflow:hidden; padding-top:15px; width:100%; float:left;">
                        
							</p><p style="width:530px; float:left;">
								<a href="//youtu.be/U7ipzQES99s" target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_09.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_09_hover.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_09.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=1948462" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_10.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_10.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_10.jpg'">
								</a>
							</p>
						


							<p style="float:right; width:530px;">
								<a href="//youtu.be/cvvdGALrYRA" target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_11.jpg" alt="저칼로리 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_11_hover.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_11.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=359996" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_12.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_12.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_12.jpg'">
								</a>
							</p>
						<p></p>
                        	</li>
                            
                            
                            
                            
                            <li style="width: 1150px; float: left; display: block;" class="">
						
                        <p style="overflow:hidden; padding-top:15px; width:100%;">
                       
								</p><p style="width:530px; float:left;">
								<a href="//blog.naver.com/imdaknew/221033437589 " target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_13.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_13_hover.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_13.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=1947459" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_14.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_14.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_14.jpg'">
								</a>
							</p>
						<p style="float:right; width:530px;">
								<a href="//blog.naver.com/imdaknew/221034070602" target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_15.jpg" alt="저칼로리 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_15_hover.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_15.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=1952867" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_16.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_16.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_16.jpg'">
								</a>
							</p>
						 <p></p>
			</li>
			
			<!-- 여기가 메인 -->
            <li style="width: 1150px; float: left; display: block;" class="flex-active-slide">
                        <p style="overflow:hidden; padding-top:15px; width:100%;">
                        
						</p><p style="width:530px; float:left;">
								<a href="https://www.youtube.com/watch?v=9Oy_8pOJSQc" target="_blank">
									<img src="<%=cp%>/resource/design/moco_02.jpg" alt="피크닉 레시피" onmouseover="<%=cp%>/resource/design/moco_01_hover.jpg" onmouseout="<%=cp%>/resource/design/moco_01_hover.jpg">
								</a>
								<a href="#">
									<img src="<%=cp%>/resource/design/momo1.jpg" alt="피크닉 레시피" onmouseover="<%=cp%>/resource/design/momo1.jpg" onmouseout="<%=cp%>/resource/design/momo1.jpg">
								</a>
							</p>
						

							<p style="float:right; width:530px;">
								<a href="<%=cp%>/guest/guest" target="_blank">
									<img src="<%=cp%>/resource/design/moco_01.jpg" alt="저칼로리 레시피" onmouseover="<%=cp%>/resource/design/moco_02.jpg" onmouseout="<%=cp%>/resource/design/moco_02.jpg">
								</a>
								<a href="<%=cp%>/guest/guest" target="_self">
									<img src="<%=cp%>/resource/design/momo2.jpg" alt="피크닉 레시피" onmouseover="<%=cp%>/resource/design/momo2.jpg" onmouseout="<%=cp%>/resource/design/momo2.jpg">
								</a>
							</p>
						<p></p>
							</li>


          <li style="width: 1150px; float: left; display: block;" class="clone">
			
                       <p style="overflow:hidden; padding-top:15px; width:100%; float:left;"></p>
                       <p style="width:530px; float:left;">
								<a href="//youtu.be/U7ipzQES99s" target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_09.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_09_hover.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_09.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=1948462" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_10.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_10.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_10.jpg'">
								</a>
							</p>
						


							<p style="float:right; width:530px;">
								<a href="//youtu.be/cvvdGALrYRA" target="_blank">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_11.jpg" alt="저칼로리 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_11_hover.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_11.jpg'">
								</a>
								<a href="/shop/shopdetail.html?branduid=359996" target="_self">
									<img src="//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_12.jpg" alt="피크닉 레시피" onmouseover="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_12.jpg'" onmouseout="this.src='//wiseux.speedgabia.com/imdak/contents/imdak_cast/recipe_12.jpg'">
								</a>
							</p>
						<p></p>
                        	</li>
                        </ul>
                      </div>
                        	
                        	<ul class="flex-direction-nav">
                        	<li><a class="flex-prev" href="#">Previous</a></li>
                        	<li><a class="flex-next" href="#">Next</a></li></ul>
                        	
                        	</div>
	
            <!--//아임닭 레시피_170412 END-->

	<a href="<%=cp%>/mocojee/c_mocojee" target="_blank">
	<img src="<%=cp%>/resource/design/mocoba.jpg" alt="모고지 개설하기" style="margin-top:50px;"></a>


    </div>


	<!-- ****** Breadcumb Area End ****** -->

	<!-- ****** Archive Area Start ****** -->

	<div class="btmspace-50 center">
		<h3 class="btmspace-10">MOCOZZY PICK</h3>
		<p class="nospace">원하는 운동모임을 통해 보다 건강하고, 행복한 삶을 만들어 보세요!</p>
		<button type="button" class="btn btn-outline-primary"
			onclick="sendOk();">모꼬지 개설하러 가기</button>
	</div>


	<section class="archive-area section_padding_80"
		style="margin-top: 30px;">
		<div class="container">
			<div class="row">

				<!-- Single Post -->
				<c:forEach var="dto" items="${list}">
					<div class="col-12 col-md-6 col-lg-4">
						<div class="single-post wow fadeInUp" data-wow-delay="0.4s">
							<!-- Post Thumb -->
							<div class="post-thumb">
								<img src="<%=cp%>/uploads/c_mocojee/${dto.moImage}"
									style="width: 350px; height: 230px;">

							</div>
							<!-- Post Content -->
							<div class="post-content">
								<div class="post-meta d-flex">
									<div class="post-author-date-area d-flex">
										<!-- Post Author -->

										<!-- Post Date -->
										<div class="post-date">
											<b style="color: #28a745;">${dto.moIntro}</b>
										</div>
									</div>

								</div>
								<a href="${articleUrl}/${dto.geNum}/main">
									<h4 class="post-headline">${dto.moName}</h4>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>


				<div class="col-12">
					<div class="pagination-area d-sm-flex mt-15">
						<nav aria-label="#"></nav>
						<div class="page-status">
							<p>${dataCount}개(${page}/${total_page}페이지)</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<a id="backtotop" href="#top" class="visible"><i class="fa fa-chevron-up"></i></a>


	</section>



</body>