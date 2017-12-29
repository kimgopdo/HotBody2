<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function searchList2() {
	var f=document.searchRegiForm;
	f.submit();
}

function changes(fr) {
	$("#classNameValue").show();
	$("#searchValue").show();
	$("#classNameValue").prop("disabled",false);
	$("#searchValue").prop("disabled",false);
	
	if(fr=='className'){
		$("#searchValue").hide();
		$(".boxTF").hide();
		$("#searchValue").prop("disabled",true);
		$("#classNameValue").show();
	} else if(fr=='userName' || fr=='userId') {
		$("#classNameValue").hide();
		$(".boxTF").show();
		$("#classNameValue").prop("disabled",true);
		return;
	}
}
</script>

<div class="body-container" style="width:1500px; padding-left: 20px; padding-top: 50px;">
<div style="font-size: 40px; width: 1500px;font-weight: bold; color: #666666;">클래스등록회원 리스트</div>
<div style="font-size: 16px; width: 1500px; color: tomato; margin-top: 10px;">총 회원수 : ${dataCount}명
<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/member/regi';" style="float: right;">새로고침</button></div>
<table style="width: 1500px; margin: 20px auto 0; border-collapse: collapse; border-spacing: 0">
	<tr height="45" align="center" style="font-weight: bold; background: #999999; color:#ffffff;">
		<td width="40">번호</td>
		<td width="160">클래스명</td>
		<td width="120">시작날짜</td>
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
			<td width="40">${dto.listNum}</td>
			<td width="160">${dto.className}</td>
			<td width="120">${dto.startDate}</td>
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
		          <form name="searchRegiForm" method="post" action="<%=cp%>/admin/member/regi" >
		              <select name="searchKey" class="selectField" onchange="changes(document.searchRegiForm.searchKey.value)">
		                  <option value="userId">아이디</option>
		                  <option value="userName">이름</option>
		                  <option value="className">클래스명</option>
		            </select>
		            <select name="searchValue" id="classNameValue" class="selectField" style="display: none;">
		            <c:forEach var="dDto" items="${dList}">
		              <option value="${dDto.classNum}">${dDto.className}</option>
	                 </c:forEach>
        	 		</select>
		            <input type="text" name="searchValue" class="boxTF">
		            <button type="button" class="btn02" onclick="searchList2()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
</div>