<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<head>
<link rel="icon" href="<%=cp%>/resource/mocozzy/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link href="<%=cp%>/resource/mocozzy/style.css" rel="stylesheet">
<!-- Responsive CSS -->
<link href="<%=cp%>/resource/mocozzy/css/responsive/responsive.css" rel="stylesheet">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">

</style>


<script type="text/javascript">
function deleteMoco(geNum){
	if(confirm("모임을 삭제 하시겠습니까?")){
		var url="<%=cp%>/mocojee/delete?geNum=${dto.geNum}";
		location.href=url;
	}
}

$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});

</script>


</head>

<body>

	<!-- ================${mocoNum}
	<!-- ****** Breadcumb Area Start ****** -->
	<div class="breadcumb-area"
		style="background-image: url(<%=cp%>/resource/mocozzy/img/bg-img/mm.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="bradcumb-title text-center">
						<h2>${dto.moName}</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="breadcumb-nav">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="<%=cp%>/mocojee/list_mocojee"><i class="fa fa-home"
									aria-hidden="true"></i> Home</a></li>
							<li class="breadcrumb-item">${dto.moName}</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ****** Breadcumb Area End ****** -->

	<!-- ****** Single Blog Area Start ****** -->
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">모임정보</a></li>
			<li><a href="<%=cp%>/moco_board/c_notice">공지게시판</a></li>
			<li><a href="<%=cp%>/moco_board/c_free">자유게시판</a></li>
		</ul>

		<section class="single_blog_area section_padding_80">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-8">
						<div class="row no-gutters">

							<!-- Single Post -->
							<div class="col-10 col-sm-11">
								<div class="single-post">
									<!-- Post Thumb -->
									<div class="post-thumb">
										<img src="<%=cp%>/uploads/c_mocojee/${dto.moImage}" alt="">
									</div>
									<!-- Post Content -->
									<div class="post-content">
										<div class="post-meta d-flex">
											<div class="post-author-date-area d-flex">
												<!-- Post Date -->
												<div class="post-date">
													<p>${dto.moName}&nbsp; | &nbsp; ${dto.moIntro}</p>
												</div>
											</div>
											<!-- Post Comment & Share Area -->
										</div>

										<h3 style="font-weight: bold; color: #d9534f;">벙개 정보</h3>

										<div class="info">
											<table class="table"
												style="border-style: solid; border-color: #ffc107; border-width: 1px;">
												<thead>
													<tr>
														<th>모임장소</th>
														<th>참석자수</th>
														<th>모임일시</th>
														<th>시작시간</th>
														<th>종료시간</th>
														<th>회비</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>장소</td>
														<td>인원</td>
														<td>일시</td>
														<td>시작시간</td>
														<td>종료시간</td>
														<td>회비</td>
													</tr>
												</tbody>
											</table>
										</div>

										<div>
											<h3 style="font-weight: bold; color: #d9534f;">모꼬지 소개</h3>
											<P>${dto.moContent}</P>
											<hr>
										</div>
									</div>
								</div>
							</div>

							<!-- Contact Form  -->
							<div class="contact-form-area">
								<div class="row">
									<div class="col-12 col-md-7 item">
										<div class="contact-form wow fadeInUpBig"
											data-wow-delay="0.6s">
											<h3 style="font-weight: bold; color: #d9534f;">댓글 쓰기</h3>
											<!-- Contact Form -->
											<form action="#" method="post">
												<div class="form-group">
													<textarea class="form-control" name="message" id="message"
														cols="30" rows="10" placeholder="Message"
														style="width: 676px;"> </textarea>
												</div>
												<button type="submit" class="btn contact-btn"
													style="margin-top: 0px;">등록하기</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- ****** Blog Sidebar ****** -->
					<div class="col-12 col-sm-8 col-md-6 col-lg-4">
						<c:if test="${sessionScope.member.userId==dto.userId}">	
							<button type="button" class="btn btn-default"
								style="margin-top: 10px;"
								onclick="javascript:location.href='<%=cp%>/mocojee/u_mocojee?geNum=${dto.geNum}';">
										기본 정보 수정</button>
						</c:if>
						<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">	
							<button type="button" class="btn btn-default" style="margin-top: 10px;"
								onclick="deleteMoco();"> 모임 삭제하기</button>
						</c:if>
						
						<div class="single-widget-area newsletter-widget">

							<div class="widget-title text-center">
								<h6>운영진 한마디</h6>
								<span>${dto.soGae}</span>
							</div>
						</div>

						<!-- Single Widget Area -->
						<div class="single-widget-area popular-post-widget">
							<div class="widget-title text-center">
								<hr>
								<h6>번개 리스트</h6>
							</div>
							
							<!--1번 번개 섹션-->
							<div class="single-populer-post d-flex">
								<img src="<%=cp%>/resource/mocozzy/img/sidebar-img/1.jpg" alt=""
									width="">
								<div class="post-content">
									<a href="#"> </a>
									<p>Tuesday, October 3, 2017</p>
									<button type="button" class="btn btn-danger"
										style="margin-top: 10px;">참석하기</button>
								</div>
							</div>
							
							<!--2번 번개 섹션 -->
							<div class="single-populer-post d-flex">
								<img src="<%=cp%>/resource/mocozzy/img/sidebar-img/2.jpg" alt="">
								<div class="post-content">
									<a href="#"> </a>
									<p>Tuesday, October 3, 2017</p>
								
									<button type="button" class="btn btn-danger"
										style="margin-top: 10px;">참석하기</button>
									
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="<%=cp%>/resource/mocozzy/img/sidebar-img/3.jpg" alt="">
								<div class="post-content">
									<a href="#"> </a>
									<p>Tuesday, October 3, 2017</p>
									<button type="button" class="btn btn-danger"
										style="margin-top: 10px;">참석하기</button>
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="<%=cp%>/resource/mocozzy/img/sidebar-img/4.jpg" alt="">
								<div class="post-content">
									<a href="#"> </a>
									<p>Tuesday, October 3, 2017</p>
									<button type="button" class="btn btn-danger"
										style="margin-top: 10px;">참석하기</button>
								</div>
							</div>
							<!-- Single Popular Post -->
							<div class="single-populer-post d-flex">
								<img src="<%=cp%>/resource/mocozzy/img/sidebar-img/5.jpg" alt="">
								<div class="post-content">
									<a href="#"> </a>
									<p>Tuesday, October 3, 2017</p>
									<button type="button" class="btn btn-danger"
										style="margin-top: 10px;">참석하기</button>
								</div>
							</div>
					
					
						<!-- 번개등록 만들기  -->
						<c:if test="${sessionScope.member.userId==dto.userId}">	
							<button type="button" class="btn btn-primary btn-block"
									onclick="javascript:location.href='<%=cp%>/mocojee/ccbung'" style="margin-top: 10px;">
								<i class="fa fa-bolt"></i> 벙개 등록하기
							</button>
						</c:if>
     				
	
						<!-- -까지  -->
						
				</div>
						<!-- Single Widget Area -->
					</div>
				</div>
			</div>
		</section>
	</div>

	
</body>