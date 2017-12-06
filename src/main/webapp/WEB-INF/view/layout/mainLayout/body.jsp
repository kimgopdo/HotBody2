<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

		<!-- HOME -->
		<section id="home" class="padbot0">
				
			<!-- TOP SLIDER -->
			<div class="flexslider top_slider">
				<ul class="slides">
					<li class="slide1">
						<div class="flex_caption1">
							<p class="title1 captionDelay2 FromTop">HOTBODY</p>
							<p class="title2 captionDelay4 FromLeft">FIND YOUR FIT</p>
							<p class="title4 captionDelay7 FromBottom">내 안의 최고의 모습을 찾아주는 다이어트 코칭</p>
						</div>
						
					<li class="slide2">
						<div class="flex_caption1">
							<p class="title1 captionDelay6 FromLeft">함께 운동하는 재미!</p>
							<p class="title2 captionDelay4 FromLeft"></p>
							<p class="title4 captionDelay7 FromLeft">다양한 모임을 통해 보다 건강하고,<br>행복한 삶을 만들어 보세요!</p>
						</div>
						
					</li>
					<li class="slide3">
						<div class="flex_caption1">
							<p class="title1 captionDelay1 FromBottom">미션으로 만드는</p>
							<p class="title2 captionDelay2 FromBottom">생활습관의 변화</p>
							<p class="title4 captionDelay5 FromBottom">내게 맞는 알찬 미션들만 엄선해 추천해드리니 어떤 습관을 만들지 선택하고 꼭 지켜보세요. <br>작은 습관 하나도 놓치지 말고 꾸준히!</p>
						</div>
						
						<!-- VIDEO BACKGROUND -->
						<a id="P2" class="player" data-property="{videoURL:'tDvBwPzJ7dY',containment:'.top_slider .slide3',autoPlay:true, mute:true, startAt:0, opacity:1}" ></a>
						<!-- //VIDEO BACKGROUND -->
					</li>
				</ul>
			</div>
			<div id="carousel">
				<ul class="slides">
					<li><img src="<%=cp%>/resource/mainboot/images/slider/slide1_bg.jpg" alt="" /></li>
					<li><img src="<%=cp%>/resource/mainboot/images/slider/slide2_bg.jpg" alt="" /></li>
					<li><img src="<%=cp%>/resource/mainboot/images/slider/slide3_bg.jpg" alt="" /></li>
				</ul>
			</div><!-- //TOP SLIDER -->
		</section><!-- //HOME -->
		
		
		<!-- ABOUT -->
		<section id="about">
			
			<!-- SERVICES -->
			<div class="services_block padbot40" data-appear-top-offset="-200" data-animated="fadeInUp">
			</div><!-- //SERVICES -->
			
			
			<!-- MULTI PURPOSE -->
			<div class="purpose_block">
				
				<!-- CONTAINER -->
				<div class="container">
					
					<!-- ROW -->
					<div class="row">
					
						<div class="col-lg-7 col-md-7 col-sm-7" data-appear-top-offset="-200" data-animated="fadeInLeft">
							<h3 style="color: #fe4e6c;"><b>HOTBODY</b>&nbsp;습관개선 프로그램</h3>
							<p>매일 주어지는 미션을 수행하고 전문 코치님의 꼼꼼한 다이어트 코칭을 받다보면 어느새 다이어트는 습관이 되어 내 삶을 바꾸어줘요.</p>
							<p>다이어트의 성공의 80%는 <span style="color: #fe4e6c; font-weight: 600;">식단조절!</span>&nbsp; 매끼 나의 식단을 지켜보는 코치언니의 존재는<br> 내 손의 수저를 내려놓게 만들어요.</p>
							<a class="btn btn-active" href="" ><span data-hover="Yes I CAN">자세히 알아보기</span></a>
							
						</div>
						
						<div class="col-lg-5 col-md-5 col-sm-5 ipad_img_in" data-appear-top-offset="-200" data-animated="fadeInRight">
							<img class="ipad_img1" src="<%=cp%>/resource/mainboot/images/img1.png" alt="" />
						</div>
					</div><!-- //ROW -->
				</div><!-- //CONTAINER -->
			</div><!-- //MULTI PURPOSE -->
		</section><!-- //ABOUT -->
		
		
		<!-- PROJECTS -->
		<section id="projects" class="padbot20">
		
			<!-- CONTAINER -->
			<div class="container">
				<h2><b>PROGRAM</b> LIST</h2>
			</div><!-- //CONTAINER -->
			
				
			<div class="projects-wrapper" data-appear-top-offset="-200" data-animated="fadeInUp">
				<!-- PROJECTS SLIDER -->
				<div class="owl-demo owl-carousel projects_slider">
					
					<!-- work1 -->
					<div class="item">
						<div class="work_item">
							<div class="work_img">
								<img src="<%=cp%>/resource/mainboot/images/works/1.jpg" alt="" />
								<a class="zoom" href="portfolio-post.html"></a>
							</div>
							<div class="work_description">
								<div class="work_descr_cont">
									<a href="portfolio-post.html" >핫팬츠 챌린지</a>
									<span>허벅지,종아리 집중 공략!</span>
								</div>
							</div>
						</div>
					</div><!-- //work1 -->
					
					<!-- work2 -->
					<div class="item">
						<div class="work_item">
							<div class="work_img">
								<img src="<%=cp%>/resource/mainboot/images/works/2.jpg" alt="" />
								<a class="zoom" href="portfolio-post.html"></a>
							</div>
							<div class="work_description">
								<div class="work_descr_cont">
									<a href="portfolio-post.html" >기초체력 다지기</a>
									<span>기초체력이 부족한 사람 들어와~</span>
								</div>
							</div>
						</div>
					</div><!-- //work2 -->
					
					<!-- work3 -->
					<div class="item">
						<div class="work_item">
							<div class="work_img">
								<img src="<%=cp%>/resource/mainboot/images/works/4.jpg" alt="" />
								<a class="zoom" href="portfolio-post.html"></a>
							</div>
							<div class="work_description">
								<div class="work_descr_cont">
									<a href="portfolio-post.html" >요가 챌린지</a>
									<span>유연한 몸매 만들기</span>
								</div>
							</div>
						</div>
					</div><!-- //work3 -->
					
					<!-- work4 -->
					<div class="item">
						<div class="work_item">
							<div class="work_img">
								<img src="<%=cp%>/resource/mainboot/images/works/3.jpg" alt="" />
								<a class="zoom" href="portfolio-post.html"></a>
							</div>
							<div class="work_description">
								<div class="work_descr_cont">
									<a href="portfolio-post.html" >핫바디 챌린지</a>
									<span>집중 고강도 트레이닝으로 건강한 바디 만들기!</span>
								</div>
							</div>
						</div>
					</div><!-- //work4 -->
					
					<!-- work5 -->
					<div class="item">
						<div class="work_item">
							<div class="work_img">
								<img src="<%=cp%>/resource/mainboot/images/works/5.jpg" alt="" />
								<a class="zoom" href="portfolio-post.html"></a>
							</div>
							<div class="work_description">
								<div class="work_descr_cont">
									<a href="portfolio-post.html" >비키니 부트 캠프</a>
									<span>내년 여름을 위해 섹시한 몸매 만들기</span>
								</div>
							</div>
						</div>
					</div><!-- //work5 -->
				</div><!-- //PROJECTS SLIDER -->
			</div>
			

		<!-- TEAM -->
		<section id="team">
		
			<!-- CONTAINER -->
			<div class="container">
				<h2><b>Coaching</b>&nbsp;staff</h2>
				
				<!-- ROW -->
				<div class="row" data-appear-top-offset="-200" data-animated="fadeInUp">
						
					<!-- TEAM SLIDER -->
					<div class="owl-demo owl-carousel team_slider">
				
						<!-- crewman1 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/1.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>권예리</p>
										<span>Director</span>
									</div>
								</div>
								
							</div>
						</div><!-- crewman1 -->
						
						<!-- crewman2 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/2.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>임지훈</p>
										<span>Creative Director</span>
									</div>
								</div>
							</div>
						</div><!-- crewman1 -->
						
						<!-- crewman3 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/3.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>유승국</p>
										<span>Manager</span>
									</div>
								</div>
							</div>
						</div><!-- crewman3 -->
						
						<!-- crewman4 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/4.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>이봉용</p>
										<span>Manager</span>
									</div>
								</div>
							</div>
						</div><!-- crewman4 -->
						
						<!-- crewman5 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/5.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>권중혁</p>
										<span>Designer</span>
									</div>
								</div>
							</div>
						</div><!-- crewman5 -->
						
						<!-- crewman6 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/6.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>김갑도</p>
										<span>Designer</span>
									</div>
								</div>
							</div>
						</div><!-- crewman6 -->
						
						<!-- crewman7 -->
						<div class="item">
							<div class="crewman_item">
								<div class="crewman">
									<img src="<%=cp%>/resource/mainboot/images/team/7.jpg" alt="" />
								</div>
								<div class="crewman_descr center">
									<div class="crewman_descr_cont">
										<p>홍예서</p>
										<span>Developer</span>
									</div>
								</div>
							</div>
						</div><!-- crewman7 -->
					</div><!-- TEAM SLIDER -->
				</div><!-- //ROW -->
			</div><!-- //CONTAINER -->
		</section><!-- //TEAM -->
		
		
		<!-- NEWS -->
		<section id="news">
		
			<!-- CONTAINER -->
			<div class="container">
				<h2><b>Real</b>&nbsp;review</h2>
				
				<!-- TESTIMONIALS -->
				<div class="testimonials" data-appear-top-offset="-200" data-animated="fadeInUp">
						
					<!-- TESTIMONIALS SLIDER -->
					<div class="owl-demo owl-carousel testim_slider">
						
						<!-- TESTIMONIAL1 -->
						<div class="item">
							<div class="testim_content">“ 핫바디에서 주는 생활미션, 운동 미션 등 다양한 습관성형 미션들을 수행하면서<br> 습관성형에 성공했어요 :) ”</div>
							<div class="testim_author"> ──&nbsp; 2017.08.10 <b>&nbsp; By 담크</b></div>
						</div><!-- TESTIMONIAL1 -->
						
						<!-- TESTIMONIAL2 -->
						<div class="item">
							<div class="testim_content">“ 나에게 용기와 희망을 준 핫바디! 최고에요 ”</div>
							<div class="testim_author"> ──&nbsp; 2017.9.10 <b>&nbsp; By 라나줌마 </b></div>
						</div><!-- TESTIMONIAL2 -->
						
						<!-- TESTIMONIAL3 -->
						<div class="item">
							<div class="testim_content">“ 이제 음식 욕심은 물론이고, 폭식하지 않아요! ”</div>
							<div class="testim_author"> ──&nbsp; 2017.11.25 <b>&nbsp; By 바비 </b></div>
						</div><!-- TESTIMONIAL3 -->
					</div><!-- TESTIMONIALS SLIDER -->
				</div><!-- //TESTIMONIALS -->
				
				<!-- RECENT POSTS -->
				<div class="row recent_posts" data-appear-top-offset="-200" data-animated="fadeInUp">
					<div class="col-lg-4 col-md-4 col-sm-4 padbot30 post_item_block">
						<div class="post_item">
							<div class="post_item_img">
								<img src="<%=cp%>/resource/mainboot/images/blog/1.jpg" alt="" />
								<a class="link" href="blog-post.html" ></a>
							</div>
							<div class="post_item_content">
								<a class="title" href="blog-post.html" >핫바디 수강 1년 후! </a>
								<ul class="post_item_inf">
									<li> 담크 |</li>
									<li>기초체력 챌랜지 |</li>
									<li>핫바디 수강 후 달라진 점</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 padbot30 post_item_block">
						<div class="post_item">
							<div class="post_item_img">
								<img src="<%=cp%>/resource/mainboot/images/blog/2.jpg" alt="" />
								<a class="link" href="blog-post.html"></a>
							</div>
							<div class="post_item_content">
								<a class="title" href="blog-post.html" >건강한 다이어트로 기쁨 두배</a>
								<ul class="post_item_inf">
									<li> 라나줌마|</li>
									<li> 요가챌린지 |</li>
									<li> 건강한 다이어트 후기 </li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 padbot30 post_item_block">
						<div class="post_item">
							<div class="post_item_img">
								<img src="<%=cp%>/resource/mainboot/images/blog/3.jpg" alt="" />
								<a class="link" href="blog-post.html"></a>
							</div>
							<div class="post_item_content">
								<a class="title" href="blog-post.html" >몸무게에 대한 집착은 No!</a>
								<ul class="post_item_inf">
									<li> 바비 |</li>
									<li> 핫바디 챌린지  |</li>
									<li> 몸으로 느낀 변화 </li>
								</ul>
							</div>
						</div>
					</div>
				</div><!-- RECENT POSTS -->
			</div><!-- //CONTAINER -->
		</section><!-- //NEWS -->
	</section>

	
	