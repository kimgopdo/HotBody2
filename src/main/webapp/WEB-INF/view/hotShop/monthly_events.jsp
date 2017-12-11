<%@ page contentType="text/xml; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	String startdate=request.getParameter("startdate");
	String enddate=request.getParameter("enddate");
%>
<monthly>

	<c:forEach begin="0" end="5">
	<event>
		<id>1</id>
		<name>XML Events</name>
		<startdate><%=startdate%></startdate>
		<enddate><%=enddate%>2017-12-8</enddate>
		<starttime>오전 12:00</starttime>
		<endtime>2:00</endtime>
		<color>#ffb128</color>
		<url></url>
	</event>
	</c:forEach>

</monthly>
