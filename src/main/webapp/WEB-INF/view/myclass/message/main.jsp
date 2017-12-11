<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<style>
.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}
</style>


<script type="text/javascript">
$(function(){
	$("#tab-notice").addClass("active");
	listPage(1);

	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		listPage(1);
	});
});

// 글리스트 및 페이징 처리
function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/customer/"+tab+"/list";
	
	var query="pageNo="+page;
	var search=$('form[name=customerSearchForm]').serialize();
	query=query+"&"+search;
	
	ajaxHTML(url, "get", query);
}

// 글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}
			$("#tab-content").html(data);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	  	,error : function(jqXHR) {
	        if (jqXHR.status == 401) {
	        	 console.log(jqXHR);
	        } else if (jqXHR.status == 403) {
	            location.href="<%=cp%>/member/login";
	        } else {
	        	 console.log(jqXHR.responseText);
	        }
	    }
	});
}

</script>

<div class="body-container" style="width: 1000px; margin-top: 100px;"> 
    <div>
            <div style="clear: both;">
	           <ul class="tabs">
			       <li id="tab-notice" data-tab="notice"><a href=""></a>쪽지보내기</li>
			       <li id="tab-inquiry" data-tab="inquiry">받은쪽지함</li>
			       <li id="tab-board" data-tab="board">보낸쪽지함</li>
			   </ul>
		   </div>
		   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
    </div>
</div>

<form name="customerSearchForm" action="" method="post">
    <input type="hidden" name="searchKey" value="subject">
    <input type="hidden" name="searchValue" value="">
</form>

