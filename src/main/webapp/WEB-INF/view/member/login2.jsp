<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<link href="<%=cp%>/resource/css/login.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body .body-container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .body-container .half.bg {
	background-image : url("<%=cp%>/resource/images/login.png");
  	background-size: 700px;
  	background-position: center;
  	background-repeat: no-repeat;
}
</style>
<script type="text/javascript">

function loginOk() {
   var f = document.loginForm2;
   if(! f.userId.value){
      alert("아이디는 필수 입니다.");
      f.userId.focus();
      return;
   }
   
   if(! f.pwd.value){
      alert("패스워드는 필수입니다. ");
      f.pwd.focus();
      return;
   }
   	
    var query=$('form[name=loginForm2]').serialize();
    var url="<%=cp%>/member/login";
    $.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			var prePage=data.prePage;
			var message=data.message;
			if(state=="true") {
				location.href="<%=cp%>/";
			}else if(state=="fail"){
				$("#messagelayout").html("<span style='color : red;'>로그인 정보가 올바르지 않습니다.</span>");
			}
		}
	  	,error:function(e) {
	    	console.log(e.responseText);
	    } 
	});
}

</script>
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
</script>

<div class="body-container" style="width: 700px; margin: 100px auto;">
   <article class="half">
        <h1>H O T B O D Y</h1>
        <div class="tabs">
            <span class="tab signin active"><a href="#signin">Sign in</a></span>
        </div>
        <div class="content">
            <div class="signin-cont cont">
                <form name="loginForm2" method="post">
                    <input type="text" name="userId" id="userId" class="inpt" placeholder="아이디">
                       <input type="password" name="pwd" id="pwd" class="inpt" placeholder="비밀번호">
                                 <label for="pwd">비밀번호</label>
                       <div class="more" align="center" id="messagelayout" style="margin-top: 30px;">환영합니다 !</div>
                       <div class="submit-wrap" style="margin-top: 60px;">
                          <input type="button" value="로그인" class="submit" onclick="loginOk();">
                      </div>
              </form>
           </div>
     </div>
   </article>
   <div class="half bg" style="overflow: hidden;"></div>
</div>

