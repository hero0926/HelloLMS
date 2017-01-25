<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/menu.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 약관 폼</title>

   <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
   
    <style type="text/css">
    
      body {
        padding-top: 100px;
        padding-bottom: 40px;
      }
     </style>
   
<head>
<script type="text/javascript">

function chk(){
 var req = document.form.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.form.submit();
  location.href="/member/register2";
 }else{
  alert("개인정보 약관에 동의하셔야 합니다.");
 }
}

function nochk(){
 alert("동의하지 않으면 가입하실 수 없습니다");
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>


<body>
<form action="member/register2" name="form" method="get">

<div align="center">
 <table>
  <tr>
   <td>
     <br>
  
   <br>
   <label class="checkbox">
   <input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다. 
   </label>
   </td>
  </tr>
  <textarea rows="20" disabled="disabled">으 으아 악 으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악으 으아 악</textarea>
  <tr>
   <td align="center" valign="top">
    <button class="btn btn-primary" type="button" onclick="chk()"/>동의</button>
    <button class="btn" type="button" onclick="nochk()"/>동의하지 않습니다</button>
   </td>
  </tr>
  
 </table>
 </div>
</form>

</body>
</html>