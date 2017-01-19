<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script type = "text/javascript"> 

function popupOpen(){
	var popUrl = "quizQuestion"; //팝업창에 출력될 페이지 URL
	var popOption = "scrollbars=no, status=no, width=500, height=500, top=200, left=500"; //팝업창 옵션
		window.open(popUrl,"",popOption);
}


</script>






</head>

<body>
<h1>My Quiz!!</h1>

<form action="/member/quizQuestion" method="post">
<a href="javascript:popupOpen();">퀴즈 풀기</a>
<h2 id = "test_status"> </h2>
<div id="test"></div>


신중히 생각하며 풀어봅시다!
	











</form>
</body>
</html>