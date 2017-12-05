<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String cp=request.getContextPath();
%>


<script type="text/javascript">
// 상품 수량 변경
var sum = 5000; // 상품 가격
var no = 1;

function add(num){
   if(num == -1){
      if(no == 1){
         return;
      }
      no--;
      sum = sum - 5000;
   }else if(num == 1){
      no++;
      sum = sum + 5000;
   }
   var tno1 = document.getElementById("no1");
   var tno2 = document.getElementById("no2");
   var sumCost = document.getElementById("cost");
   
   tno1.value = no;
   tno2.innerHTML = no;
   sumCost.innerHTML = numberWithCommas(sum);
}

// 숫자 천 단위 마다 콤마 찍기
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>



<div class="container">
		<!-- 아티클 -->
		<div align="center" style="width: 100%; height: 1500px; padding: 20px; margin-top: 50px;">
		<div style="width: 100%; height: 620px; padding: 10px;">
			<!-- article 메인이미지 -->
			<div style="width: 63%; height:515px; float: left; display: inline;">
				<a href="#">
					<img src="<%=cp%>/resource/shop_images/chicken.PNG" style=" width: 100%; height: 100%;">
				</a>
			</div>
			
			<!-- article 정보, 가격, 수량 --> 
			<div style="width: 35%; height:600px; float: right; display: inline;">
				<div style="width: 100%; max-height: 30%; margin-bottom: 80px;">
					<div style="margin-bottom: 10px;">
						<!-- 공백 포함 20글자(36 byte) -->
						<span style="font-weight: bold; font-size: 22px;">맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐</span>
					</div>
					<div style="margin-bottom: 10px;">
						<!-- 공백 포함 282글자(514 byte) -->
						<span style="font-size: 12px;">라닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드맛있는 닭찌라라러드맛있는 닭찌찌 샐러드맛있는 닭찌찌 샐러드</span>
					</div>
					<div style="margin-bottom: 10px;">
						<!-- 공백 포함 25글자(50 byte) -->
						<span style="font-weight: bold; font-size: 15px;">오호라라라라라라라오호라라라라라라라오호라라라라하</span>
					</div>
				</div>
				
				<table style="width: 100%; height: 20%; font-size: 12px;">
					<tr>
						<th style="width: 90px;">배송정책</th>
						<td>123123</td>
					</tr>
					<tr>
						<th>유통기한</th>
						<td>123123</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><span></span>원</td>
					</tr>
					
					<tr>
						<th>수량</th>
						<td>
							<button type="button" onclick="add(-1)"  style="background: white; border: none; padding: 0px; outline: none;">▼&nbsp;</button>
							<input type="text" value="1" id="no1" readonly="readonly" style="width: 25px;">
							<button type="button" onclick="add(1)"style="background: white; border: none; padding: 0px; outline: none;">&nbsp;▲</button>
						</td>
					</tr>
				</table>
				
				<hr style="border: solid 0.5px #BDBDBD; width: 100%">
				
				<!-- total 가격, 수량 -->
				<div style="width: 100%; height: 3%; margin-bottom: 22px;">
					<div style=" float: left;">
						<span style="font-weight: bold; font-size: 13px;">Total</span>
						<span  style="font-size: 12px;">(Quantity) : </span>
						<span style="font-weight: bold; font-size: 13px;"><span id="cost"></span>원</span>
						<span style="font-size: 12px;">(<span id="no2"></span>개)</span>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div style="width: 100%; height: 8.5%;">
					<div style="display: inline; float: left; margin-right: 10px;">
						<button type="button" class="" style="width: 60px; height: 50px; background: white; outline: none; border: 1px solid black;">
							<img src="<%=cp%>/resource/shop_images/heart.PNG" style="width: 70%; height: 70%;">
						</button>
					</div>
					<div style="display: inline; float: left; margin-right: 10px;">
						<button type="button" class="" style="width: 149px; height: 50px; background: white; outline: none; border: 1px solid black;">
							<span style="font-weight: bold; font-size: 18px;">Cart</span>
						</button>
					</div>
					<div style="display: inline; float: left;">
						<button type="button" class="" style="width: 149px; height: 50px; background: white; outline: none; border: 1px solid black;">
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
		<div style="width: 100%; margin-bottom: 200px; min-height: 3000px;" id="div1">
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
					<span style="font-size: 13px;">상품후기</span>
				</li>
			</ul>
			
			<!-- 사진(설명) -->
			<div style="width: 95%;">
				<img src="<%=cp%>/resource/shop_images/chicken.PNG" style=" width: 100%; height: 100%;">
				<img src="<%=cp%>/resource/shop_images/chicken.PNG" style=" width: 100%; height: 100%;">
			</div>
		</div>
		
		<!-- 상품상세 탭 -->
		<div style="width: 100%; margin-bottom: 200px; min-height: 900px;" id="div2">
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
					<span style="font-size: 13px;">상품후기</span>
				</li>
			</ul>
			
			<!-- 상품상세 -->
			<div style="width: 95%;">
				<img src="<%=cp%>/resource/shop_images/chicken.PNG" style=" width: 100%; height: 100%;">
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
					<span style="font-size: 13px; font-weight: bold;">상품후기</span>
				</li>
			</ul>
			
			<!-- 상품후기 게시판 리스트 -->
			<div style="width: 95%;">
				<img src="<%=cp%>/resource/shop_images/chicken.PNG" style=" width: 100%; height: 100%;">
			</div>
		</div>

	</div>
	
     </div>
     </div>
