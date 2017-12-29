<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script>
$(document).ready(function(){
    $(".board:even").css("background-color","#EDEDEF");
});
</script>

<script type="text/javascript">
function send(f){
	f.submit();
}

function checkArticle(){
	alert("해당게시글은 관리자 혹은 자신만 확인가능합니다.");
	return;
}

function checkArticle2(){
	alert("로그인 후에 이용하실 수 있습니다.");
	location.href="<%=cp%>/member/login";
}
</script>
<style type="text/css">
.imim{
	
    background-color: #f7f7f7;
}

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

<body style="height: 1300px;">
<div style="width:100%;  background-color:#f7f7f7;  padding-top:25px; margin-bottom:40px; height:420px;" class="imim">
<!--배너-->

<div style="overflow:hidden; width:1150px; margin:0 auto; background-color:#f7f7f7;">
<p style="margin-top:20px; margin-bottom:40px;">		
<img src="<%=cp%>/resource/design/qna_Logo.jpg" alt="배너" style="padding-right: 20px;"></p>

	<img style="width: 100%; cursor: pointer;" src="<%=cp%>/resource/design/qnabanner.jpg">
	
</div>
</div>




<table style="width: 1100px; margin: 20px auto; margin-bottom:200px; border-collapse: collapse; border-spacing: 0">
	<tr height="40">
		<td align="left" colspan="6">
			${dataCount}개(${page}/${total_page}페이지)
		</td>
	</tr>
	
	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<td width="40" align="center">번호</td>
		<td width="300" align="center">제목</td>
		<td width="70" align="center">글쓴이</td>
		<td width="40" align="center">작성일</td>
		<td width="40" align="center">조회수</td>
		
	</tr>

	<c:forEach var="dto" items="${list}">
	<tr height="40" align="center" class="board">
		<td width="60">${dto.listNum}</td>
		<td align="left">
			<c:choose>
		      	   <c:when test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId=='admin'}">      	 
		      	   	  <a href="${articleUrl}&eventCode=${dto.eventCode}" style="text-decoration: none; color: black;">${dto.subject}
						<c:if test="${dto.replyCount>0}"> [${dto.replyCount}]</c:if>
					 </a>
				   </c:when>
				   <c:when test="${sessionScope.member.userId == null}">
				    <a href="javascript:checkArticle2()" style="text-decoration: none; color: black;">${dto.subject}
						<c:if test="${dto.replyCount>0}"> [${dto.replyCount}]</c:if>
					</a>
				   </c:when>
				   
				  <c:otherwise>
				   	<a href="javascript:checkArticle()" style="text-decoration: none; color: black;">${dto.subject}
						<c:if test="${dto.replyCount>0}"> [${dto.replyCount}]</c:if>
					</a> 	
				   </c:otherwise>	   
		      </c:choose>
		

		</td>
		<td width="65">${dto.userName}</td>
		<td width="100">${dto.created}</td>
			<td width="65">${dto.hitCount}</td>
		</tr>
	</c:forEach>
	
	<tr height="60" align="center">
		<td colspan="6">${paging}</td>
	</tr>
	
	<tr>
		<td colspan="6">
		<form name="searchList" method="post" action="<%=cp%>/event/list">
			<select name="searchKey" style="height: 25px;">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="userId">글쓴이</option>
			</select>	
			<input type="text" name="searchValue">
			<input type="text" style="display:none;">
			
			<button type="button" onclick="send(this.form);" class="btn-search" style="width: 60px;">검색</button>
			<c:if test="${sessionScope.member.userId != 'admin'}">
				<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/event/created'" style="float: right; width: 80px;">글올리기</button>
			</c:if>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/event/list';" style="float: right; width: 80px; margin-right: 10px;">새로고침</button>
		</form>
		</td>
	</tr>
</table>
</body>
</html>
