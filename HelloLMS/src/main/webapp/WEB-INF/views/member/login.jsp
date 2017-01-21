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

    </style>
   <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${empty LOGIN }">
	<script>
	alert("아이디와 비밀번호를 정확히 입력하세요");
	</script>
</c:if>

<div class="container">

<form class="form-signin" action="/member/loginPost" method="post">
        <h2 class="form-signin-heading">로그인하세요</h2>
        <input type="text" class="input-block-level" name="mxid" placeholder="ID">
        <input type="password" class="input-block-level" name="mxpw" placeholder="Password">
        
        <button class="btn btn-large btn-primary" type="submit">로그인</button>
            
</form>
</div>

<hr>

<div class="container" align="center">
<form class="div-ohter">
<h2 class="form-signin-heading">처음이신가요?</h2>
<a href="/member/register1"><button class="btn btn-large btn-warning" type="button">회원가입</button></a>
<br><br><hr><br><Br>
<h2 class="form-signin-heading">문제가 있으신가요?</h2>
<button class="btn btn-large btn-danger" type="button">ID 찾기</button>&nbsp;&nbsp;&nbsp;
<button class="btn btn-large btn-inverse" type="button">비밀번호 찾기</button>
</form>
</div>



</body>
</html>