<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="<%=cp%>/" style="font-size: 17px;">H O T B O D Y</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
      	<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Member">
          <a class="nav-link" href="<%=cp%>/admin/member/list">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">회원관리</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="DietClass">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseClass" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">클래스</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseClass">
            <li>
              <a href="<%=cp%>/admin/dietClass/list">클래스 관리</a>
            </li>
            <li>
              <a href="<%=cp%>/admin/cprogram/list">프로그램 관리</a>
            </li>
            <li>
              <a href="<%=cp%>/admin/member/regi">등록 회원</a>
            </li>
            <li>
              <a href="<%=cp%>/survey/created">설문 등록</a>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2">멘토 메뉴</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti2">
                <li>
                  <a href="<%=cp%>/admin/mission/list">미션 등록</a>
                </li>
                <li>
                  <a href="#">피드백 남기기</a>
                </li>
              </ul>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti3">정보 관리</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti3">
                <li>
                  <a href="<%=cp%>/myclass/addingrerdients/list">재료 등록</a>
                </li>
                <li>
                  <a href="<%=cp%>/myclass/addexercise/list">운동 등록</a>
                </li>
                <li>
                  <a href="<%=cp%>/myclass/addinfo/list">유용한정보 등록</a>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Shop">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseShop" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">쇼핑몰</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseShop">
          <li>
              <a href="<%=cp%>/admin/hotShop/productList">상품 관리</a>
            </li>
            <li>
              <a href="<%=cp%>/admin/hotShop/productInList">입고</a>
            </li>
            <li>
              <a href="<%=cp%>/admin/hotShop/productDisList">폐기</a>
            </li>
            <li>
              <a href="<%=cp%>/admin/hotShop/chart">통계</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Moco">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMoco" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">모꼬지</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMoco">
          	<li>
              <a href="#">모꼬지 관리</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Board">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseBoard" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">게시판</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseBoard">
            <li>
              <a href="#">공지사항</a>
            </li>
            <li>
              <a href="#">이벤트</a>
            </li>
            <li>
              <a href="#">자주하는질문</a>
            </li>
            <li>
              <a href="#">문의하기</a>
            </li>
            <li>
              <a href="#">후기게시판</a>
            </li>
            <li>
              <a href="#">쇼핑몰 QnA게시판</a>
            </li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      
      <ul class="navbar-nav ml-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="<%=cp%>/">
	          <i class="fa fa-fw fa-sign-out"></i>홈으로</a>
	      </li>
      </ul>
    </div>
  </nav>
  </body>
  