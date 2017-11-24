$(".slider ol li").on("click", function() {
    $(this).addClass("active").siblings("li").removeClass("active");
    $(".slider ul").animate({
        top: -$(".slider").height() * $(this).index()
    }, 500);
});

// Em An
// 8-2017
// https://codepen.io/collection/AGNJNB/