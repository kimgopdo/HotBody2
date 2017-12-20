<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

	<div style="width: 95%;" id="listReview">
		<form name="deleteListForm" method="post">
			<table style="width: 100%; margin: 5px auto 0px; border-collapse: collapse;">
				<tr style="border: 1px solid #F6F6F6; background: white; font-weight: bold; font-size: 13px; border-bottom: 1px solid #d5d5d5;" align="center" height="40px">
					<!-- <td width="20"><input type="checkbox" name="chkAll" id="chkAll"></td> -->
					<td width="60">번호</td>
					<td width="380" style="padding-left: 20px;">제목</td>
					<td width="80">작성자</td>
					<td width="80">작성일</td>
				</tr>
				
				<c:forEach var="dto" items="${list}">
				<tr style="border: 1px solid #F6F6F6; background: white; font-size: 13px;" align="center" height="30px">
					<%-- <td><input type="checkbox" name="nums" value="${dto.reviewCode}"></td> --%>
					<td>${dto.listNum}</td>
					<td align="left" style="padding-left: 5px; color: black;">
						<a href="${articleUrl}&reviewCode=${dto.reviewCode}" style="color: gray; font-size: 13px;"><span style="font-weight: bold;">[${dto.pdName}]</span> ${dto.reviewSubject}</a>
					</td>
					<td>${dto.userName}</td>
					<td>${dto.reviewCreated}</td>
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
	</div>