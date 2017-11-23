
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$('#myTab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})

	$('#myTab a[href="#profile"]').tab('show') // Select tab by name
	$('#myTab a:first').tab('show') // Select first tab
	$('#myTab a:last').tab('show') // Select last tab
	$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)
</script>
</head>
<body>

	<div role="tabpanel">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#class"
				aria-controls="class" role="tab" data-toggle="tab">클래스</a></li>
			<li role="presentation"><a href="#mocojee"
				aria-controls="mocojee" role="tab" data-toggle="tab">모꼬지</a></li>
			<li role="presentation"><a href="#shopingmall"
				aria-controls="shopingmall" role="tab" data-toggle="tab">쇼핑몰</a></li>
			<li role="presentation"><a href="#review" aria-controls="review"
				role="tab" data-toggle="tab">운동후기</a></li>
			<li role="presentation"><a href="#event" aria-controls="event"
				role="tab" data-toggle="tab">이벤트</a></li>
			<li role="presentation"><a href="#servicecenter"
				aria-controls="servicecenter" role="tab" data-toggle="tab">고객센터</a></li>

			<li  style="margin-left: 100px; "><a href="#" type="button" class="btn btn-info btn-xs">로그인</a></li>
			<li ><a href="#" type="button" class="btn btn-info btn-xs">회원가입</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content" style="padding: 10px;">
			<div role="tabpanel" class="tab-pane active" id="class">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">온라인클래스</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">오프라인 클래스</button>
					</div>

				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="mocojee">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">모꼬지</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">모꼬지</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">모꼬지</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">모꼬지</button>
					</div>

				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="shopingmall">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">온라인클래스</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">오프라인 클래스</button>
					</div>

				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="review">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">온라인클래스</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">오프라인 클래스</button>
					</div>

				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="event">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">이벤트리스트</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">오프라인 클래스</button>
					</div>

				</div>
			</div>

			<div role="tabpanel" class="tab-pane" id="servicecenter">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">오프라인 클래스</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							style="background: white;">오프라인 클래스</button>
					</div>

				</div>
			</div>
		</div>

	</div>



</body>
</html>