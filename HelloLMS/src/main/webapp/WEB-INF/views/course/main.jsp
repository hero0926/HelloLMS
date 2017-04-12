<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>


<div class="container">

	<script type="text/javascript">
		function apply() {
			var popUrl = "apply";
			var popOption = "width=1080, height=720, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl, "", popOption);
		}
	</script>

	<div class="page-header">
		<h1>
			<small>신청 가능한 강좌</small>
		</h1>
	</div>

	<div class="row">
		<div class="span12">
			<h3>신청 가능한 강좌</h3>
			<div class="alert alert-info"></div>

			<table class="table table-bordered">
				<tr>
					<th>분류</th>
					<th>과정명</th>
					<th>신청 기간</th>
					<th>강의 기간</th>
					<th>강좌 소개</th>
					<th>강사</th>
					<th>등록일</th>
					<th>신청 여부</th>
				</tr>
				<c:forEach items="${course}" var="courses">
					<tr>

						<input type="hidden" name="${courses.coxseq}">
						<td>${courses.coxcate}</td>
						<td>${courses.coxname}</td>
						<td>${courses.coxstart} ~ ${courses.coxend}</td>
						<td>${courses.coxreqstart}
						~
						${courses.coxreqend}</td>
						<td>${courses.tuxseq}</td>
						<td>${courses.coxintro}</td>
						<td>${courses.regdate}</td>
						<td><a href="javascript:apply()"><button type="submit"
									class="btn">신청</button></a>
					</tr>
				</c:forEach>

			</table>
		</div>

		
	</div>
	<hr>

</div>
<!-- /container -->

<%@ include file="../include/footer.jsp"%>