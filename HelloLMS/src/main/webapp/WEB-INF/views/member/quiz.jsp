<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>quiz</title>
<!-- 실선 박스  -->
<style> 
div#test{ border:#000 1px solid; padding:10px 40px 40px 40px; }

body{
	background-color: blue;
}
h1 {
	color: white;
	text-align: center;
}

</style>

<script language = javascript> 
var pos = 0, test, test_status, question, choice, choices, chA, chB, correct = 0;
var questions = [
	["what is 10+1 = 13?", "Y", "N", "B" ],
	["5 + 3은 8이 맞나 ? ", "Y", "N", "A" ],
	["정삼각형은 3변이 같은가 ?", "Y", "N", "A" ],
];

function _(x){
	return document.getElementById(x);
}
function renderQuestion(){
	test = _("test");
	if(pos >= questions.length){
		test.innerHTML = "<h2>당신은 " + questions.length + "문제 중" +correct+" 문제 정답!</h2><br><h3> 수고하셨습니다. </h3>";
		_("test_status").innerHTML = "퀴즈 완료";
		pos = 0;
		correct = 0;
		return false;
	}
	_("test_status").innerHTML = "퀴즈 "+questions.length+" 문제 중 "+(pos+1);
	question = questions[pos][0];
	chA = questions[pos][1];
	chB = questions[pos][2];
	test.innerHTML = "<h3>"+question+"</h3>";
	test.innerHTML += "<input type='radio' name='choices' value='A'> "+chA+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='B'> "+chB+"<br><br>";
	test.innerHTML += "<button type='button' class='btn btn-warning' onclick='checkAnswer()'>다음 퀴즈</button>"
}
function checkAnswer(){
	choices = document.getElementsByName("choices");
	for(var i = 0; i<choices.length; i++){
		if(choices[i].checked){
			choice = choices[i].value;
		}
	}
	if(choice == questions[pos][3]){
		correct++;
	}
	pos++;
	renderQuestion();
}

window.addEventListener("load", renderQuestion, false);



</script>
</head>

<body>
<h1>My Quiz!!</h1>
<form action="/" method="post">
<h2 id = "test_status"> </h2>
<div id="test"></div>


신중히 생각하며 풀어봅시다!
	











</form>
</body>
</html>