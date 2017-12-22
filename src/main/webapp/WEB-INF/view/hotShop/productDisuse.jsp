<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<table style="width: 100%; margin-top: 130px;">
		<tr>
			<td align="left" style="font-weight: bold; font-size: 18px; width: 100%; mar">
				 ㅣ 상품 폐기 등록
			</td>
		</tr>
	</table>
<form method="post" name="disuseForm">
	<table style="border-collapse: collapse; margin-top: 20px; margin-bottom: 200px;">
		<tr style="width: 100%; height: 50px; text-align: center; font-size: 13px; font-weight: bold; border-bottom:" align="center">
			<td style="width: 3%; border-bottom: 2px solid black;">상품번호</td>
			<td style="width: 15%; border-bottom: 2px solid black;">상품명</td>
			<td style="width: 5%; border-bottom: 2px solid black;">원가</td>
			<td style="width: 8%; border-bottom: 2px solid black;">소비자가</td>
			<td style="width: 8%; border-bottom: 2px solid black;">재고</td>
			<td style="width: 8%; border-bottom: 2px solid black;">폐기수량입력</td>
			<td style="width: 10%; border-bottom: 2px solid black;">업체명</td>
			<td style="width: 10%; border-bottom: 2px solid black;">폐기일자</td>
			<td style="width: 20%; border-bottom: 2px solid black;">폐기사유</td>
			<td style="width: 5%; border-bottom: 2px solid black;"></td>
		</tr>

		<tr style="width: 100%; height: 100px; text-align: center; font-size: 12px; border-bottom: 2px solid black;" align="center">
			<td style="width: 10%;">${dto.pdnum}</td>
			<td style="width: 10%;">
				<select id="productName" name="pdnum" style="height: 35px; width: 100%; padding-left: 10px;padding-bottom: 5px;  border: 1px solid black; border-radius: 2px; outline: none; cursor: pointer;">
					<option selected="selected">■ 상품선택</option>
					<c:forEach var="dto" items="${productList}">
						<option value="${dto.pdnum}">${dto.pdName}</option>
					</c:forEach>
				</select>
			</td>
			<td>${dto.pdRawPrice}</td>
			<td>${dto.pdDisAmt}</td>
			<td>${dto.pdStCount}</td>
			<td>
				<input type="text" name="pdDisNum" id="pdDisNum" style="width: 30%; height: 25px; border: 1px solid black; border-radius: 2px; outline: none; padding-left: 2px;">
			</td>
			<td>업체명(일단 대기)</td>
			<td>${dto.pdDisDate}</td>
			<td><input type="text" name="pdDisReason" id="pdDisReason" placeholder="폐기사유 입력.." style="width: 85%; height: 25px; outline: none; border-radius: 2px; border: 1px solid black; padding-left: 2px;"></td>
			<td>
				<button type="button" style="width: 68px; height: 35px; border: 1px solid black; background: white; border-radius: 2px; font-size: 13px; outline: none; cursor: pointer;" onclick="check();">
					<span style="font-weight: bold;">폐기완료</span>
				</button>
			</td>
		</tr>
	</table>
</form>

<table style="border-collapse: collapse;">
	<tr style="width: 100%; height: 50px; text-align: center; font-size: 13px; font-weight: bold;">
		<td style="width: 5%; border-bottom: 2px solid black;">상품번호</td>
		<td style="width: 15%; border-bottom: 2px solid black;">상품명</td>
		<td style="width: 7%; border-bottom: 2px solid black;">원가</td>
		<td style="width: 7%; border-bottom: 2px solid black;">소비자가</td>
		<td style="width: 5%; border-bottom: 2px solid black;">폐기수량</td>
		<td style="width: 15%; border-bottom: 2px solid black;">업체명</td>
		<td style="width: 8%; border-bottom: 2px solid black;">폐기일자</td>
		<td style="width: 15%; border-bottom: 2px solid black;">날짜별
			<button type="button" style="width: 20%; height: 25px; border: 1px solid black; margin-left: 3px; background: white; border-radius: 2px; font-size: 11px; outline: none; cursor: pointer; float: center;">
				<span style="font-weight: bold;">조회</span>
			</button>
		</td>
		<td style="width: 15%; border-bottom: 2px solid black;">
			<input type="text" style="width: 70%; height: 25px; padding-left: 2px; border: 1px solid black; border-radius: 2px; float: center; outline: none; border: 1px solid black;" placeholder="상품명 입력..">
			<button type="button" style="width: 20%; height: 25px; border: 1px solid black; margin-left: 3px; background: white; border-radius: 2px; font-size: 11px; outline: none; cursor: pointer; float: center;">
				<span style="font-weight: bold;">검색</span>
			</button>
		</td>
	</tr>
	
</table>

</body>

<script type="text/javascript">
function check() {
	var f = document.disuseForm;
	var uid = "${sessionScope.member.userId}";
	
	if(! f.pdDisNum.value){
		alert("폐기수량을 입력해 주세요.");
		f.pdDisNum.focus();
		return;
	}
	
	if(! f.pdDisReason.value){
		alert("폐기사유를 입력해 주세요.");
		f.pdDisReason.focus();
		return;
	}
	
	if(! uid){
		alert("로그인 후 이용 가능합니다.")
		location.href="<%=cp%>/member/login";
		return;
	}
	
	f.action="<%=cp%>/hotShop/disuse";

    f.submit();
}
</script>
</html>