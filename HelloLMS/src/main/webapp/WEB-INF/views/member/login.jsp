<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/menu.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 100px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      
      .div-ohter {
        max-width: 500px;
        text-align : center;
        padding: 39px 39px 39px;
        margin: 0 auto 40px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
      
      .modal-body{
      	margin: 0 auto 10px;
      	padding: 5px;      
      }
      
      
      .modal-header{
      
      padding: 19px 29px 19px;
      margin: 0 auto 20px;
      
      }
      
      .alert{
      
        margin-top :15px;
      	font-size: 15px;
      
      }

    </style>
   <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
   
   <script> 

	//이메일 합치기
	function call()
	{
		var m1 = document.getElementById("email1").value;
		var m2 = document.getElementById("email2").value;
		document.getElementById("mxmail").value = m1+"@"+m2;
	}
	
	function call2()
	{
		var m1 = document.getElementById("email3").value;
		var m2 = document.getElementById("email4").value;
		document.getElementById("mxmail2").value = m1+"@"+m2;
	}
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <c:if test="${empty LOGIN }">
	<script>
	
	</script>
</c:if>
 --%>
<div class="container">

<form class="form-signin" action="/member/loginPost" method="post">
        <h2 class="form-signin-heading">로그인하세요</h2>
        <input type="text" class="input-block-level" name="mxid" placeholder="ID">
        <input type="password" class="input-block-level" name="mxpw" placeholder="Password">
        
        <button class="btn btn-large btn-primary" type="submit">로그인</button>
            
</form>
</div>

<hr>

<div class="div-ohter" align="center">
<h2 class="form-signin-heading">처음이신가요?</h2>
<a href="/member/register1"><button class="btn btn-large btn-warning" type="button">회원가입</button></a>
<br><br><hr><br><Br>
<h2 class="form-signin-heading">문제가 있으신가요?</h2>

  <a href="#idmodal" data-toggle="modal">
  <button class="btn btn-large btn-danger" type="button">ID 찾기</button>&nbsp;&nbsp;&nbsp;
  </a>

  <div id="idmodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">아이디를 잊어버리셨나요?</h3>
  </div>
  <div class="modal-body">  
  	<form action="/member/id" method="post" >
    <p>이름 <input type="text" class="class="span2" name = "mxname"></p>
    <p>이메일 <input name="email1" class="class="span1" type="text" class="box" id="email1"  onkeyup='call()'> @
 			  <input name="email2" type="text" class="box" id="email2" value="" onkeyup='call()'>
			  <input type="text" name="mxmail" id="mxmail" value="" style="display:none"></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" id="idfind">찾기!</button>
    </form>
  </div> 
</div>


<c:if test="${not empty mxid}">
<script>
$(".alert").alert();
</script>

   <div class="alert alert-block alert-error fade in">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>고객님의 아이디는</strong><br>${mxid }입니다.
          </div>

</c:if>

<c:if test="${empty mxid}">
<script>
alert("아이디와 비밀번호를 정확히 입력하세요");
</script><!-- 

   <div class="alert alert-block alert-error fade in" id="iddiv" style="display:none" >
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>고객님의 아이디는</strong><br>없습니다!
   </div> -->
</c:if>


<a href="#pwmodal" data-toggle="modal">
<button class="btn btn-large btn-inverse" type="button">비밀번호 찾기</button>
</a>


<div id="pwmodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">비밀번호를 잊어버리셨나요?</h3>
  </div>
  <div class="modal-body">
  <form action="/member/pw" method="post" >
    <p>아이디 <input type="text" class="class="span2" name = "mxid"></p>  
    <p>이름 <input type="text" class="class="span2" name = "mxname"></p>
    <p>이메일 <input name="email3" class="class="span1" type="text" class="box" id="email3"  onkeyup='call2()'> @
 			  <input name="email4" type="text" class="box" id="email4" value="" onkeyup='call2()'>
			  <input type="text" name="mxmail2" id="mxmail2" value="" style="display:none"></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" type="submit" >찾기!</button>
    </form>
  </div> 
</div>

<c:if test="${not empty msg}">
<script>
$(".alert").alert();
</script>

   <div class="alert alert-block alert-error fade in">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            ${msg }
          </div>

</c:if>


</div>

</body>
</html>