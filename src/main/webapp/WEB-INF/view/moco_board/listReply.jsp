<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>

<c:if test="${replyDataCount != 0}">
	<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0;">
		<tr height="35">
			<td colspan="2">
				<span style="color: #3ea9cd; font-weight: 700;"> 댓글 ${replyDataCount}개</span>
				<span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span>
			</td>
		</tr>

<c:forEach var="vo" items="${listReply}">
    <tr height='35' style='background: #eee;'>
       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
           <span><b>${vo.userId}</b></span>
        </td>
       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
           <span>${vo.FRCreated}</span> |
	<c:if test="${sessionScope.member.userId==vo.userId || sessionScope.member.userId=='admin'}">		   
          <a onclick='deleteReply('${vo.frCode}', '${pageNo}')"> 삭제	</a>
	</c:if>	
	   '	   
<c:if test="${sessionScope.member.userId!=vo.userId && sessionScope.member.userId!='admin'}">		   
          <a href='#'>신고</a>
</c:if>	

        </td>
    </tr>
    <tr>
        <td colspan='2' valign='top' style='padding:5px 5px;'>
              ${vo.moFBReply}
        </td>
    </tr>
      
</c:forEach>
</table>
</c:if>