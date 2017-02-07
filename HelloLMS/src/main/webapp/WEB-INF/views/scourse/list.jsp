<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.container{

text-align : center;

}

.table-hover{

text-align : center;

}


.hoverthings{

  background : #fffff;
  cursor: pointer;
  position: relative;
  bottom: 0;
  transition: all 0.4s linear;
  padding: 62px 22px 62px 22px;
  margin-top: 20px;
  margin-bottom : 30px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  

}

.hoverthings:hover {
  background : #fffff;
  bottom: 100px;
}

.courseheader{

	margin-bottom: 4px solid #D8D8D8;
    padding: 0 0 15px 0;
    margin: 30px 0px;
    list-style: none;
    text-align: center;
    font-size: 25px;
}

</style>


</head>
<body>
<div class="container">
	<div class="page-header">
		<h1>
			<small>강좌 목록</small>
		</h1>
	</div>
</div>

	<div class="container">
		<div class="span12">
			<div class="alert alert-info"></div>
			<form method="post" id="apply">

					<c:forEach items="${list}" var="courses" varStatus="i">
						
						<div class="span3 hoverthings">
						<div class="courseheader">
							<h2>과정명<br>
							${courses.coxname}<br></h4>
							<h4>
							신청기간 : ${courses.coxstart}~${courses.coxend}<br>
							강의기간 : ${courses.coxreqstart}~${courses.coxreqend}<br></h4>
						</div>
						<div class="alert alert-info"></div>
							<h3>
							강좌 소개<br></h3>
							<h5><a href="#">${courses.coxintro}</a></h5>
								<c:if test="${ !empty courses.axseq }">
									신청중<button class="btn-small" id="btn" 
									onClick="goDelApply('${courses.axseq }');">X</button>
								</c:if>
							</div>

					</c:forEach>
			</form>
		</div>

		<c:if test="${!empty course}">
			<div class="pagination" style="text-align: center">
				<ul>
					<li><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
		</c:if>
	</div>
	<hr>
</div>
<!-- /container -->

<%@ include file="../include/footer.jsp"%>

</body>
</html>