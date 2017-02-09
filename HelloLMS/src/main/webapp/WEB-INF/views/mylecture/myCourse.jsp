<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

	<div class="container">
	
		<script type="text/javascript">
			function testpopupOpen(coxseq){
				var popUrl = "testpopup?coxseq="+coxseq;
				var popOption = "width=1080, height=720, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl, "test", popOption);
				}
			
			function historypopupOpen(coxseq){
				var popUrl = "historypopup?coxseq="+coxseq;
				var popOption = "width=1080, height=720, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl, "history", popOption);
 			}
		</script>
	
		<div class="page-header">
        	<h1><small>My Page  >  내 강의</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<h3>내가 수강중인 과정<small>...수강중인 과정입니다.</small></h3>
        		<div class="alert alert-info">
  				</div>
				
        		<table class="table table-bordered">
	  				<tr>
		  				<th>과정명</th>
		  				<th>기간</th>
		  				<th>강사명</th>
		  				<th>진도율</th>
		  				<th>평가</th>
		  				<th>수강이력</th>
		  			</tr>
  				
	  				<c:if test="${!empty list}">
	  					<c:forEach var="course" items="${list}" varStatus="status">
							<tr>
								<td><a href="myLecture?coxseq=${course.coxseq}"><c:out value="${course.coxname}"/></a></td>
								<td><fmt:parseDate value="${course.coxstart}" var="dateFmt1" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/> ~ 
									<fmt:parseDate value="${course.coxend}" var="dateFmt2" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${course.mxname}"/></td>
								<td><c:out value="${course.coxprog}"/></td>
								<td><a href="javascript:testpopupOpen('${course.coxseq}');">평가</a></td>
								<td><a href="javascript:historypopupOpen('${course.coxseq}');"><button type="submit" class="btn">수강이력</button></a></td>
							</tr>
						</c:forEach>
					</c:if>
          		</table>
          	</div>
          	
			<c:if test="${!empty list}">
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
        
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>