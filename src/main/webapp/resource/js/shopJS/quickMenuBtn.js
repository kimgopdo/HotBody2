function quickMenu(){
		if($("#quickMenu").attr("class")!="is-active"){
			$("#quickMenu").css("z-index", "9");
			$("#quickMenu").fadeIn(1000);		
			$("#quickMenu").addClass("is-active");
		}else if($("#quickMenu").attr("class")!="pull-right is-active"){
			$("#quickMenu").removeClass("pull-right is-active");
			$("#quickMenu").addClass("pull-right");
			$("#quickMenu").fadeOut(1000);
			$("#quickMenu").css("z-index", "0");
		}
	};  