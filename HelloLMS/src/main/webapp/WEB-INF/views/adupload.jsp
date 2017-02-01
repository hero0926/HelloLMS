<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/menu.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>광고 업데이트</title>

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
      
     </style>
</head>
<body>

<div class="container-fluid">
  <div class="row-fluid">
     <h1>배너 업로드하기</h1><br>
<h4>사이즈는 자동 축소됩니다.</h4><br>
<h4>권장 사이즈는 1000x350px입니다.</h4>

	<form id="frm1" action="/adupload" method="post" enctype="multipart/form-data">

		<input type="hidden" name="uploadpath" value="etc">
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
</body>
</html>