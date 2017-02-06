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
     
     
     <Script>
     
     function check(){
    	
    	if(document.getElementById('f1').value==""){
    		 alert("첫번째 파일을 넣어주세요");    		 
    		 return false;
    	 }if(document.getElementById('f2').value==""){
    		 alert("두번째 파일을 넣어주세요");
    		 return false;
    	 }if(document.getElementById('f3').value==""){
    		 alert("세번째 파일을 넣어주세요");
    		 return false;
    	 }if(document.getElementById('adxurl1').value==""){
    		 alert("첫번째 주소를 넣어주세요");
    		 $('#adxurl1').focus();
    		 return false;
    	 }if(document.getElementById('adxurl2').value==""){
    		 alert("두번째 주소를 넣어주세요");
    		 $('#adxurl2').focus();
    		 return false;
    	 }if(document.getElementById('adxurl3').value==""){
    		 alert("세번째 주소를 넣어주세요");
    		 $('#adxurl3').focus();
    		 return false;
    	 }
    	 
    	 else{
    		 $('#frm1').submit();
    		 return true;
    	 }    	 
     }
     
     </Script>
</head>
<body>

<div class="container-fluid">
  <div class="row-fluid">
<h1>배너 업로드하기</h1><br>
<h4>사이즈는 자동 축소됩니다.</h4><br>
<h4>권장 사이즈는 1000x350px입니다.</h4>

	<form id="frm1" action="/admin/adupload" method="post" enctype="multipart/form-data"  onSubmit="return check(this)">

		<input type="hidden" name="uploadpath" value="main">
		<h4>첫번째 광고 <input type="file" name="file" id="f1"/> url <input type="text" id="adxurl1" name="adxurl1"/>
		<br>
		두번째 광고 <input type="file" name="file" id="f2"/> url <input type="text" id="adxurl2" name="adxurl2"/>
		<br>
		세번째 광고 <input type="file" name="file" id="f3"/> url <input type="text" id="adxurl3" name="adxurl3"/>
		<br>
		<button class="btn btn-inverse" onclick="check()">업로드</button>
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
   
   <hr>
   
   

</c:if>

</body>
</html>