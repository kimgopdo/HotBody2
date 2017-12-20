<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
			<table style="width: 95%; margin: 5px auto 0px; border-collapse: collapse;">
				<tr style="width: 100%">
					<td align="left" colspan="2">
						<h4 style="font-weight: bold;"> ■ 상품후기</h4>
					</td>
					<td align="right" colspan="2">
						<button type="button" class="btn" style="color:black; background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px;" onclick="javascript:location.href='<%=cp%>/hotShop/review_list?${query}';">전체리스트</button>
					</td>
				</tr>
				<tr style="border: 1px solid #F6F6F6; background: white; font-weight: bold; font-size: 13px; border-bottom: 1px solid #d5d5d5;" align="center" height="40px">
					<!-- <td width="20"><input type="checkbox" name="chkAll" id="chkAll"></td> -->
					<td width="60">번호</td>
					<td width="380" style="padding-left: 20px;">제목</td>
					<td width="80">작성자</td>
					<td width="80">작성일</td>
					<td width="80">평점</td>
				</tr>
				
				<c:forEach var="dto1" items="${list2}">
				<tr style="border: 1px solid #F6F6F6; background: white; font-size: 13px;" align="center" height="30px">
					<%-- <td><input type="checkbox" name="nums" value="${dto.reviewCode}"></td> --%>
					<td>${dto1.listNum}</td>
					<td align="left" style="padding-left: 5px; color: black;">
						<a href="${articleUrl2}&reviewCode=${dto1.reviewCode}" style="color: gray; font-size: 13px;"><span style="font-weight: bold;">[${dto1.pdName}]</span> ${dto1.reviewSubject} (${dto1.replyCount})</a>
					</td>
					<td>${dto1.userName}</td>
					<td>${dto1.reviewCreated}</td>
					<td>${dto1.starScore}</td>
				</tr>
				</c:forEach>
			</table>
			<input type="hidden" name="page" value="${page2}">
			<input type="hidden" name="rows" value="${rows2}">
		
		<table style="width: 100%; margin-top: 10px; border-collapse: collapse;">
			<tr style="font-size: 12px; border-top: 1px solid #d5d5d5;" align="center">
				<td style="padding-top: 10px; cursor: pointer;">${paging2}</td>
			</tr>
		</table>