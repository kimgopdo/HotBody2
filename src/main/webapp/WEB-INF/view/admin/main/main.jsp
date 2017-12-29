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
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
      </div>
    </div>
    
</div>