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
var no = 1;

function add(num){
   if(num == -1){
      if(no == 1){
         return;
      }
      no--;
      sum = sum - sum;
   }else if(num == 1){
      no++;
      sum = sum + sum;
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

function check(){
	var uid="${sessionScope.member.userId}";
	if(! uid){
		modalFormLogin();
		return;
	} else {
		location.href="<%=cp%>/hotShop/pQnA_created";
	}
}

$(function(){
	listPage(1);
});

function listPage(page){
	var url = "<%=cp%>/hotShop/listQna";
	var num = "${dto.pdnum}";
	var q = "pdnum=" + pdnum + "&page=" + page;

	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listQna").html(a);
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
						<td><span>${dto.pdPrice}</span>원</td>
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
							<img src="<%=cp%>/uploads/shopList/heart.png" style="width: 70%; height: 70%;">
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
			
			<!-- 상품후기 게시판 리스트 -->
			<div style="width: 95%;" id="listQna">
				<form name="deleteListForm" method="post">
					<table style="width: 100%; margin: 5px auto 0px; border-collapse: collapse;">
						<tr style="border: 1px solid #F6F6F6; background: white; font-weight: bold; font-size: 13px; border-bottom: 1px solid #d5d5d5;" align="center" height="40px">
							<!-- <td width="20"><input type="checkbox" name="chkAll" id="chkAll"></td> -->
							<td width="60">번호</td>
							<td width="380" style="padding-left: 20px;">제목</td>
							<td width="80">작성자</td>
							<td width="80">작성일</td>
						</tr>
						
						<c:forEach var="dto" items="${list}">
						<tr style="border: 1px solid #F6F6F6; background: white; font-size: 13px;" align="center" height="30px">
							<%-- <td><input type="checkbox" name="nums" value="${dto.pdQCode}"></td> --%>
							<td>${dto.listNum}</td>
							<td align="left" style="padding-left: 5px; color: black;">
							    <c:if test="${dto.answerNum!=0}">&nbsp;&nbsp;└ </c:if>
								<a href="${articleUrl}&pdQCode=${dto.pdQCode}" style="color: gray; font-size: 13px;">${dto.pdQSubject}</a>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.pdQCreated}</td>
						</tr>
						</c:forEach>
					</table>
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="rows" value="${rows}">
				</form>
				<form action="" id="pages">
					<table style="width: 100%; margin-top: 10px; border-collapse: collapse;">
						<tr style="font-size: 12px; border-top: 1px solid #d5d5d5;" align="center">
							<td style="padding-top: 10px;">${paging}</td>
						</tr>
					</table>
				</form>
				<table>
					<tr>
						<td style="width: 1050px; float: right; padding-right: 10px;" align="right">
							<button type="button" class="btn" style="color:black; background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px;" onclick="javascript:location.href='<%=cp%>/hotShop/pQnA_list?${query}';">리스트</button>
							<button class="btn" style="color:black; background: white; border: 1px solid #BDBDBD; border-radius: 3px; height: 30px;" type="button" onclick="check();">Q&A 등록</button>
						</td>
					</tr>
				</table>0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
			</div>
			
		</div>
		</div>
     </div>
</div>
