<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Sign in &middot; Twitter Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

                                   
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
   
   
<script type = "text/javascript"> 

function popupOpen(){
	var popUrl = "quizQuestion?lxseq=${lxseq}"; //팝업창에 출력될 페이지 URL
	document.location.href=popUrl;
	//var popOption = "resizable=no, scrollbars=no, status=no, width=500, height=500, top=200, left=500"; //팝업창 옵션
		//window.open(popUrl,"",popOption);
		//self.close();
}


</script>
   
   <script type="text/javascript">
			function setDisable(elementid) {
				alert("\"" + elementid +"\"를 누르셨습니다."+ " 푸시겠습니까?");
				var el = document.getElementById(elementid);
				//alert(el);
				el.disabled = 'false';
			}
		</script>
   
   
   
  </head>

  <body>
<div class="jumbotron text-center">
<h1>My Quiz!!</h1>

<br>
<div class="container">


<a href="javascript:popupOpen();">
<input type='button' class="btn btn-inverse" id='quiz' value='QUIZ' onclick="setDisable('quiz')"/>
</a>
<h2 id = "test_status"> </h2>
<div id="test"></div>
신중히 생각하며 풀어봅시다!
</div>
</div>

     <!-- /container -->

    <!-- Le javascript
    ================================================== -->


  </body>
</html>
