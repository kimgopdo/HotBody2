
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function moveNew(str){
	name=encodeURI(menuname);
	location.href="<%=cp%>/hotShop/productList?created="+str;
	return;
}
function move(code,menuname,cl){
	name=encodeURI(menuname);
	location.href="<%=cp%>/hotShop/productList?code="+code+"&menuname="+menuname+"&cl="+cl;
	return;
}
function bciAppend(){
	var userId="${sessionScope.member.userId}";
	if(userId=='admin'){
	$("#productLike").html("<li><input type='text' id='bci'><button type='button' class='btn' onclick='bciSend()'>생성</button></li>");
	}
}
function sclAppend(){
	var userId="${sessionScope.member.userId}";
	if(userId=='admin'){
		$("#productNutrient").html("<li><input type='text' id='scl'><button type='button' class='btn' onclick='sclSend()'>생성</button></li>");
	}
}
function bciSend(){
	var bci=$("#bci").val();
	bci = encodeURI(bci);
	var q="bci="+bci;
	var url="<%=cp%>/hotShop/menuAppend"
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,async: false
		,success:function(b){
			location.href="<%=cp%>/hotShop";
			return;
		}
	})
	
}
function sclSend(){
	var scl=$("#scl").val();
	scl = encodeURI(scl);
	var q="scl="+scl;
	var url="<%=cp%>/hotShop/menuAppend"
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,async: false
		,success:function(b){
			location.href="<%=cp%>/hotShop";
			return;
		}
	})
	
}
function bciDelete(code){
	location.href="<%=cp%>/hotShop/menuDeleteBci?code="+code;
	return;
}
function sclDelete(code){
	location.href="<%=cp%>/hotShop/menuDeleteScl?code="+code;
	return;
}
</script>
   <!-- 내비 -->
   <div align="center" class="pull-right" style="width:100%; z-index: 9; margin-bottom: 100px;" id="div4"> 
     <a href="<%=cp%>/" style="color: black;height: 60px; padding: 1px; float:left;">
	     <img src="<%=cp%>/resource/images/shop_images/HOTBODY_Logo.png"/>
	 </a> 
      <nav class="navmenu center" style="background: white; height: 60px; margin: 0px auto; border: none;">
          <ul>
            <li>                      
            	<a href="<%=cp%>/hotShop/productList?created=newProduct">신상품</a>                       
            </li>
            <li class="sub-menu" data-role="listview">
            	<a href="#">상품유형별</a><c:if test="${sessionScope.member.userId=='admin'}"><button type="button" class="btn" onclick="bciAppend();">추가</button></c:if>
	            	<ul id="productLike" class="productLike">
	            		<li id="bciAppend"></li>
	            		
	            	</ul>                                           
            </li>
            <li class="sub-menu" data-role="listview">
            	<a href="#">영양소별</a><c:if test="${sessionScope.member.userId=='admin'}"><button type="button"  class="btn" onclick="sclAppend();">추가</button></c:if>
            	<ul id="productNutrient" class="productNutrient">
            		<li id="sclAppend">
            		</li>
            	</ul>
            </li>
            <li>
            	<a href="javascript:location.href='<%=cp%>/hotShop/shopReviews';">상품 전체 리스트</a>
            </li>
          </ul>
      </nav>
     </div>