<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String cp=request.getContextPath();
%>
		<c:forEach var="dto" items="${listReply}">
			<tr height="35" style="background: white;">
				<td width="50%" style="padding: 5px 5px; border-bottom: 1px solid #cccccc; border-right: none;" align="left">
					<span><b>${dto.userName}(${dto.userId})</b></span>
				</td>
				<td width="50%" align="right" style="padding: 5px 5px; border-bottom: 1px solid #cccccc; border-left: none;">
					<span><b>${dto.created}</b></span>
					<c:if test="${sessionScope.member.userId == dto.userId || sessionScope.member.userId == 'admin'}">
						<a onclick="deleteReply('${dto.cNum}', '${page}')"> <span style="color: black;">삭제</span></a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" valign="top" style="padding:5px 5px; text-align: left;">
					${dto.content}
				</td>
			</tr>
		</c:forEach>
		
		<tr height="40">
			<td colspan="2" align="center">
				${paging}
			</td>
		</tr>