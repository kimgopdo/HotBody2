<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	//var f = $("form[name=searchForm]").serialize();
	alert(f);
	f.submit();
}

function changes(fr) {
	$("#period").show();
	$("#searchValue").show();
	$(".boxTF").show();
	$("#period").prop("disabled",false);
	$("#searchValue").prop("disabled",false);
	
	if(fr=='gender'){
		num = new Array("남","여");
		vnum = new Array("남","여");
		$("#searchValue").hide();
		$(".boxTF").hide();
		$("#searchValue").prop("disabled",true);
	} else if(fr=='userName' || fr=='userId') {
		$("#period").hide();
		$(".boxTF").show();
		$("#period").prop("disabled",true);
		return;
	}
	for(i=0;i<num.length;i++){
		document.searchForm.period.options[i] = new Option(num[i],vnum[i]);
	}
	
}
</script>

<div class="body-container" style="width:1300px; padding-left: 20px; padding-top: 50px;">
<div style="font-size: 40px; width: 1300px;font-weight: bold; color: #666666;">회원 리스트</div>
<div style="font-size: 16px; width: 1300px; color: tomato; margin-top: 10px;">총 회원수 : ${dataCount}명
<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/member/list';" style="float: right;">새로고침</button></div>
<table style="width: 1300px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="45" align="center" style="font-weight: bold; background: #999999; color:#ffffff;">
		<td width="60">번호</td>
		<td width="100">아이디</td>
		<td width="100">이름</td>
		<td width="80">성별</td>
		<td width="120">생년월일</td>
		<td width="120">전화번호</td>
		<td width="120">메일주소</td>
		<td>주소</td>
	</tr>
	<c:forEach var="dto" items="${list}">
		<tr height="40" align="center">
			<td width="60">${dto.listNum}</td>
			<td width="100">${dto.userId}</td>
			<td width="100">${dto.userName}</td>
			<td width="80">${dto.gender}</td>
			<td width="120">${dto.birth}</td>
			<td width="120">${dto.tel}</td>
			<td width="120">${dto.email}</td>
			<td align="left">${dto.addr1}&nbsp;${dto.addr2}</td>
		</tr>
	</c:forEach>
	
</table>
	<div style="width: 1000px; margin: 20px auto 0;" align="center">${paging}</div>
<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="center">
		          <form name="searchForm" method="post" action="<%=cp%>/admin/member/list" >
		              <select name="searchKey" class="selectField" onchange="changes(document.searchForm.searchKey.value)">
		                  <option value="userId">아이디</option>
		                  <option value="userName">이름</option>
		                  <option value="gender">성별</option>
		            </select>
		            <select name="searchValue" id="period" class="selectField" style="display: none;">
        	 		</select>
		            <input type="text" name="searchValue" class="boxTF">
		            <button type="button" class="btn02" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
</div>