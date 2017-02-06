<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
	<script>
		
	</script>
	<div class="container">
		<div class="page-header">
			<h1>수강 이력</h1>
		</div>
		<div class="alert alert-info">
			
		</div>
		
		<table class="table table-bordered">
	  		<tr>
		  		<th>회차</th>
		  		<th>강의 제목</th>
		  		<th>수강 이력</th>
		  	</tr>
	  				
	  		<c:if test="${!empty historyList}">
	  			<c:forEach var="list" items="${historyList}" varStatus="status">
					<tr>
						<td><c:out value="${list.lxnum}"/></td>
						<td><c:out value="${list.lxname}"/></td>
						<td><c:out value="${list.lslxdate}"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>