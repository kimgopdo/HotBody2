<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
.aspect {
	width: 200px;
	height: 240px;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #777;
}
</style>
<script type="text/javascript">
$(function(){
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
});
</script>

<script type="text/javascript">
function listReply(reviewCode){
	var url = "<%=cp%>/hotShop/review_listReply";
	var q = "reviewCode=" + reviewCode;
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listReply"+reviewCode).html(a);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
				alert("로그인 후 이용 가능합니다.");
				return;
			}
			console.log(e.responseText);
		}
	});
}

function deleteReview(reviewCode) {
	  var uid = "${sessionScope.member.userId}";
	  var page = "${page}";
	  var query = "page="+page+"&reviewCode="+reviewCode;
	  var url = "<%=cp%>/hotShop/review_delete?" + query;
	  
	  if(! uid){
		  alert("게시물을 삭제할 수 없습니다.");
		  modalFormLogin();
	  }
	  if(uid){
		  alert("게시물을 삭제하시겠습니까?");
		  location.href=url;
	  }
	}

function sendReply(reviewCode){
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		modalFormLogin();
		return;
	}
	
	var content=$.trim($("#replyContent"+reviewCode).val());
	if(! content){
		$("#replyContent"+reviewCode).focus();
		return;
	}
	
	var q="content="+encodeURIComponent(content);
	q+="&reviewCode="+reviewCode;
	
	var url="<%=cp%>/hotShop/review_insertReply";
	$.ajax({
		 type:"post"
         ,url:url
         ,data:q
         ,dataType:"json"
         ,success:function(data){
        	 
       		var uid="${sessionScope.member.userId}";
       		if(! uid) {
       			modalFormLogin();
       			return;
       		}
            $("#replyContent"+reviewCode).val("");
            listReply(reviewCode);
	        }
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status == 403) {
			var uid="${sessionScope.member.userId}";
			if(! uid) {
				modalFormLogin();
				return;
			}
			console.log(e.responseText);
			}
		}
	});
}

function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>

<body>

	<div id="container" style="width: 100%; height: 1100px;">
		<div style="width: 100%; height: 40px; margin-top: 220px; ">
			<div style="width: 50%; height: 30px; font-weight: bold;" align="left">
					REVIEW | 전체리뷰
					<button type="button" style="color: gray; margin-top: 3px; background: white; border: 1px solid #999999; border-radius: 3px; width: 60px; height: 30px;" onclick="javascript:location.href='<%=cp%>/hotShop/review_list';">리스트</button>
			</div>
		</div>
		<hr style="border: 0.5px solid #BDBDBD;">
		<div style="width: 100%; height: 45px; border: 1px solid #BDBDBD;">
			<div
				style="float: left; width: 60%; border-right: 1px solid #BDBDBD; height: 100%">
				<div
					style="float: left; width: 20%; font-size: 13px; padding-left: 20px; padding-right: 20px; padding-top: 12px;">카테고리별
					보기</div>
				<select
					style="float: left; font-size: 13px; height: 35px; width: 79%; margin-top: 4px; outline: none;">
					<option>카테고리를 선택해 주세요.</option>
					<option>음료</option>
					<option>간식</option>
					<option>식사</option>
					<option>드레싱</option>
					<option>보충제</option>
					<option>건강식</option>
				</select>
			</div>

			<div style="width: 20%; height: 100%; float: left;">
				<select
					style="float: left; font-size: 13px; height: 100%; width: 100%; border: none; font-size: 13px; outline: none;">
					<option>최신순</option>
					<option>별점순</option>
					<option>추천순</option>
				</select>
			</div>
            <form name="searchForm" action="<%=cp%>/hotShop/review_list" method="post">
			<div style="width: 20%; height: 100%; border-left: 1px solid #BDBDBD; float: left; padding-top: 1px;">
				<div style="width: 100%" align="left">
					<button type="button" class="glyphicon glyphicon-search" style="width:10%; padding-left: 15px; outline: none; background: none; border: none;" onclick="searchList();"></button> &nbsp;&nbsp;&nbsp; 
					<input type="hidden" name="searchKey">
					<input type="text" name="searchValue" style="width: 80%; height: 41px; border: none; outline: none;" placeholder=" 상품 이름 검색...">
				</div>
			</div>
			</form>
		</div>
		<c:forEach var="dto" items="${list}">
				<div id="content">
					<ul id="review"
						style="list-style: none; padding-left: 0px; width: 100%; height: 275px; border-bottom: 1px solid #BDBDBD; margin-bottom: 10px;">
						<li
							style="width: 100%; height: 290px; margin-top: 10px; padding-bottom: 10px;">
							<div
								style="float: left; width: 20%; height: 95%; margin-left: 5px; margin-right: 5px;">
								<div class="aspect">
									<img src="<%=cp%>/uploads/review/${dto.image}">
								</div>
							</div>
							<div
								style="width: 78%; height: 50%; border: 1px solid #BDBDBD; float: left; margin-bottom: 5px;">
								<div
									style="height: 20%; border-bottom: 1px solid #BDBDBD; padding-right: 5px;">
									<div style="padding-top: 3px; float: right; width: 3%; cursor: pointer; font-size: 11px;" onclick="deleteReview(${dto.reviewCode});">삭제</div>
									<div
										style="float: right; width: 9%; margin-left: 15px; margin-right: 15px;">${dto.reviewCreated}</div>
									<div style="width: 10%;">
										<span
											style="font-weight: bold; float: left; padding-left: 5px; padding-top: 3px;">${dto.pdName}</span>
									</div>
									<div style="float: right; font-weight: bold;">${dto.userName}(${dto.userId})</div>
									<div style="height: 100%; width: 15%; float: right;">별점
										받아오는 곳</div>
								</div>
								<div
									style="width: 100%; height: 74%; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
									<div
										style="vertical-align: top; text-align: left; font-size: 12px;">${dto.reviewContent}</div>
								</div>
							</div>
							<c:if test="${dto.cNum==0 && sessionScope.member.userId=='admin'}">
							<div
								style="width: 78%; height: 16%; border: 1px solid #BDBDBD; float: left;">
								<input type="text"
									style="width: 90%; height: 100%; border: none; outline: none; padding-left: 10px;"
									placeholder="댓글입력.." id="replyContent${dto.reviewCode}">
								<button type="button"
									style="font-weight: bold; color: #8C8C8C; margin-top: 3px; background: white; border: 1px solid #999999; border-radius: 3px; width: 70px; height: 30px; outline: none;"
									onclick="sendReply(${dto.reviewCode});">
									<span style="font-size: 13px;">댓글작성</span>
								</button>
							</div>
							</c:if>
							
							<c:if test="${dto.cNum!=0}">
							<div id="listReply${dto.reviewCode}" style="width: 78%; height: 32%; border: 1px solid #BDBDBD; float: left; margin-top: 5px; padding-top: 13px; font-size: 12px;">
								<div style="float: left; width: 80%; text-align: left; padding-left: 10px;">${dto.replyContent}</div>
								<div style="float: left; width: 10%; font-weight: bold; text-align: right; padding-right: 15px;">${dto.userName}</div>
								<div style="float: left; width: 10%; text-align: right; padding-right: 15px;">${dto.replyCreated}</div>
							</div>
							</c:if>

						</li>
					</ul>
				</div>
		</c:forEach>
		<table
			style="width: 100%; margin-top: 10px; border-collapse: collapse; margin-bottom: 100px;">
			<tr style="font-size: 12px;" align="center">
				<td style="padding-top: 10px;">${paging}</td>
			</tr>
		</table>
	</div>

</body>
