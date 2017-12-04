$(function(){
	$(".menu").hover(function(){
		 $(".menuEx").animate({
			  height:'toggle'
			 ,opacity: "1"
		 },"100");
	});
	$("#quickMenu_P").hover(function(){
		 $("#quickMenu .menuEx").animate({
			  height:'toggle'
			 ,opacity: "1"
		 },"100");
	});
});