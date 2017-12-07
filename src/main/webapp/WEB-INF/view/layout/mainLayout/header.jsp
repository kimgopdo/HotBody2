
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>


<!-- HEADER -->
<header>
	<!-- MENU BLOCK -->
	<div class="menu_block">

		<!-- CONTAINER -->
		<div class="container clearfix">

		<!-- LOGO -->
		<div class="logo pull-left">
			<a href="<%=cp%>/index.jsp"> <span class="b1">H</span><span class="b1">O</span><span class="b1">T</span>
				<span class="b1">B</span><span class="b1">O</span><span class="b1">D</span><span class="b1">Y</span>
			</a>
		</div>
		<!-- //LOGO -->

			<!-- MENU -->
			<div class="pull-right">
				<nav class="navmenu center">
					<ul>
						<li class="first active scroll_btn"><a href="#home">Home</a></li>
						<li class="sub-menu"><a href="">클래스</a>
							<ul>
								<li><a href="<%=cp%>">온라인</a></li>
								<li><a href="<%=cp%>">오프라인</a></li>
							</ul></li>
						<li class="scroll_btn last"><a href="<%=cp%>">쇼핑몰</a></li>
						<li class="sub-menu"><a href="">모꼬지</a>
							<ul>
								<li><a href="<%=cp%>/moco_board/article">1</a></li>
								<li><a href="<%=cp%>">2</a></li>
								<li><a href="<%=cp%>">3</a></li>
							</ul></li>
						<li class="sub-menu"><a href="<%=cp%>">공지사항</a>
							<ul>
								<li><a href="blog.html">공지사항</a></li>
								<li><a href="blog-post.html">이벤트</a></li>
							</ul></li>
						<li class="scroll_btn last"><a href="#contacts">자주묻는질문</a></li>
						<li class="scroll_btn last"><a href="<%=cp%>">로그인</a></li>
						<li class="scroll_btn last"><a href="<%=cp%>">회원가입</a></li>
					</ul>
				</nav>
			</div>
			<!-- //MENU -->
		</div>
		<!-- //MENU BLOCK -->
	</div>
	<!-- //CONTAINER -->
</header>
<!-- //HEADER -->
