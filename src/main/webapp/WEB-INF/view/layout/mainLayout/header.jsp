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
				<a href="<%=cp%>/index.jsp"> <span class="b1">H</span><span
					class="b1">O</span><span class="b1">T</span> <span class="b1">B</span><span
					class="b1">O</span><span class="b1">D</span><span class="b1">Y</span>
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
								<li><a href="<%=cp%>/dietClass/list?type=0">온라인</a></li>
								<li><a href="<%=cp%>/dietClass/list?type=1">오프라인</a></li>
							</ul></li>
						<li class="scroll_btn last"><a href="<%=cp%>/hotShop">쇼핑몰</a></li>
						<li class="scroll_btn last"><a
							href="<%=cp%>/mocojee/list_mocojee">모꼬지</a>
						<li class="sub-menu"><a href="<%=cp%>">공지사항</a>
							<ul>
								<li><a href="<%=cp%>/notice/list">공지사항</a></li>
								<li><a href="<%=cp%>/event/list">이벤트</a></li>
							</ul></li>
						<li class="sub-menu"><a href="<%=cp%>">문의사항</a>
							<ul>
								<li><a href="<%=cp%>/qna2/list">문의사항</a></li>
								<li><a href="<%=cp%>/qna1/list">자주묻는질문</a></li>
							</ul></li>

						<c:if test="${empty sessionScope.member}">
							<li class="scroll_btn last"><a href="<%=cp%>/member/login">로그인</a>
							</li>
							<li class="scroll_btn last"><a href="<%=cp%>/member/member">회원가입</a></li>
						</c:if>

						<c:if test="${not empty sessionScope.member}">
							<c:if test="${sessionScope.member.userId=='admin'}">
								<li class="scroll_btn last"><a href="<%=cp%>">관리자페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.member.userId!='admin'}">
								<li class="scroll_btn last"><a href="<%=cp%>/mypage/mypage">마이페이지</a></li>
								<li class="scroll_btn last"><a
									href="<%=cp%>/member/myclass">마이클래스</a></li>
							</c:if>
							<li class="scroll_btn last">
								<button type="button" name="searchBtn" data-toggle="modal"
									data-target="#myLoginModal"
									style="background: white; border: none; outline: none;"
									onclick="javascript:location.href='<%=cp%>/member/logout';">
									로그아웃</button>
							</li>
						</c:if>
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
