function quickMenu(){
		if($("#quickMenu").attr("class")!="is-active"){
			$("#quickMenu").css("z-index", "9");
			$("#quickMenu").fadeIn(1000);		
			$("#quickMenu").addClass("is-active");
		}else{
			$("#quickMenu").fadeOut(1000);
			$("#quickMenu").removeClass("is-active");
			$("#quickMenu").css("z-index", "0");
		}
	};  