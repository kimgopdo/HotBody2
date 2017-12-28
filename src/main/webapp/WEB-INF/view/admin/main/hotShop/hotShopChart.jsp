<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link class="include" rel="stylesheet" type="text/css" href="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.hotShop.css" />

<script type="text/javascript" src="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.js"></script>
<script type="text/javascript">
$(function(){
    //1번째 입력값 (그려진 영역의 id값)

    //2번째 입력값 (그래프내에 들어갈 데이터 값)

     $.jqplot ('graph', [[${m1},${m2},${m3},${m4},${m5},${m6},${m7},${m8},${m9},${m10},${m11},${m12}]]);
});
</script>
<div id="graph" style="width:80%; height:300px;"></div>