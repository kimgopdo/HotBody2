<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteQna() {
	<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	  var pdQCode = "${dto.pdQCode}";
	  var page = "${page}";
	  var query = "pdQCode="+pdQCode+"&page="+page;
	  var url = "<%=cp%>/hotShop/pQnA_delete?" + query;

	  if(confirm("게시물을 삭제 하시겠습니까?"))
	  	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	  alert("게시물을 삭제할 수 없습니다.");
	</c:if>
	}

	function updateQna() {
	<c:if test="${sessionScope.member.userId==dto.userId}">
	  var pdQCode = "${dto.pdQCode}";
	  var page = "${page}";
	  var query = "pdQCode="+pdQCode+"&page="+page;
	  var url = "<%=cp%>/hotShop/pQnA_update?" + query;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!=dto.userId}">
	 alert("게시물을 수정할 수 없습니다.");
	</c:if>
	}
	
	function answerQna() {
		<c:if test="${sessionScope.member.userId=='admin'}">
		  var pdQCode = "${dto.pdQCode}";
		  var page = "${page}";
		  var query = "pdQCode="+pdQCode+"&page="+page;
		  var url = "<%=cp%>/hotShop/pQnA_answer?" + query;

		  location.href=url;
	  </c:if>

     <c:if test="${sessionScope.member.userId!='admin'}">
			 alert("관리자만 답변이 가능합니다.");
	 </c:if>		  
	}

	function backPage(){
		history.back();
	}
	
</script>
</head>

<div class="body-container" style="width: 100%; min-height: 950px;">
    <div class="body-title" align="left">
        <h3><span style="font-family: Webdings">2</span> Q & A </h3>
    </div>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   <span style="font-weight: bold;">[${dto.pdName}]</span>${dto.pdQSubject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			      	작성자 : ${dto.userName}
			    </td>
   			    <td width="50%" align="right" style="padding-right: 5px;">
			      	작성일 : ${dto.pdQCreated}
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.pdQContent}

			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId==dto.userId}">				    
			          <button type="button" class="btn" style="background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px; color: black;" onclick="updateQna();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" style="background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px; color: black;" onclick="deleteQna();">삭제</button>
			       </c:if>
			    </td>
			
			 	<td align="right">
			 		<c:if test="${sessionScope.member.userId=='admin'}">
			        <button type="button" class="btn" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 30px; color: black;" onclick="answerQna()">답변</button>
			        </c:if>
			        <c:if test="${sessionScope.member.userId!='admin' || sessionScope.member.userId==dto.userId || sessionScope.member.userId!=dto.userId}">
			        <button type="button" class="btn" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 30px; color: black;" onclick="backPage()">뒤로가기</button>
			        </c:if>
			        <button type="button" class="btn" style="background: white; border: 1px solid #999999; border-radius: 3px; height: 30px; color: black;" onclick="javascript:location.href='<%=cp%>/hotShop/pQnA_list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
    
</div>
