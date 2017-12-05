<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<script type="text/javascript">
function modalSendLogin() {
   var f=document.loginForm;
   
   if(!f.userId.value) {
       f.userId.focus();
       return false;
    }   

    if(!f.userPwd.value) {
       f.userPwd.focus();
       return false;
    }
    
    var query=$('form[name=loginForm]').serialize();
    //alert(query);
    var url="<%=cp%>/member/login";
    $.ajax({
      type:"post"
      ,url:url
      ,data:query
      ,dataType:"json"
      ,success:function(data) {
         var state=data.state;
         var msg=data.message;
         alert(state);
         if(state=="true") {
            location.href="<%=cp%>/";
         } else {
            //alert(msg);
         }
      }
        ,error:function(e) {
          console.log(e.responseText);
       } 
   });
}
</script>

   

<!-- 로그인 모달-->
   <div class="modal fade" id="myLoginModal" tabindex="-1" role="dialog" aria-labelledby="myLoginModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-sm" style="width: 320px;">
       <div class="modal-content">
         <div class="modal-header" style="height: 50px;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="myLoginModalLabel">Login</h4>
         </div>
         <form name="loginForm" method="post">
         <div class="modal-body" style="height: 130px;">
           <table style="margin-top: 1px;">
            <tr height="30">
               <td>아 이 디&nbsp;&nbsp;&nbsp;<input type="text" name="userId" style="color : black;" placeholder="Id"></td>
            </tr>
            <tr height="30">
               <td style="padding-top: 20px;">비밀번호 <input type="password" name="userPwd" style="margin-left:1px; width: 175px; color: black;" placeholder="Password"></td>
            </tr>
            <tr height="30">
               <td style="padding-left: 17px; font-size: 11px; padding-bottom: 3px; padding-top: 10px;"><a href="#" style="margin-left: 140px; width: 206px;">아이디 / 비밀번호 찾기</a></td>
            </tr>
           </table>
         </div>
         <div class="modal-footer" style="height: 70px;">
            <a href="#"><button type="button" class="btn btn-default" data-dismiss="modal" style="height: 35px; float: left"><span style="font-size: 11px;">회원가입</span></button></a>
         <button type="button" class="btn btn-default" style="height: 35px;" onclick="modalSendLogin();"><span style="font-size: 11px;">login</span></button>
         </div>
       </form>
       </div>
     </div>
   </div>