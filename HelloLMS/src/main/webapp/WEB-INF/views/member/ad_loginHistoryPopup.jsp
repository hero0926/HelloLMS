<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>

	<div class="container">
		<div class="row">
			
			<div class="page-header">
				<h1>로그인 기록</h1>
			</div>
			<div class="alert alert-info">
				
			</div>
			
			<div class="span12">
			<c:if test="${!empty list}">
				<table class="table table-bordered">
			  		<tr>
				  		<th>번호</th>
				  		<th>로그인 기기</th>
				  		<th>로그인 일자</th>
				  	</tr>
		  			<c:forEach var="list" items="${list}" varStatus="status">
						<tr>
							<td><c:out value="${status.count}"/></td>
							<td><c:out value="${list.lxdev}"/></td>
							<td><c:out value="${list.regdate}"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty list}">
				로그인 기록이 없습니다.
			</c:if>
			</div>
		</div>
	</div> <!-- /container -->

</body>
</html>