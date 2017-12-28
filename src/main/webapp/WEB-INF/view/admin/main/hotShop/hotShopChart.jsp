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
	Chart("");

     $.jqplot ('graph', [["${m1}","${m2}","${m3}","${m4}","${m5}","${m6}","${m7}","${m8}","${m9}","${m10}","${m11}","${m12}"]]);
});
function Chart(year){
	if(year==""){
		year="2017";
	}else{
		var data=year;
		$.ajax({
			type:"post"
			,data:data
			,dataType:"json"
			,success: function(e){
				$.jqplot ('graph', [[e.m1,e.m2,e.m3,e.m4,e.m5,e.m6,e.m7,e.m8,e.m9,e.m10,e.m11,e.m12]]);
			}
		});
	}
}
</script>
<div id="graph" style="width:80%; height:300px;"></div>