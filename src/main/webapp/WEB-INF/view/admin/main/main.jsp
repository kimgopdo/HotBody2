<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

  <!-- Navigation-->

  <div class="body-container" style="width:1100px; padding-left: 20px; padding-top: 50px;">
  	<div class="card mb-3" style="width: 500px; float: left;">
        <div class="card-header">
          <i class="fa fa-area-chart"></i> Total </div>
        <div class="card-body" style="font-size: 25px;">${total}</div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>
    <div class="card mb-3" style="width: 500px; float: left; margin-left: 20px;">
        <div class="card-header">
          <i class="fa fa-area-chart"></i> Today </div>
        <div class="card-body" style="font-size: 25px;">${today}</div>
        <div class="card-footer small text-muted">Updated ${date}</div>
    </div>
    
    <div class="row" style="clear: both; width: 1000px;">
      <div class="col-lg-8">
        <!-- Example Bar Chart Card-->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fa fa-bar-chart"></i> Bar Chart Example</div>
          <div class="card-body">
          	

<script type="text/javascript" src="<%=cp%>/resource/mainboot/js/jquery.jqplot.min.js"></script>
<script type="text/javascript">
$(function(){
	Chart("2017");
	ChartProduct("2019");
});
function Chart(year){
	if(year=="2017"){
		$("#eeeeesss").html("<div id='graph' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph', [[480,520,200,220,600,550,570,400,450,600,620,300]]);
	}else if(year=="2018"){
		$("#eeeeesss").html("<div id='graph' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph', [[200,400,200,220,600,550,570,400,352,600,620,300]]);
	}else if(year=="2019"){
		$("#eeeeesss").html("<div id='graph' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph', [[200,150,200,400,600,300,400,400,222,551,300,350]]);
	}else if(year=="2020"){
		$("#eeeeesss").html("<div id='graph' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph', [[400,400,255,300,650,550,570,400,352,223,221,111]]);
	}else if(year=="2021"){
		$("#eeeeesss").html("<div id='graph' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph', [[233,300,250,100,50,100,300,200,135,98,42,200]]);
	}
}
function ChartProduct(year){
	if(year=="2017"){
		$("#eeeeesss2").html("<div id='graph2' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph2', [[480,520,200,220,233,550,570,400,450,600,620,300]]);
	}else if(year=="2018"){
		$("#eeeeesss2").html("<div id='graph2' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph2', [[200,400,200,220,600,550,570,400,352,255,620,300]]);
	}else if(year=="2019"){
		$("#eeeeesss2").html("<div id='graph2' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph2', [[200,150,200,400,600,300,400,400,222,551,300,350]]);
	}else if(year=="2020"){
		$("#eeeeesss2").html("<div id='graph2' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph2', [[400,400,255,300,650,550,570,400,352,223,221,111]]);
	}else if(year=="2021"){
		$("#eeeeesss2").html("<div id='graph2' style='width:80%; height:300px;'></div>")
		$.jqplot ('graph2', [[233,300,250,100,50,100,300,200,135,98,42,200]]);
	}
}

function ChartProduc(){
	var year=$("#productName option:selected").attr('data-year');
	ChartProduct(year);
}




















</script>
<span style="font-size: 20px; font-weight: bold;">총 실 매출</span><br>
<button type="button" class="btn" style="background: #e7e7e7;" onclick="Chart('2017');">2017년</button>
<button type="button" class="btn" style="background: #e7e7e7;" onclick="Chart('2018');">2018년</button>
<button type="button" class="btn" style="background: #e7e7e7;" onclick="Chart('2019');">2019년</button>
<button type="button" class="btn" style="background: #e7e7e7;" onclick="Chart('2020');">2020년</button>
<button type="button" class="btn" style="background: #e7e7e7;" onclick="Chart('2021');">2021년</button><br>
<span>(단위: 10만)</span>
<div id="eeeeesss"></div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
      </div>
    </div>
    
</div>