<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<%@ include file="../include/header.jsp" %>



<!-- 실선 박스  -->
<style> 
div#test{ border:#000 1px solid; padding:10px 40px 40px 40px; }

body{
	background-color: lightblue;
}
h1 {
	color: white;
	text-align: center;
}

</style>

<script language = javascript> 
var pos = 0, test, test_status, question, choice, choices, anA, anB, correct = 0;
var questions = [
	<c:forEach var="quiz" items="${quizList}" varStatus="i">
		["<c:out value='${quiz.qxcont }'/>", "Y", "N", "<c:out value='${quiz.qxcorrect }'/>", "<c:out value='${quiz.qxseq }'/>", "<c:out value='${quiz.qaxseq }'/>" ],
	</c:forEach>
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
		test.innerHTML += "<button type='button' class='btn btn-success' onclick='window.close(); opener.parent.location.reload();'>확인</button>"
		return false;
	}
	_("test_status").innerHTML = "퀴즈 "+questions.length+" 문제 중 "+(pos+1)+"번 문제";
	question = questions[pos][0];
	anA = questions[pos][1];
	anB = questions[pos][2];
	test.innerHTML = "<h3>"+question+"</h3>";
	test.innerHTML += "<input type='radio' name='choices' value='1'> "+anA+"<br>";
	test.innerHTML += "<input type='radio' name='choices' value='2'> "+anB+"<br><br>";
	test.innerHTML += "<button type='button' class='btn btn-warning' onclick='checkAnswer()'>다음 퀴즈</button>"
}
function checkAnswer(){
	choices = document.getElementsByName("choices");
	for(var i = 0; i<choices.length; i++){
		if(choices[i].checked){
			choice = choices[i].value;
		}
	}
	var ok = 'N';
	if(choice == questions[pos][3]){
		correct++;
		ok = 'Y';
	}
	doAjax(questions[pos][4], choice, ok, questions[pos][5]);
	pos++;
	renderQuestion();
}

function doAjax(qxseq, qaxans, qaxresult, qaxseq) {
	//alert(qxseq+":"+qaxans+":"+ qaxresult);
	$.ajax({
		type : "POST",
		url : "/quizAjax",
		data : {
			qxseq:qxseq,
			qaxans:qaxans,
			qaxresult:qaxresult,
			qaxseq:qaxseq
		},
		dataType : "text"
	}).done(function(msg) {
		//alert(msg.message);
	});
}

window.addEventListener("load", renderQuestion, false);



</script>

<h1>My Quiz!!</h1>
<form action="/" method="post">
<h2 id = "test_status"> </h2>
<div id="test"></div>


	











</form>
</body>
</html>