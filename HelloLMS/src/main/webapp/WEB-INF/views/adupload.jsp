<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/header.jsp" %>
<%@ include file="include/ad_menu.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
   
    <style type="text/css">
    
      body {
      	padding-top : 100px;
      	align : center;
      }
      
      #frm1{
    align :center;
    width: 85%;
	box-sizing: border-box;
	margin: 0 auto;
	position: relative;
	top: 20px;
	margin : 10px;
	background: linear-gradient(to bottom, 30%) 100%);
	box-shadow: 0 4px 12px rgba(0,0,0,0.2);
	border-radius: 4px;      
      
      }
      
      div.container-fluid{
      
      align:center;
      
      }
      
      .alert{
      
      width : 500px;
      font-size: 1.875em;
      float: center;
      margin: 10px;
      
      }
      
     </style>
</head>
<body>

<div class="container-fluid">
  <div class="row-fluid">
<h1>배너 업로드하기</h1><br>
<h4>사이즈는 자동 축소됩니다.</h4><br>
<h4>권장 사이즈는 1000x350px입니다.</h4>

	<form id="frm1" action="/admin/adupload" method="post" enctype="multipart/form-data">

		<input type="hidden" name="uploadpath" value="main">
		<h4>첫번째 광고 <input type="file" name="file" />
		<br>
		두번째 광고 <input type="file" name="file" />
		<br>
		세번째 광고 <input type="file" name="file" />
		<br>
		<button class="btn btn-inverse" type="submit">업로드</button>
		</h4>
	</form>
    </div>
    </div>
    
    
    <c:if test="${not empty msg}">
<script>
$(".alert").alert();
</script>

   <div class="alert alert-info fade in">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            ${msg }
   </div>

</c:if>

<br><br><br><hr>

<c:if test="${not empty msg}">

<div class="span 4">
   <div id="myCarousel" class="carousel slide">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- Carousel items -->
  <div class="carousel-inner">
    <div class="active item" align="center">
     <img class="no-resize" src="http://localhost/displayFile?fileName=${b1}" alt="">
    </div>
    <div class="item" align="center">    
     <img class="no-resize"  src="http://localhost/displayFile?fileName=${b2}" alt="">
    </div>    
  <div class="item" align="center">    
     <img class="no-resize"  src="http://localhost/displayFile?fileName=${b3}" alt="">
  </div>
    
  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
</div>

</c:if>
</body>
</html>