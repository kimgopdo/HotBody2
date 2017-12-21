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
					<td align="right" colspan="3">
						<button type="button" class="btn" style="color:black; background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px;" onclick="javascript:location.href='<%=cp%>/hotShop/review_list?${query}';">전체리스트</button>
					</td>
				</tr>
				<tr style="border: 1px solid #F6F6F6; background: white; font-weight: bold; font-size: 13px; border-bottom: 1px solid #d5d5d5;" align="center" height="40px">
					<!-- <td width="20"><input type="checkbox" name="chkAll" id="chkAll"></td> -->
					<td width="60">번호</td>
					<td width="380" style="padding-left: 20px;">제목</td>
					<td width="80">작성자</td>
					<td width="80">작성일</td>
					<td width="80">별점</td>
				</tr>
				
				<c:forEach var="dto" items="${list2}">
				<tr style="border: 1px solid #F6F6F6; background: white; font-size: 13px;" align="center" height="30px">
					<%-- <td><input type="checkbox" name="nums" value="${dto.reviewCode}"></td> --%>
					<td>${dto.listNum}</td>
					<td align="left" style="padding-left: 5px; color: black;">
						<a href="${articleUrl2}&reviewCode=${dto.reviewCode}" style="color: gray; font-size: 13px;"><span style="font-weight: bold;">[${dto.pdName}]</span> ${dto.reviewSubject} (${dto.replyCount})</a>
					</td>
					<td>${dto.userName}</td>
					<td>${dto.reviewCreated}</td>
					<c:if test="${dto.starScore=='1'}">
					<td><img src="<%=cp%>/uploads/shopStar/star_1.PNG" style="width: 120px; height: 30px;"></td>
					</c:if>
					<c:if test="${dto.starScore=='2'}">
					<td><img src="<%=cp%>/uploads/shopStar/star_2.PNG" style="width: 120px; height: 30px;"></td>
					</c:if>
					<c:if test="${dto.starScore=='3'}">
					<td><img src="<%=cp%>/uploads/shopStar/star_3.PNG" style="width: 120px; height: 30px;"></td>
					</c:if>
					<c:if test="${dto.starScore=='4'}">
					<td><img src="<%=cp%>/uploads/shopStar/star_4.PNG" style="width: 120px; height: 30px;"></td>
					</c:if>
					<c:if test="${dto.starScore=='5'}">
					<td><img src="<%=cp%>/uploads/shopStar/star_5.PNG" style="width: 120px; height: 30px;"></td>
					</c:if>
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