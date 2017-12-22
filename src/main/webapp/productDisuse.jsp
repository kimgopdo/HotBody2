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

<script type="text/javascript">
function check() {
	var f = document.disuseForm;
	var mode = "${mode}";
	var uid = "${sessionScope.member.userId}";
	
	if(! f.pdQSubject.value){
		alert("제목을 입력하세요.");
		f.pdQSubject.focus();
		return false;
	}
	if(! document.getElementById("pdQContent").value){
		alert("내용을 입력하세요.");
		f.pdQSubject.focus();
		return false;
	}
	if(! uid){
		alert("로그인 후 이용 가능합니다.")
		location.href="<%=cp%>/member/login";
		return;
	}
	
	f.action="<%=cp%>/hotShop/pQnA_"+mode;

    f.submit();
	
}
</script>

</head>
<body>
	<form method="post" name="disuseForm"></form>
	<table style="border-collapse: collapse;">
		<tr style="width: 100%; height: 50px; text-align: center; font-size: 13px; font-weight: bold;" align="center">
			<td style="width: 10%; border-bottom: 2px solid black;">상품사진</td>
			<td style="width: 5%; border-bottom: 2px solid black;">상품번호</td>
			<td style="width: 15%; border-bottom: 2px solid black;">상품명</td>
			<td style="width: 5%; border-bottom: 2px solid black;">원가</td>
			<td style="width: 5%; border-bottom: 2px solid black;">소비자가(원)</td>
			<td style="width: 5%; border-bottom: 2px solid black;">재고</td>
			<td style="width: 10%; border-bottom: 2px solid black;">폐기수량입력</td>
			<td style="width: 10%; border-bottom: 2px solid black;">업체명</td>
			<td style="width: 5%; border-bottom: 2px solid black;">폐기일자</td>
			<td style="width: 15%; border-bottom: 2px solid black;">폐기사유</td>
			<td style="width: 15%; border-bottom: 2px solid black;">
				<input type="text" style="width: 70%; height: 25px; padding-left: 2px; border: 1px solid black; border-radius: 2px; float: center; outline: none; border: 1px solid black;" placeholder="상품명 입력..">
				<button type="button" style="width: 20%; height: 28px; border: 1px solid black; margin-left: 3px; background: white; border-radius: 2px; font-size: 11px; outline: none; cursor: pointer; float: center;">
					<span style="font-weight: bold;">검색</span>
				</button>
			</td>
		</tr>

		<tr style="width: 100%; height: 150px; text-align: center; font-size: 12px;" align="center">
			<td style="width: 10%;">이미지</td>
			<td style="width: 10%;">14</td>
			<td style="width: 10%;">
				<select style="height: 35px; width: 100%; padding-left: 10px;padding-bottom: 5px;  border: 1px solid black; border-radius: 2px; outline: none; cursor: pointer;">
					<option selected="selected">■ 상품선택</option>
				</select>
			</td>
			<td>30,000</td>
			<td>40,000</td>
			<td>13</td>
			<td>
				<input type="text" style="width: 30%; height: 25px; border: 1px solid black; border-radius: 2px; outline: none; padding-left: 2px;">
			</td>
			<td style="font-weight: bold;">(주)하림</td>
			<td>2017-12-29<br>19:55:32</td>
			<td><input type="text" placeholder="폐기사유 입력.." style="width: 90%; height: 25px; outline: none; border-radius: 2px; border: 1px solid black; padding-left: 2px;"></td>
			<td>
				<button type="button" style="width: 100px; height: 35px; border: 1px solid black; background: white; border-radius: 2px; font-size: 15px; outline: none; cursor: pointer;" onclick="check();">
					<span style="font-weight: bold;">폐기완료</span>
				</button>
			</td>
		</tr>
	</table>

</body>
</html>