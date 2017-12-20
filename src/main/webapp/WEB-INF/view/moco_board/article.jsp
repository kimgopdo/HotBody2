<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


	<link rel="icon" href="<%=cp%>/resource/mocozzy/img/core-img/favicon.ico">   
 	<!-- Core Stylesheet -->
   		 <link href="<%=cp%>/resource/mocozzy/style.css" rel="stylesheet">
 	<!-- Responsive CSS -->
	   <link href="<%=cp%>/resource/mocozzy/css/responsive/responsive.css" rel="stylesheet">
	   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	   
   	   
	
<body>
    <!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(<%=cp%>/resource/mocozzy/img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>Single Post Blog</h2>
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
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Archive</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Single Post Blog</li>
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
    <li><a href="<%=cp%>/moco_board/list_free">자유게시판</a></li>
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
                                    <img src="<%=cp%>/resource/mocozzy/img/blog-img/10.jpg" alt="">
                                </div>
                                <!-- Post Content -->
                                <div class="post-content">
                                    <div class="post-meta d-flex">
                                        <div class="post-author-date-area d-flex">
                                            <!-- Post Author -->
                                            <div class="post-author">
                                                <a href="#">By Marian</a>
                                            </div>
                                            <!-- Post Date -->
                                            <div class="post-date">
                                                <a href="#">May 19, 2017</a>
                                            </div>
                                        </div>
                                        <!-- Post Comment & Share Area -->
                                        <div class="post-comment-share-area d-flex">
                                            <!-- Post Favourite -->
                                            <div class="post-favourite">
                                                <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
                                            </div>
                                            <!-- Post Comments -->
                                            <div class="post-comments">
                                                <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
                                            </div>
                                            <!-- Post Share -->
                                            <div class="post-share">
                                                <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                        
                                        <h3 style="font-weight: bold; color: #d9534f;">기본정보</h3>

                                    <div class="info">          
                                          <table class="table" style="border-style: solid; border-color: #ffc107; border-width: 1px;">
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

                                    <h3 style="font-weight: bold; color: #d9534f;">모꼬지 소개</h3>
                                    <P>소개</P>
                                </div>
                            </div>

                        </div>

                        <!--댓글등록-->
                            <div class="container" style="margin-top: 10px;">
                                <div class="form-group">
                                  <label for="comment">댓글등록:</label>
                                  <textarea class="form-control" rows="5" id="comment"></textarea>
                                    <button type="button" class="btn btn-danger" style="margin-top: 10px; float: right;">등록하기</button>
                                </div>
                            </div>
                    </div>
                </div>


                <!-- ****** Blog Sidebar ****** -->
                <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                       <div class="single-widget-area newsletter-widget">
                            <div class="widget-title text-center">
                                <h6>운영진 한마디</h6>
                                <span>한마디</span>
                            </div>
                        </div>

                        <!-- Single Widget Area -->
                        <div class="single-widget-area popular-post-widget">
                            <div class="widget-title text-center">
                                <hr>
                                <h6>번개 리스트</h6>
                            </div>
                            <!-- Single Popular Post -->
                            <div class="single-populer-post d-flex">
                                <img src="<%=cp%>/resource/mocozzy/img/sidebar-img/1.jpg" alt="" width="">
                                <div class="post-content">
                                    <a href="#">
                                    </a>
                                    <p>Tuesday, October 3, 2017</p>
                                    <button type="button" class="btn btn-danger" style="margin-top: 10px;">참석하기</button>
                                </div>
                            </div>
                            <!-- Single Popular Post -->
                            <div class="single-populer-post d-flex">
                                <img src="<%=cp%>/resource/mocozzy/img/sidebar-img/2.jpg" alt="">
                                <div class="post-content">
                                    <a href="#">
                                    </a>
                                    <p>Tuesday, October 3, 2017</p>
                                     <button type="button" class="btn btn-danger" style="margin-top: 10px;">참석하기</button>
                                </div>
                            </div>
                            <!-- Single Popular Post -->
                            <div class="single-populer-post d-flex">
                                <img src="<%=cp%>/resource/mocozzy/img/sidebar-img/3.jpg" alt="">
                                <div class="post-content">
                                    <a href="#">
                                    </a>
                                    <p>Tuesday, October 3, 2017</p>
                                     <button type="button" class="btn btn-danger" style="margin-top: 10px;">참석하기</button>
                                </div>
                            </div>
                            <!-- Single Popular Post -->
                            <div class="single-populer-post d-flex">
                                <img src="<%=cp%>/resource/mocozzy/img/sidebar-img/4.jpg" alt="">
                                <div class="post-content">
                                    <a href="#">
                                    </a>
                                    <p>Tuesday, October 3, 2017</p>
                                     <button type="button" class="btn btn-danger" style="margin-top: 10px;">참석하기</button>
                                </div>
                            </div>
                            <!-- Single Popular Post -->
                            <div class="single-populer-post d-flex">
                                <img src="<%=cp%>/resource/mocozzy/img/sidebar-img/5.jpg" alt="">
                                <div class="post-content">
                                    <a href="#">
                                    </a>
                                    <p>Tuesday, October 3, 2017</p>
                                     <button type="button" class="btn btn-danger" style="margin-top: 10px;">참석하기</button>
                                </div>
                            </div>
                        </div>
                        <!-- Single Widget Area -->
                    </div>
                </div>
            </div>
    </section>
 
 </div>
 
 <script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});

</script>

</body>
