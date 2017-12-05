function modalSendLogin() {
	var f=document.loginForm;
	
	if(!f.userId.value) {
    	f.userId.focus();
    	return false;
    }	

    if(!f.userPwd.value) {
    	f.userPwd.focus();
    	return false;
    }
    
    var query=$('form[name=loginForm]').serialize();
    var url="<%=cp%>/member/login";
    $.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				location.href="<%=cp%>/hotShop/article";
			} else {
				alert("로그인 실패");
			}
		}
	  	,error : function(jqXHR) {
        	 console.log(jqXHR.responseText);
	    }
	});

}
