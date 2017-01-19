<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

	<div class="container">
	
		<div class="page-header">
        	<h1><small>My Page  >  내 강의</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<h3>내가 수강신청한 과정</h3>
        		<div class="alert alert-info">
	          	</div>
	        		<table class="table table-bordered">
		  				<tr>
			  				<th>과정명</th>
			  				<th>기간</th>
			  				<th>신청일</th>
			  				<th>승인여부</th>
			  				<th>수강 취소</th>
			  			</tr>
	  				</div>
  				
	  				<c:if test="${!empty list}">
	  					<c:forEach var="applycourse" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${applycourse.coxname}"/></td>
								<td><c:out value="${applycourse.coxstart}"/> ~ <c:out value="${applycourse.coxend}"/></td>
								<td><c:out value="${applycourse.regdate}"/></td>
								<td><c:out value="${applycourse.axstatus}"/></td>
								<td><button type="submit" class="btn">수강취소</button></td>
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