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
</script>
<style type="text/css">
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

<div class="body-container" style="width: 1100px; margin-top: 100px;">

<div class="body-title">
        <h3><span style="font-family: Webdings">2</span>재료리스트</h3>
</div>


<table style="width: 1100px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">

	<tr height="40">
		<td align="left" colspan="7">
			${dataCount}개(${page}/${total_page}페이지)
		</td>
	</tr>

	<tr height="40" style="background: #666666; color: #ffffff;" align="center">
		<th width="60">번호</th>
		<th width="80">카테고리</th>
		<th>제목</th>
		<th width="65" >작성자</th>
		<th width="100" >작성일</th>
		<th width="65">댓글수</th>
		<th width="65">조회수</th>
	</tr>
	
	
	<tr height="40" align="center" class="board">
		<td width="60">하하하</td>
		<td width="80" >쇼핑몰</td>
		<td align="left">임지훈</td>
		<td width="65">안녕</td>
		<td width="100">안녕</td>
		<td width="65">안녕2탄</td>
		<td width="65">100</td>
	</tr>
	
	<tr height="60" align="center">
		<td colspan="7">1</td>
	</tr>
	
	<tr>
		<td colspan="7">
		<form name="searchList" method="post" action="<%=cp%>/notice/list">
			<select name="searchKey" style="height: 25px;">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="created">작성일</option>
			</select>	
			<input type="text" name="searchValue">
			<input type="text" style="display:none;">
			
			<button type="button" onclick="send(this.form);" class="btn-search" style="width: 60px;">검색</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/created'" style="float: right; width: 80px;">글올리기</button>
			<button type="button" class="btn-list" onclick="javascript:location.href='<%=cp%>/myclass/addingrerdients/list';" style="float: right; width: 80px; margin-right: 10px;">새로고침</button>
		</form>
		</td>
	</tr>
</table>
</div>


