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

<script type="text/javascript">
function selectList(f){
	f.submit();
}
function backPage(){
	history.back();
}

/* $(function(){
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
}); */

<%-- function check(){
	var uid="${sessionScope.member.userId}";
	if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	} else {
		location.href="<%=cp%>/hotShop/review_created";
	}
} --%>

</script>


</head>
<body style="min-height: 950px;">

<table style="width: 100%; margin-bottom: 30px; margin-top: 50px;">
	<tr align="left">
		<td style="font-weight: bold; font-size: 24px;"> 상품 후기 리스트</td>
	</tr>
</table>

<table style="width: 100%; margin: 5px auto 0px;">
	<tr height="25;" style="font-size: 12px;">
		<!-- <td width="50%" align="left"><button type="button" id="btnDeleteList" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;">삭제</button></td> -->
		<td width="50%" align="left"><button type="button" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;" onclick="javascript:location.href='<%=cp%>/hotShop/review_list';">새로고침</button></td>
		<td width="50%" align="right">
			<form method="post" name="selectListForm">
				<select name="rows" id="rows" style="background: white; border: 1px solid #A6A6A6; border-radius: 3px; height: 25px;" onchange="selectList(this.form);">
					<option value="10" ${rows==10?"selected='selected'":""}>10개씩 보기</option>
					<option value="20" ${rows==20?"selected='selected'":""}>20개씩 보기</option>
					<option value="30" ${rows==30?"selected='selected'":""}>30개씩 보기</option>
					<option value="50" ${rows==50?"selected='selected'":""}>50개씩 보기</option>
				</select>
				<input type="hidden" name="searchKey" value="${searchKey}">
				<input type="hidden" name="searchValue" value="${searchValue}">
			</form>
		</td>
	</tr>
</table>

<form name="deleteListForm" method="post">
	<table style="width: 100%; margin: 5px auto 0px; border-collapse: collapse;">
		<tr style="border: 1px solid #F6F6F6; background: white; font-weight: bold; font-size: 13px; border-bottom: 1px solid #d5d5d5;" align="center" height="40px">
			<!-- <td width="20"><input type="checkbox" name="chkAll" id="chkAll"></td> -->
			<td width="60">번호</td>
			<td width="380" style="padding-left: 20px;">제목</td>
			<td width="80">작성자</td>
			<td width="80">작성일</td>
			<td width="80">평점</td>
		</tr>
		
		<c:forEach var="dto" items="${list}">
		<tr style="border: 1px solid #F6F6F6; background: white; font-size: 13px;" align="center" height="30px">
			<%-- <td><input type="checkbox" name="nums" value="${dto.reviewCode}"></td> --%>
			<td>${dto.listNum}</td>
			<td align="left" style="padding-left: 5px; color: black;">
				<a href="${articleUrl}&reviewCode=${dto.reviewCode}" style="color: gray; font-size: 13px;"><span style="font-weight: bold;">[${dto.pdName}]</span> ${dto.reviewSubject} (${dto.replyCount})</a>
			</td>
			<td>${dto.userName}</td>
			<td>${dto.reviewCreated}</td>
			<td>${dto.starScore}</td>
		</tr>
		</c:forEach>
	</table>
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="rows" value="${rows}">
</form>

<table style="width: 100%; margin-top: 10px; border-collapse: collapse;">
	<tr style="font-size: 12px; border-top: 1px solid #d5d5d5;" align="center">
		<td style="padding-top: 10px;">${paging}</td>
	</tr>
</table>
<form name=searchForm method="post">
	<table style="width: 100%; margin: 5px auto 0px;">
		<tr height="25">
			<td style="float: left; margin-right: 3px;">
					<select name="searchKey" style="height: 25px;">
						<option value="reviewSubject">제목</option>
						<option value="userName">작성자</option>
						<option value="reviewContent">내용</option>
						<option value="reviewCreated">등록일</option>
					</select>
			</td>
			<td style="float: left; margin-right: 3px;">
				<input name="searchValue" type="text" style="height: 25px; border: 1px solid #999999; border-radius: 3px; font-size: 13px;">
				<input type="hidden" name="rows" value="${rows}">
			</td>
			<td style="float: left; margin-right: 3px;">
				<button style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;" type="button" onclick="selectList(this.form);">검색</button>
			</td>
			<td style="float: right; margin-right: 3px;">
				<button style="background: white; border: 1px solid #999999; border-radius: 3px; height: 25px;" type="button" onclick="backPage();">뒤로가기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>