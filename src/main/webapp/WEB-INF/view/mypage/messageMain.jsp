<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
ul.tabs {
    margin: 0px auto;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-bottom: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;

}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 248px;
    background: #FFFFFF;
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
 #container {
    width: 800px;
    margin: 0px auto 10px;
}

</style>

<script type="text/javascript">

$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});

</script>



</head>
<body>

<div style="height: 100px">
</div>

<div align="center">
<h3>MESSAGE</h3>
</div>


<div id="container"  style="clear: both; margin: 0px auto;">
    <ul class="tabs" style="border-bottom: none; margin: 0px auto;">
        <li class="active" rel="tab1">제목1</li>
        <li rel="tab2">제목2</li>
        <li rel="tab3">제목3</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">내용 - 첫번째탭 </div>
        <div id="tab2" class="tab_content">내용 - 두번째탭</div>
        <div id="tab3" class="tab_content">내용 - 세번째탭</div>
    </div>
</div>

	
</body>
</html>