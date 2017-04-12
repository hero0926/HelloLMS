<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/header.jsp" %>
<%@ include file="include/ad_menu.jsp" %>
     
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


<div class="container">
  
      <div class="page-header">
        <h1>배너 업로드 <small>...메인화면의 배너를 관리합니다.</small></h1>
      </div>
  <div class="row">
  	<div class="span12">
	<h4>사이즈는 자동 축소됩니다.</h4><br>
	<h4>권장 사이즈는 1000x350px입니다.</h4>
	
		<form id="frm1" action="/admin/adupload" method="post" enctype="multipart/form-data"  onSubmit="return check(this)">
	
			<input type="hidden" name="uploadpath" value="main">
			<h4>첫번째 광고 <input type="file" name="file" id="f1"/> url <input type="url" id="adxurl1" name="adxurl1"/>
			<br>
			두번째 광고 <input type="file" name="file" id="f2"/> url <input type="url" id="adxurl2" name="adxurl2"/>
			<br>
			세번째 광고 <input type="file" name="file" id="f3"/> url <input type="url" id="adxurl3" name="adxurl3"/>
			<br>
			<button class="btn btn-inverse" onclick="check()">업로드</button>
			</h4> 
		</form>
     </div>
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

<!-- /container -->

<%@ include file="include/footer.jsp"%>