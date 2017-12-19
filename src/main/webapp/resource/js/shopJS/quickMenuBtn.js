function quickMenu(){
		if($("#quickMenu").attr("class")!="pull-right is-active"){//킬떄
			$("#quickMenu").css("z-index", "9");
			$("#quickMenu").fadeIn(1000);		
			$("#quickMenu").addClass("is-active");
		}else if($("#quickMenu").attr("class")=="pull-right is-active"){//끌때
			$("#quickMenu").removeClass("is-active");
			$("#quickMenu").fadeOut(1000);
			$("#quickMenu").css("z-index", "0");
		}
	};  