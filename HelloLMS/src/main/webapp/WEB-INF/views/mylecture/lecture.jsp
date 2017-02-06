<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="/resources/bootstrap/img/glyphicons-329-podium.png">
    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    
    <style type="text/css">
      body {
        padding-top: 5px;
      }
    </style>
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

		<script type="text/javascript">
				function lecturepopup(lxtype, lxlink, lxseq, coxseq){
					var popUrl;
					if(lxtype=="12"){
						popUrl = "lecture?lxlink="+lxlink+"&coxseq="+coxseq;
						alert("lecture-lecturepopupUrl----"+popUrl);
					} else if(lxtype=="11"){
						popUrl = "/download?path=/resources/lecture&fileName="+lxlink;
					} else if(lxtype=="13"){
						popUrl = lxlink;
					}
					document.location.href=popUrl;
					//winopen(popUrl);
					doStudy(lxseq);
				}
				function quizpopupOpen(){
					winopen("quizpopup");
	/* 				var popUrl = "quizpopup";
					var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
						window.open(popUrl, "", popOption);
	 */			}
				
				function winopen(url){
					var popUrl = url;
					/* var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
						window.open(popUrl, "", popOption); */
					location.replace(popUrl);
				}
				function doStudy(lxseq) {
					$.ajax({
						type : "POST",
						url : "/mypage/mylecture/lexstudy",
						data : {
							lxseq : lxseq
						},
						dataType : "text"
					//contentType: "application/json; charset=utf-8"
					}).done(function() {
						opener.parent.location.reload();
						/* $('.ajaxLayer').hide(); */
						//alert(msg.message);
						//var html = '<div>'+msg.message+'</div>';
						//$('#test_Div').html(msg.message);
					});
				}
		</script>

	<div class="container-fluid">
	
	 <div class="row-fluid">
	    <div class="span10">
	      <!--Body content-->
				<video  class="span12" controls >
					<source src="/resources/lecture/${lxlink}" type="video/mp4">
					<source src="movie.ogg" type="video/ogg">
		                Your browser does not support the video tag.
		        </video>
	      
	    </div>
	    <div class="span2">
	      <!--Sidebar content-->
			<table class="table table-bordered">
	 			<tr>
	  				<th>회차</th>
	  				<th>강의 제목</th>
	  			</tr>
	  			
		        <c:if test="${!empty list}">
					<c:forEach var="lecture" items="${list}" varStatus="status">
						<tr>
							<td><c:out value="${lecture.lxnum}"/></td>
							<td><c:out value="${lecture.lxname}"/>
								&nbsp;&nbsp;<c:if test="${!empty lecture.lxlink}"><a href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lecture.lxseq}', '${lecture.coxseq}');"><i class="icon-facetime-video"></i></a></c:if>
							</td>
								<%-- <form action="lecture" method="post">
									<input type="hidden" name="lxtype" value="${lecture.lxtype}">
									<input type="hidden" name="lxlink" value="${lecture.lxlink}">
									<input type="hidden" name="lxseq" value="${lecture.lxseq}">
									<input type="hidden" name="coxseq" value="${lecture.coxseq}">
									<input type="submit" value="강의보기">
								</form></c:if></td> --%>
						</tr>
					</c:forEach>
				</c:if>
			</table>	      
	      
	    </div>
	  </div>
	
	
	
	
	
	
 
	</div>
	
</body>
</html>