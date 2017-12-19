<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String cp=request.getContextPath();
%>


<c:if test="${cNum != 0}">
	<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0;">
		<tr height="35">
			<td colspan="2">
				<span>[댓글 목록, ${page}/${total_page} 페이지]</span>
			</td>
		</tr>

		<c:forEach var="dto" items="${listReply}">
			<tr height="35" style="background: #eeeeee;">
				<td width="50%" style="padding: 5px 5px; border: 1px solid #cccccc; border-right: none;">
					<span><b>${dto.userName}</b></span>
				</td>
				<td width="50%" align="right" style="padding: 5px 5px; border: 1px solid #cccccc; border-left: none;">
					<span><b>${dto.created}</b></span>
					<c:if test="${sessionScope.member.userId == dto.userId || sessionScope.member.userId == 'admin'}">
						<a onclick="deleteReply('${dto.cNum}', '${page}')"> 삭제</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" valign="top" style="padding: 5px 5px;">
					${dto.content}
				</td>
			</tr>
		</c:forEach>
		
		<tr height="40">
			<td colspan="2" align="center">
				${paging}
			</td>
		</tr>
	</table>
</c:if>