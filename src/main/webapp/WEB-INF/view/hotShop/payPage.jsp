<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.paymentPage{
	top: 100px;
	font-size: 16px;
	font-family: inherit;
	margin-bottom: 200px;
}
.paymentPage button{
	border: 1px solid #000000;
	background: #ffffff;
	font-size: 14px;
	font-weight:bolder;
}
.paymentPage tr{
	border-bottom: 2px solid #e7e7e7;
	height: 80px;
}
.paymentPage input[type=text]{
	margin-left: 5px;
	margin-right: 5px;
	padding: 2px;
	border-radius: 2px;
	border: 1px solid #e7e7e7;
	outline: none;
}
.paymentPage select{
	padding: 3px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<table class="paymentPage">
	<tr>
		<td colspan="4" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;">주문내역</td>
		<td colspan="4" style=" vertical-align: bottom;"><button type="button" style="float: right; font-weight: bold;">선택삭제</button></td>
	</tr>
	<tr style="height: 50px; background: #F8F2ED">
		<td><input type="checkbox"></td>
		<td>이미지</td>
		<td>상품정보</td>
		<td>판매가</td>
		<td>수량</td>
		<td>적립포인트</td>
		<td>가격</td>
		<td>별점</td>
	</tr>
	<tr style="height:150px;">
		<td width="2%" ><input type="checkbox"></td>
		<td width="15%" >이미지</td>
		<td width="38%">....</td>
		<td width="10%">19000</td>
		<td width="5%">1</td>
		<td width="5%">190</td>
		<td width="10%">19000</td>
		<td>****</td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: right;vertical-align: text-top;">상품구매금액1900</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;">주문자정보</td>
		<td colspan="4" style="text-align: right; font-size:20px; font-weight: bold; vertical-align: bottom;"><span style="color: red;">*</span>필수입력사항</td>
	</tr>
	<tr>
		<td colspan="2">주문하시는분<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;"><input type="text"></td>
	</tr>
	<tr>
		<td colspan="2">휴대전화<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;">
			<select>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>-<input type="text">-<input type="text"></td>
	</tr>
	<tr>
		<td colspan="2">이메일<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;">
			<input type="text">@<input type="text">
				<select>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
				</select>
		</td>
	</tr>
	<tr height="60px">
		<td colspan="8" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;">배송정보</td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: left; "> <input type="radio">주문자 정보와 동일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio">새로작성</td>

	</tr>
	<tr>
		<td colspan="2">받으시는분<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;"><input type="text"></td>
	</tr>
	<tr style="height: 100px;">
		<td colspan="2">배송지</td>
		<td colspan="6" style="text-align: left;"><input type="text"> <button type="button">우편번호</button><br><input type="text"><br><input type="text"> </td>
	</tr>
	<tr>
		<td colspan="2">연락 가능한 번호1<span style="color: red;">*</span></td>
		<td colspan="6" style="text-align: left;">
			<select>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>-<input type="text">-<input type="text">
		</td>
	</tr>
	<tr>
		<td colspan="2">연락 가능한 번호2</td>
		<td colspan="6" style="text-align: left;">
			<select>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>-<input type="text">-<input type="text">
		</td>
	</tr>
	<tr>
		<td colspan="2">배송메세지</td>
		<td colspan="6" style="text-align: left;"><textarea rows="3" style="width: 300px;"></textarea> </td>
	</tr>
	<tr>
		<td colspan="8" style="text-align: left; font-size:20px; font-weight: bold; vertical-align: bottom;">결제예정금액</td>
	</tr>
	<tr>
		<td colspan="2">사용할 포인트</td>
		<td colspan="6" style="text-align: left;"> <input type="text"> </td>
	</tr>
	
	<tr>
		<td colspan="2">사용포인트</td>                            
		<td colspan="1">총주문 금액</td>
		<td colspan="5" style="text-align: center; padding: 10px;">총결제예정금액</td>
	</tr>
	<tr style="height: 200px;">
		<td colspan="2" rowspan="2" style="border-right: 2px solid #e7e7e7">....</td>
		<td colspan="1" rowspan="2">....</td>
		<td colspan="5" style="border-left: 2px solid #e7e7e7">....</td>
	</tr>
	<tr>
		<td colspan="3">...</td>
		<td colspan="2"><button type="button" style="width: 100%; height: 80px; padding: 0; margin: 0;">주문하기</button></td>
	</tr>
</table>