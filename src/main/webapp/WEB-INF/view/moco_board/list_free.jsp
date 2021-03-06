<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
    $(".board:even").css("background-color","#EDEDEF");
});
</script>

<script type="text/javascript">
function send(f){
	f.submit();
}
</script>
<style type="text/css">
body{
	font-family: "맑은 고딕";
	font-size: 14px;
}
.btn-list {
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    width : 100px;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    white-space: nowrap;
    font-size: 12px;
    user-select: none;
    border-width: 1px;
    border-style: solid;
    background-color: #999999;
    border-color: #cccccc;
    border-image: initial;
    padding: 6px 9px;
    border-radius: 2px;
    color: #ffffff;
}
.btn-search {
    display: inline-block;
    font-weight: normal;
    text-align: center;
    width : 50px;
    height : 30px;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    white-space: nowrap;
    font-size: 12px;
    user-select: none;
    border-width: 1px;
    border-style: solid;
    background-color: #ffffff;
    border-color: #cccccc;
    border-image: initial;
    padding: 10px auto;
    color: black;
}
</style>
</head>
<body>


	<div class="breadcumb-nav">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<%=cp%>/mocojee/list_mocojee"><i
									class="fa fa-home" aria-hidden="true"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page" onclick="sendOk();"> 
							<a href="#"> <span style="font-size: 14px;"> 뒤로가기</span> </a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

<div style="height: 50px;"></div>
<div style="font-size: 40px; width: 1000px; margin: 20px auto 0; font-weight: bold; color: #666666;">|자유게시판</div>
<table style="width: 1000px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	
	<tr height="40">
		<td align="left" colspan="6">
			${dataCount}개(${page}/${total_page}페이지)
		</td>
	</tr>
	
	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<th width="60" >번호</th>
		<th >제목</th>
		<th width="65" >작성자</th>
		<th width="100" >작성일</th>
		<th width="65">조회수</th>
	</tr>
	
	
	<c:forEach var="dto" items="${list}">
	<tr height="40" align="center" class="board">
		<td width="60">${dto.listNum}</td>
		<td align="left">
			<a href="${articleUrl}&num=${dto.moFBNum}" style="text-decoration: none; color: black;">${dto.moFBSubject}</a>
		</td>
		<td width="65">${dto.userId}</td>
		<td width="100">${dto.moFBCreated}</td>
		<c:choose>
			<c:when test="${dto.moFBHit>20}">	
				<td width="65" style="font-weight: bold; color: red;"><img src="<%=cp%>/resource/images/hitCount.png" align="left">${dto.moFBHit}</td>
			</c:when>
			<c:otherwise>
				<td width="65">${dto.moFBHit}</td>	
			</c:otherwise>
		</c:choose>
	</tr>
	</c:forEach>
	
	<tr height="60" align="center">
		<td colspan="6">${paging}</td>
	</tr>
	
	<tr>
		<td colspan="6">
		<form name="searchList" method="post" action="<%=cp%>/notice/list">
			<select name="searchKey" style="height: 25px;">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="created">작성일</option>
			</select>	
			<input type="text" name="searchValue">
			<input type="text" style="display:none;">
			
			<button type="button" onclick="send(this.form);" class="btn-search" style="width: 60px;">검색</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/moco_board/${mocoNum}/c_free'" style="float: right; width: 80px;">글올리기</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/moco_board/${mocoNum}/list_free';" style="float: right; width: 80px; margin-right: 10px;">새로고침</button>
		</form>
		
		</td>
	</tr>
</table>
</body>
</html>
