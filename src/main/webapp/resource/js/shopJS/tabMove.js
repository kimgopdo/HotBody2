// 탭 클릭 시 스크롤 이동
function fnMove(seq){
    var offset = $("#div" + seq).offset();
    $('html, body').animate({scrollTop : offset.top}, 1);
}