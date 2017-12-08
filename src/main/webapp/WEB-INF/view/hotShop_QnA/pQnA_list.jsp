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

<script type="text/javascript">
function selectList(f){
	f.action = "<%=cp%>/bbs/list";
	f.submit();
}

$(function(){
	$("#chkAll").click(function(){
		if(this.checked == true){
			$("input[name=nums]").each(function(){
				this.checked = true;
			});
		} else {
			$("input[name=nums]").each(function(){
				this.checked = false;
			});
		}
	});	
	
	$("#btnDeleteList").click(function(){
		var cnt=$("input[name=nums]:checkbox:checked").length;
		
		if(cnt==0){
			alert("삭제할 게시물을 먼저 선택하세요.");
			return;
		}
		
		var f = document.deleteListForm;
		f.action="<%=cp%>/qna/deleteList";
		f.submit();
	});
	
});

</script>


</head>
<body>

<table style="width: 700px; margin: 10px auto 0px;">
	<tr align="left">
		<td style="font-weight: bold;"> ㅣ 게시판</td>
	</tr>
</table>

<table style="width: 700px; margin: 5px auto 0px;">
	<tr height="25;" style="font-size: 12px;">
		<td width="50%" align="left"><button type="button" id="btnDeleteList" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;">삭제</button></td>
		<td width="50%" align="right">
			<form method="post" name="selectListForm">
				<select name="rows" id="rows" style="background: white; border: 1px solid #A6A6A6; border-radius: 3px; height: 25px;" onchange="selectList(this.form);">
					<option value="10" ${rows==10?"selected='selected'":""}>10개씩 출력</option>
					<option value="20" ${rows==20?"selected='selected'":""}>20개씩 출력</option>
					<option value="30" ${rows==30?"selected='selected'":""}>30개씩 출력</option>
					<option value="50" ${rows==50?"selected='selected'":""}>50개씩 출력</option>
				</select>
				<input type="hidden" name="searchKey" value="${searchKey}">
				<input type="hidden" name="searchValue" value="${searchValue}">
			</form>
		</td>
	</tr>
</table>

<form name="deleteListForm" method="post">
	<table style="width: 700px; margin: 5px auto 0px;">
		<tr style="border: 1px solid #F6F6F6; background: #B2CCFF; font-weight: bold; font-size: 13px;" align="center" height="30px">
			<td width="50"><input type="checkbox" name="chkAll" id="chkAll"></td>
			<td width="60">번호</td>
			<td width="360">제목</td>
			<td width="80">작성자</td>
			<td width="100">작성일</td>
			<td width="50">조회수</td>
		</tr>
		
		<c:forEach var="dto" items="${list}">
		<tr style="border: 1px solid #F6F6F6; background: #F4F1F1; font-size: 12px;" align="center" height="30px">
			<td><input type="checkbox" name="nums" value="${dto.num}"></td>
			<td>${dto.listNum}</td>
			<td align="left" style="padding-left: 5px;">
				<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
				<c:if test="${dto.gap<1}">
					<img src="<%=cp%>/resource/images/new.gif">
				</c:if>
			</td>
			<td>${dto.name}</td>
			<td>${dto.created}</td>
			<td>${dto.hitCount}</td>
		</tr>
		</c:forEach>
	</table>
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="rows" value="${rows}">
</form>

<table style="width: 700px; margin: 1px auto 0px;">
	<tr style="font-size: 12px;" align="center">
		<td>${paging}</td>
	</tr>
</table>
<form name=searchForm method="post">
	<table style="width: 700px; margin: 5px auto 0px;">
		<tr height="25">
			<td style="float: left;">
					<select name="searchKey" style="height: 25px;">
						<option value="subject">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
						<option value="created">등록일</option>
					</select>
			</td>
			<td style="float: left;">
				<input name="searchValue" type="text" style="height: 19px; border: 1px solid #999999; border-radius: 3px; font-size: 13px;">
				<input type="hidden" name="rows" value="${rows}">
			</td>
			<td style="float: left;">
				<button style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;" type="button" onclick="selectList(this.form);">검색</button>
			</td>
			<td style="float: right;">
				<button style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;" type="button" onclick="javascript:location.href='<%=cp%>/hotShop_QnA/pQnA_created';">글올리기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>