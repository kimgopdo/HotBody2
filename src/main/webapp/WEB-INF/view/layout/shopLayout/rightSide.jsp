<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 오른쪽 사이드 바 -->
   <div id="rightSide" style="width: 10%; height: 100%; float:right; top:0px; right:0; position: fixed; z-index: 10;">
      <div id="mainImge" style="width: 160px; height: 130px; margin-top: 100px; position: absolute;">
         <a href="#" style="color: black;height: 60px; padding: 1px;">
            <img src="<%=cp%>/resource/shop_images/HOTBODY_Logo.png"/>
         </a>
        </div>
        <ul class="btn_Side">
        	<li>
        		<button type="button" class="btn btn-default btn-lg quickMenuBtn" style="background: white; border: none; outline: none;" onclick="quickMenu();">
               		<span class="glyphicon glyphicon-align-justify"></span>
            	</button>
        	</li>
        	<li>
        		<form id='searchBar'>
					<input type='search' id='search' style="color: black; cursor: black;">
				</form>
        	</li>
        	<li>
        		<button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            		<span class="glyphicon glyphicon-log-in"></span>
         		</button>
        	</li>
        	<li>
        		<button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            	<span class="glyphicon glyphicon-user"></span>
         	</button>
        	</li>
        	<li>
        		<button type="button" class="btn btn-default btn-lg" style="background: white; border: none; outline: none;">
            	<span class="glyphicon glyphicon-circle-arrow-up"></span>
         	</button>
        	</li>
        </ul>
            
            
            

            
         	

            

   </div>