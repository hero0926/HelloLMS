<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>


<div class="container">

	<div class="page-header">
		<h1>
			<small>진행중인 강좌</small>
		</h1>
	</div>

	<div class="row">
		<div class="span12">
			<h3>이미 진행중인 강의 목록입니다.....</h3>
			<div class="alert alert-info"></div>

			<form action="/course/applycourse" method="post">
				<input type="hidden" id="axseq" name="axseq">
				 <input	type="hidden" id="coxseq" name="coxseq"> 
				<table class="table table-bordered">
					<tr>

						<th>과정명</th>
						<th>강의 기간</th>

						<th>등록일</th>
						<th>진행 상태</th>
					</tr>

					<c:forEach items="${courseA }" var="course">

						<tr>

							<td>${course.coxname}</td>
							<td>${course.coxstart}~${course.coxend}</td>
							
							<td><fmt:parseDate value="${course.regdate}" var="dateFmt1" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/></td>
							<td><button class="btn btn-success" disabled="disabled">진행중</button></td>
							<%-- <td><c:choose>
							
								<c:when test="${course.axstatus == 'A'}">
								진행중
								</c:when>
									<c:when test="${course.axstatus =='R' }">
								승인대기
								</c:when>
									<c:when test="${course.axstatus =='C' }">
								수강 불가
								</c:when>
								
								</c:choose></td> --%>
						</tr>
					</c:forEach>

				</table>
			</form>
		</div>

	</div>
	<hr>

</div>
<!-- /container -->

<%@ include file="../include/footer.jsp"%>