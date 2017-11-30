
$(".slider ol li").on("click", function() {
    $(this).addClass("active").siblings("li").removeClass("active");
    $(".slider ul").animate({
        top: -$(".slider").height() * $(this).index()
    }, 500);
});
// 개별적으로 Wheel 이벤트 적용
var n=1;//#li0~4 체크
$(".slider").on("mousewheel DOMMouseScroll", function (e) {
	$(".slider").delay(3000);
     e.preventDefault();
     var delta = 0;
     if (!event) event = window.event;
     if (event.wheelDelta) {
         delta = event.wheelDelta / 120;
         if (window.opera) delta = -delta;
     } else if (event.detail) delta = -event.detail / 3;
     var moveTop = null;
     // 마우스휠을 위에서 아래로
     if(n>5)
    	 n=1;
     else if(n<1)
    	 n=5;
     if (delta < 0) {
         if ($(this).next() != undefined) {
        	 console.log("아래로");
        	 $("#li"+n).trigger("click", function(){
        		    $(this).addClass("active").siblings("li").removeClass("active");
        		    $(".slider ul").stop.animate({
        		        top: -$(".slider").height() * $(this).index()
        		    }, 1000);
        		});
        	 ++n;
         }
     // 마우스휠을 아래에서 위로
     } else {
         if ($(this).prev() != undefined) {
        	 console.log("위로");
        	 $("#li"+n).trigger("click", function(){
        		    $(this).addClass("active").siblings("li").removeClass("active");
        		    $(".slider ul").stop.animate({
        		        top: -$(".slider").height() * $(this).index()
        		    }, 1000);
        		});
        	 --n;
         }
     }
     console.log(n);
     
});
// Em An
// 8-2017
// https://codepen.io/collection/AGNJNB/