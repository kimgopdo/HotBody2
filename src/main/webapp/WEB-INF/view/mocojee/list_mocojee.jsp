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

</script>

</head>
<body>

	<!-- ****** Breadcumb Area Start ****** -->
	<div class="breadcumb-area"
		style="background-image: url(<%=cp%>/resource/mocozzy/img/bg-img/mm.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="bradcumb-title text-center">
						<h2>WELCOME TO MOCOZZY</h2>
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
							<li class="breadcrumb-item"><a href="<%=cp%>/mocojee/list_mocojee"><i
									class="fa fa-home" aria-hidden="true"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page" onclick="sendOk();"><a href="#">
							<span style="font-size: 14px;">모꼬지 개설하러 가기</span></a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ****** Breadcumb Area End ****** -->

	<!-- ****** Archive Area Start ****** -->
	
	<div class="btmspace-50 center">
      <h3 class="btmspace-10">MOCOZY PICK</h3>
      <p class="nospace"> 원하는 운동모임을 통해 보다 건강하고, 행복한 삶을 만들어 보세요! </p>
       <button type="button" class="btn btn-outline-primary" onclick="sendOk();">모꼬지 개설하러 가기</button>
    </div>
    

	<section class="archive-area section_padding_80" style="margin-top: 30px;">
		<div class="container">
			<div class="row">
			
				<!-- Single Post -->
		<c:forEach var="dto" items="${list}">		
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.4s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                            <img src="<%=cp%>/uploads/c_mocojee/${dto.moImage}" style="width: 350px; height: 230px;">
                            
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
						<nav aria-label="#">

						</nav>
						<div class="page-status">
							<p>${dataCount}개(${page}/${total_page}페이지)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
	</section>

    

</body>