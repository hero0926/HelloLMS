<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
	
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
					winopen(popUrl);
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
						dataType : "json"
					//contentType: "application/json; charset=utf-8"
					}).done(function() {
						/* $('.ajaxLayer').hide(); */
						//alert(msg.message);
						//var html = '<div>'+msg.message+'</div>';
						//$('#test_Div').html(msg.message);
					});
				}
		</script>
		
        <div class="row">
	    	<div class="span8">
				<video width="830" height="450" controls >
					<source src="/resources/lecture/${lxlink}" type="video/mp4">
					<source src="movie.ogg" type="video/ogg">
		                Your browser does not support the video tag.
		        </video>
		    </div>
	        <div class="span4">
		        <table class="table table-bordered">
		 			<tr>
		  				<th>회차</th>
		  				<th>강의 제목</th>
		  				<th>강의보기</th>
		  			</tr>
		  			
		  			<c:forEach var="test" items="list" end="2" varStatus="status">
        				<c:set value="${list[status.index].coxseq}" var="coxseq" />
        			</c:forEach>
        			<c:forEach var="test" items="list" end="2" varStatus="status">
        				<c:set value="${list[status.index].lxseq}" var="lxseq" />
        			</c:forEach>
		        
			        <c:if test="${!empty list}">
						<c:forEach var="lecture" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${lecture.lxnum}"/></td>
								<td><c:out value="${lecture.lxname}"/></td>
								<td><c:if test="${!empty lecture.lxlink}"><a href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lxseq}', '${coxseq}');"><button type="submit" class="btn">강의보기</button></a></c:if></td>
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