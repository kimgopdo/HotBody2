<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<table style="width: 100%; margin-top: 100px; border-collapse: collapse;">
	<tr style="border-bottom: 2px solid #e7e7e7;">
		<td width="100%" colspan="5"><h5 style="font-size: 20px; font-weight:bold; margin-left: 30px; margin-bottom:30px; text-align: left;">상품전체리스트</h5></td>
	</tr>
	<c:forEach  begin="0" end="5">
	<tr height="100px" style="border-bottom: 2px solid #e7e7e7;">
		<td width="20%">이미지자리</td>
		<td width="45%">제목내용자리</td>
		<td width="15%">작성날자리</td>
		<td width="10%">작성자이름자리</td>
		<td width="10%">별점자리</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5"> 
		<select style="margin-top:10px; padding: 4px;">
			<option>제목</option>
			<option>내용</option>
			<option>이름</option>
			<option>작성날짜</option>
		</select>
		<input type="text"> <button type="button">검색</button>
		</td>
	</tr>
</table>