$(window).on("load",function(){
	var win_height=window.innerHeight
	var left_div_width=document.getElementById("leftSide").offsetWidth;
	var quickMenu_btnSize=$(".quickMenuBtn").width();
	var basket_btnSize=$(".basketBtn").width();
	var left_top_length=(win_height/2)-(basket_btnSize/2);
	var left_left_length=left_div_width/2-basket_btnSize/2;
	$(".basketBtn").css("margin-top",left_top_length);
	$(".basketBtn").css("margin-left",left_left_length);
	$(".quickMenuBtn").css("margin-top",left_top_length);
	$(".quickMenuBtn").css("margin-right",left_left_length);
	$("#quickMenu_P").css("margin-top",left_top_length);
	});
$(window).resize(function(){
	var win_height=window.innerHeight
	var left_div_width=document.getElementById("leftSide").offsetWidth;
	var quickMenu_btnSize=$(".quickMenuBtn").width();
	var basket_btnSize=$(".basketBtn").width();
	var left_top_length=(win_height/2)-(basket_btnSize/2);
	var left_left_length=left_div_width/2-basket_btnSize/2;
	$(".basketBtn").css("margin-top",left_top_length);
	$(".basketBtn").css("margin-left",left_left_length);
	$(".quickMenuBtn").css("margin-top",left_top_length);
	$(".quickMenuBtn").css("margin-right",left_left_length);
	$("#quickMenu_P").css("margin-top",left_top_length);
	});