<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="body-container" style="width: 1000px; padding-left: 20px; padding-top: 50px;">
<div style="height: 50px;"></div>
	<div style="font-size: 40px; width: 1000px;font-weight: bold; color: #666666;">온라인클래스 리스트</div>
	<table style="width: 800px; margin: 20px 0; border-collapse: collapse; border-spacing: 0">
		<tr height="35" style="background: #666666; color: #ffffff;" align="center">
			<th>클래스명</th>
			<th width="100">멘토</th>
			<th width="200"></th>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr height="120" align="center" style="margin: 5px 0; border-bottom: 1px solid #e6e6e6;">
				<td>${dto.className}</td>
				<td width="100">${dto.mento}</td>
				<td width="200">
					<button type="button" class="btn02" onclick="javascript:location.href='<%=cp%>/admin/mission/article?num=${dto.classNum}';">미션 등록하기</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
