<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

        <table style="border: 1px solid #eee;  width: 98%; margin: 5px auto 5px;">
			<tr height="31">
				<td style=" width:15%; border: 1px solid #eeeeee;margin-left: 5px; background:#F2F2F2; ">보낸사람</td>
				<td style=" width:35%; border: 1px solid #eee;">${dto.userId2}</td>
				<td style=" width:15%; border: 1px solid #eeeeee;margin-left: 5px; background:#F2F2F2;">보낸시간</td>
				<td style=" width:35%; border: 1px solid #eee;">${dto.sCreated}</td>
			</tr>
			<tr height="31">
			    <td style="border: 1px solid #eee; margin-left: 5px; width:15%; background:#F2F2F2;">받는사람</td>
				<td colspan="3" style="border: 1px solid #eee;">${dto.userId}</td>	
			</tr>

		</table>
	
		<table  style=" width: 98%; margin: 5px auto 5px; border: 1px solid;">
			<tr style="border: 1px solid; height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px " >
				<td  width="100%" background="#F2F2F2" >${dto.subject}</td>
			</tr>
			<tr style="border: 1px solid; height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px " >
				<td  width="100%" ><textarea style="width: 100%;height: 200px;">${dto.content}</textarea></td>
			</tr>
			<tr style="border: 1px solid; height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px " >
				<td  width="100%" background="#F2F2F2" >첨부파일 총(${fileCount}개)</td>
			</tr>
			
			<tr style=" width: 100%; height: 70px" >
				<td  width="100%">
					<c:forEach var="vo" items="${listFile}">
					<a>${vo.oFileName}</a>(${vo.fileSize}KB)<br>
					</c:forEach>
				</td>
			</tr>
			
		</table>


		<table style=" width: 98%; margin: 5px auto 5px;">
			<tr style="height: 31px; width: 100%; margin-top: 10px; margin-bottom: 10px;text-align: center;">
				<td  style="width: 100%;">
					<img src="<%=cp%>/resource/images/btn_reply.png">
					<img src="<%=cp%>/resource/images/btn_forward.png">
					<img src="<%=cp%>/resource/images/btn_del02.png">
					<img src="<%=cp%>/resource/images/btn_ok02.png">
				</td>
			</tr>
		</table>
