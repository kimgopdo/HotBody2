<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<c:if test="${replyCount != 0}">
	<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0;">
	<tr>
		<td>
			<div id="listReply${dto.reviewCode}" style="width: 78%; height: 32%; border: 1px solid #BDBDBD; float: left; margin-top: 5px; padding-top: 13px; font-size: 12px;">
				<div style="width: 5%; margin-left: 5px; padding-top: 1px; height: 100%; float: left;" align="center">
					<span style="font-weight: bold;">${dto.userName}</span>
				</div>
				<div style="width: 70%; padding-top: 5px; font-size: 12px; float: left; margin-left: 25px;" align="left">${dto.content}</div>
				<div style="width: 10%; padding-top: 5px; font-size: 12px; float: right; padding-right: 10px;">${dto.created}</div>
			</div>
		</td>
	</tr>
	</table>
</c:if>
