<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String cp=request.getContextPath();
%>
<style>
.aspect { width: 660px; height: 500px; }
</style>

<script type="text/javascript">
// 상품 수량 변경
var sum = ${dto.pdPrice}; // 상품 가격

function add(){//인자값 : 수량업 1  , 수량 다운 시 -1
	var cnt=$("#no1").val();
	var tot=sum*cnt;
	tot=numberWithCommas(tot);
	$("#cost").text(tot);
	$("#no2").text(cnt);
}

// 숫자 천 단위 마다 콤마 찍기
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function onlyNumber(){
       event.returnValue=false;
}
function check(){
	var uid="${sessionScope.member.userId}";
	if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	} else {
		location.href="<%=cp%>/hotShop/pQnA_created";
	}
}

$(function(){
	listPage(1);
	var tot=numberWithCommas("${dto.pdPrice}");
	var cnt = $("#no1").val();
	$("#cost").text(tot);
	$("#no2").text(cnt);
});

function listPage(page){
	var url = "<%=cp%>/hotShop/listQna";
	var num = "${dto.pdnum}";
	var q = "pdnum=" + num + "&page=" + page;

	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listQna").html(a);
			listPage2(1);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
				alert("실패");
				return;
			}
			console.log(e.responseText);
		}
	});
}


function listPage2(page){
	var url = "<%=cp%>/hotShop/listReview";
	var num = "${dto.pdnum}";
	var q = "pdnum=" + num + "&page=" + page;

	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listReview").html(a);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
				alert("실패");
				return;
			}
			console.log(e.responseText);
		}
	});
}



function insertCookie(pdnum){
	var no=$("#no1").val();
	var cVal=pdnum+"-"+no;
	addCookie(cVal);
}
</script>
<script>
function payment(pdnum){
	var no=$("#no1").val();
	var cVal=pdnum+"-"+no;
	addCookie(cVal);
	alert(getCookie("hotbodyBasket"));
	var array=getCookie("hotbodyBasket").split(",");
	var member="${sessionScope.member.userId}";
	if(member!=""){
		location.href="<%=cp%>/hotShop/payment?cookie="+array+"&userId="+member;
		return;
	}else{
		location.href="<%=cp%>/member/login?prePage=hotShop";
		return;
	}
}
</script>



<div class="container">
		<!-- 아티클 -->
		<div align="center" style="width: 100%; height: 1500px; padding: 20px; margin-top: 50px;">
		<div style="width: 100%; height: 620px; padding: 10px;">
			<!-- article 메인이미지 -->
			<div class="aspect" style="float: left; display: inline;">
				<a href="#">
					<img src="<%=cp%>/uploads/shopList/${dto.imgSaveFilename}" style=" width: 100%; height: 100%;">
				</a>
			</div>
			
			<!-- article 정보, 가격, 수량 --> 
			<div style="width: 35%; height:600px; float: right; display: inline;">
				<div style="width: 100%; max-height: 30%; margin-bottom: 80px;">
					<div style="margin-bottom: 10px;">
						<!-- 공백 포함 20글자(36 byte) -->
						<span style="font-weight: bold; font-size: 22px;">${dto.pdName}</span>
					</div>
					<div style="margin-bottom: 10px;">
						<!-- 공백 포함 282글자(514 byte) -->
						<span style="font-size: 12px;">${dto.pdSumContent}</span>
					</div>
				</div>
				
				<table style="width: 100%; height: 20%; font-size: 12px;">
					<tr>
						<th style="width: 90px;">배송정책</th>
						<td>${dto.pdDelRule}</td>
					</tr>
					<tr>
						<th>유통기한</th>
						<td>${dto.pdExDate}</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="hidden" id="pdPrice" value="${dto.pdPrice}"><span>${dto.pdPrice}</span>원</td>
					</tr>
					
					<tr>                                                 
						<th>수량</th>
						<td>
							<input type="number" value="1" id="no1" min="1" style="width: 35px;" onkeypress="onlyNumber();" onclick="add();">
						</td>
					</tr>
				</table>
				
				<hr style="border: solid 0.5px #BDBDBD; width: 100%">                      
				
				<!-- total 가격, 수량 -->
				<div style="width: 100%; height: 3%; margin-bottom: 22px;">
					<div style=" float: left;">
						<span style="font-weight: bold; font-size: 13px;">Total</span>
						<span  style="font-size: 12px;">(Quantity) : </span>
						<span style="font-weight: bold; font-size: 13px;" id="cost"> </span><span style="font-weight: bold; font-size: 13px;" id="cost">원</span>
						<span style="font-size: 12px;">(<span id="no2"></span>개)</span>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div style="width: 100%; height: 8.5%;">
					<div style="display: inline; float: left; margin-right: 10px;">
						<button type="button" class="" style="width: 60px; height: 50px; background: white; outline: none; border: 1px solid black;">
							<img src="<%=cp%>/uploads/shopList/heart.png" style="width: 70%; height: 70%;">
						</button>
					</div>
					<div style="display: inline; float: left; margin-right: 10px;">
						<button type="button" class="" style="width: 149px; height: 50px; background: white; outline: none; border: 1px solid black;" onclick="insertCookie(${dto.pdnum});">
							<span style="font-weight: bold; font-size: 18px;">Cart</span>
						</button>
					</div>
					<div style="display: inline; float: left;">
						<button type="button" class="" style="width: 149px; height: 50px; background: white; outline: none; border: 1px solid black;" onclick="payment(${dto.pdnum});">
							<span style="font-weight: bold; font-size: 18px;">Buy</span>
						</button>
					</div>
				</div>
			</div>	
		</div>
		
<hr style="border: solid 0.5px #BDBDBD; width: 100%; margin-bottom: 50px;">

	<!-- 상품설명 -->
	<div style="width: 100%">
		<!-- 상품설명 탭, 사진(설명) -->
		<div style="width: 100%; margin-bottom: 200px; min-height: 100px;" id="div1">
			<!-- 탭 -->
			<ul style="width: 100%; height:50px; border: 0.5px solid #BDBDBD; padding: 0px; margin-bottom: 30px;">
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px; border-right: 0.5px solid #BDBDBD; 
					border-left: 0.5px solid #BDBDBD; border-bottom: 0.5px solid #BDBDBD; background-color: #EAEAEA;" onclick="fnMove('1')">
					<span style="font-size: 13px; font-weight: bold;">상품설명</span>
				</li>
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px; border-right: 0.5px solid #BDBDBD;" onclick="fnMove('2')">
					<span style="font-size: 13px;">상품상세</span>
				</li>
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px;" onclick="fnMove('3')">
					<span style="font-size: 13px;">Q&A 및 상품후기</span>
				</li>
			</ul>
			
			<!-- 사진(설명) -->
			<div style="width: 95%;">
			${dto.content}
			</div>
		</div>
		
		<!-- 상품상세 탭 -->
		<div style="min-width: 100%; margin-bottom: 200px; min-height: 900px;" id="div2">
			<!-- 탭 -->
			<ul style="width: 100%; height:50px; border: 0.5px solid #BDBDBD; padding: 0px; margin-bottom: 30px;">
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px;" onclick="fnMove('1')">
					<span style="font-size: 13px;">상품설명</span>
				</li>
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px; border-right: 0.5px solid #BDBDBD; 
					border-left: 0.5px solid #BDBDBD; border-bottom: 0.5px solid #BDBDBD; background-color: #EAEAEA;" onclick="fnMove('2')">
					<span style="font-size: 13px; font-weight: bold;">상품상세</span>
				</li>
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px;" onclick="fnMove('3')">
					<span style="font-size: 13px;">Q&A 및 상품후기</span>
				</li>
			</ul>
			
			<!-- 상품상세 -->
			<div align="center" style="width: 70%; text-align: left;">
				<span style="font-weight: bold; font-size: 14px;">영양성분표시: &nbsp;&nbsp;</span>${dto.pdNutrient}<br><br>
				<span style="font-weight: bold; font-size: 14px;">보관방법: &nbsp;&nbsp;</span>${dto.pdStMethod}<br><br>
				<span style="font-weight: bold; font-size: 14px;">유통기한: &nbsp;&nbsp;</span>${dto.pdExDate}<br><br>
				<span style="font-weight: bold; font-size: 14px;">식품유형: &nbsp;&nbsp;</span>${dto.pdType}<br><br>
				<span style="font-weight: bold; font-size: 14px;">생산지: &nbsp;&nbsp;</span>${dto.pdArea}<br><br>
				<span style="font-weight: bold; font-size: 14px;">제품원재료명: &nbsp;&nbsp;</span>${dto.pdRawName}<br><br>
				<img src="<%=cp%>/uploads/shopList/delivery_guide.PNG">
			</div>               
		</div>
		
		<!-- 상품후기 탭 -->
		<div style="width: 100%; margin-bottom: 200px; min-height: 900px;" id="div3">
			<!-- 탭 -->
			<ul style="width: 100%; height:50px; border: 0.5px solid #BDBDBD; padding: 0px; margin-bottom: 30px;">
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px; border-right: 0.5px solid #BDBDBD;" onclick="fnMove('1')">
					<span style="font-size: 13px;">상품설명</span>
				</li>
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px; border-right: 0.5px solid #BDBDBD;" onclick="fnMove('2')">
					<span style="font-size: 13px;">상품상세</span>
				</li>
				<li style="list-style:none; float: left; width: 366px; height:49.5px; padding-top:13px; border-bottom: 0.5px solid #BDBDBD; 
					background-color: #EAEAEA;" onclick="fnMove('3')">
					<span style="font-size: 13px; font-weight: bold;">Q&A 및 상품후기</span>
				</li>
			</ul>
			
			<!-- 상품Q&A 게시판 리스트 -->
			<div id="listQna"></div>
			<br>
			<div id="listReview"></div>
			
		</div>
		</div>
     </div>
</div>
