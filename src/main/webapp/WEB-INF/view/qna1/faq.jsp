<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#accordion1").accordion({
		  activate: function(event, ui) {
			  var h=ui.newHeader;
			  var text=h.text();
			  var num=h.attr("data-num");
		  }
	});

});
</script>

</head>
<body>
<div align="center" style="margin-top: 100px;">
	<div id="accordion1" style="width: 60%; text-align: left;">
	
	  <h3 data-num="1" style="background: #D5D5D5;">Q. 마이다노는 어떻게 진행되나요?</h3>
	  <div style="background: #F6F6F6;">
	    <p>
	      마이다노는 전 과정이 휴대폰 어플을 통해 진행되는 온라인 프로그램이에요. 매일 식사 / 운동 / 생활 습관 미션을 제공하면서 다이어트를 도와드린답니다. <br>
	      식사 일기를 올려주시면 담당 코치님이 이에 대해 채팅으로 피드백을 드리고, 운동도 각 클래스 커리큘럼에 따라 매일 다르게 제공이 되고 있어요. <br>
	      이 외에도 각 미션에 대한 피드백 및 질문을 담당 코치님과 나누실 수 있기 때문에 혼자 하는 다이어트가 더 이상 힘들지 않으실 거예요.<br>
	    </p>
	  </div>
	  
  	  <h3 data-num="1" style="background: #EAEAEA;">Q. 어떻게 신청할 수 있나요?</h3>
	  <div style="background: #F6F6F6;">
	    <p>
	      마이다노는 프로그램을 신청한 유료 수강생에 한해 진행되는 프로그램이에요. <br>
	      수강신청은 매달 정해진 기간에 마이다노 홈페이지의 [진행중인 프로그램] 페이지에서 진행된답니다. <br>
	      미리 ‘문자알림신청’을 해두실 경우 수강신청이 시작될 때 문자도 보내드리니 꼭 신청해주시기 바랄게요. <br>
	    (070번호를 스팸처리 하셨을 경우 문자가 발송되지 않을 수 있습니다.)<br>
	    </p>
	  </div>
	  
   	  <h3 data-num="1" style="background: #D5D5D5;">Q. 어떤 클래스를 들어야할지 모르겠어요</h3>
	  <div style="background: #F6F6F6;">
	    <p>
	      현재 가장 고민이 되는 부위와 관련된 클래스를 선택하시면 되어요. 하체가 가장 고민이시라면 미니스커트 챌린지, 복부가 가장 고민이시라면 도전 11자 복근을 선택하시면 된답니다. <br>
	      클래스에 상관 없이 기본적으로 전신 운동은 모두 가능하기 때문에 이 부분은 걱정하지 않으셔도 되며, 만약 부위에 상관 없이 ‘고강도 운동’을 하길 원하신다면 비키니 부트캠프를 선택해주세요.
	    </p>
	  </div>
	  
	  <h3 data-num="1" style="background: #EAEAEA;">Q. 운동 난이도 상 / 중 / 하는 어떻게 선택하나요?</h3>
	  <div style="background: #F6F6F6;">
	    <p>
	      마이다노의 운동 강도는 다음과 같은 기준으로 판단해주시면 되어요.<br>
		<br>
		- 상: 운동을 꾸준히 해와서 익숙하신 분<br>
		- 중: 운동 경험이 있는 분<br>
		- 하 : 운동 경험이 없는 분<br>
		<br>
		위와 같은 기준으로 신청 해주시고, 난이도 변경은 수강 중에도 얼마든지 가능하니 코치님과 충분히 대화해주시기 바랄게요.
	    </p>
	  </div>
	  
	  <h3 data-num="1" style="background: #D5D5D5;">Q. 정해진 식단을 지켜야 하는 건가요?</h3>
	  <div style="background: #F6F6F6;">
	    <p>
	      마이다노에서는 정해진 식단을 강요하지 않으며, 현재 각 수강생의 식단을 토대로 개선점을 피드백 해드리는 방식으로 진행된답니다. <br>
	      평생 정해진 식단을 먹을 수는 없기 때문에 스스로 건강한 식단을 구성할 수 있도록 도와드리고 있어요. <br>
	      꼭 다이어트식이 아니라도 일반식으로도 얼마든지 건강하게 드실 수 있으니 식단에 대해 부담가지지 않으셔도 되고, <br>
	      현재 식단에서 코치님의 피드백에 따라 조금씩 개선해 나가시면 좋을 것 같아요.
	    </p>
	  </div>
	  
	  <h3 data-num="1" style="background: #EAEAEA;">Q. 해외에서도 신청할 수 있나요?</h3>
	  <div style="background: #F6F6F6;">
	    <p>
	      마이다노는 전 과정이 휴대폰 어플을 통해 진행되기 때문에 와이파이 이용만 원활하시다면 시공간적 제약 없이 해외에서도 이용하실 수 있어요. <br>
	      다만 시차로 인해 코치님과의 실시간 채팅이 어려울 수 있으며, 미션 수행은 기본적으로 현지 시간 기준으로 진행되지만 종강일은 한국시간 <br>
	      기준으로 마무리가 되기 때문에 마지막 날 미션 수행 시간이 짧아질 수 있다는 점만 참고해주시면 좋을 것 같습니다. 결제는 현재 페이팔이나 <br>
	      해외 카드는 지원이 되지 않고 있어서 국내 카드나 무통장 입금을 이용해주시면 된답니다.
	    </p>
	  </div>
	  <br><br>
	  ※ 마이다노 관련문의<br>
	 - 이메일 : hellomydano@gmail.com<br><br>
	 - 전화 : 070-7777-1886 / 02-2135-1886<br><br>
	 - 운영시간 : 평일 10시 - 18시<br><br>
	 - 점심시간 : 평일 12시 - 14시
	</div>
</div>
</body>
</html>