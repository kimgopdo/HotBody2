<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<c:if test="${replyCount != 0}">
	<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0;">

		<c:forEach var="dto" items="${listReply}">
			<div style="width: 78%; height: 15%; border: 1px solid #BDBDBD; margin-top: 10px; float: left; padding-left: 10px;">
				<div style="width: 5%; margin-left: 5px; padding-top: 19px; height: 100%; float: left;" align="center">
					<span style="font-weight: bold;">${dto.userName}<br>(${dto.userId})</span>
				</div>
				<div style="width: 75%; padding-top: 5px; font-size: 12px; float: left;">${dto.content}</div>
				<div style="width: 10%; padding-top: 5px; font-size: 12px; float: right; padding-right: 10px;">${dto.created}</div>
				<div style="width: 5%; padding-top: 5px; font-size: 12px; float: right; padding-right: 10px;" onclick=""><a href="#">삭제</a></div>
			</div>
		</c:forEach>
	</table>
</c:if>
