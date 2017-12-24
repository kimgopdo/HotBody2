<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=cp%>/resource/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/plugins/jqplot.pieRenderer.min.js"></script>
<style type="text/css">
.graph{
	
}
</style>

<script type="text/javascript">
jQuery.fn.center = function() {
	this.css("position","absolute");
	this.css("top",Math.max(0,(($(window).height()- $(this).outerHeight())/2)-$(window).scrollTop())+"px");
	this.css("left",Math.max(0,(($(window).width()- $(this).outerWidth())/2)-$(window).scrollLeft()-230)+"px");
	return this;
}

$(function() {
	$(".graph").center();
});

$(function(){

    //1번째 입력값 (그려진 영역의 id값)
    //2번째 입력값 (그래프내에 들어갈 데이터 값)

   $.jqplot ('graph', [[['전문성', 50], ['의지', 22], ['시간적여유', 38], ['식습관', 30]]], 
        { 
          seriesDefaults: {
            //원형으로 렌더링
            renderer: $.jqplot.PieRenderer,
            //원형상단에 값보여주기(알아서 %형으로 변환)
            rendererOptions: {
              showDataLabels: true
            }
          },
          //우측 색상별 타이틀 출력
          legend: { show:true, location: 'e' }
        }
	);
});

</script>
<div class="body-container" style="width: 1100px; margin: 100px auto;">
<div style="width: 1100px; font-size: 30px; font-weight: bold;" align="center">회원님의 분석결과</div>
<div class="graph" id="graph" style="width:450px; height:450px; float: left;"></div>
<div style="width:450px; height:450px; float:right; border: 1px solid #666666;">

<span>bmi</span>
</div>
</div>