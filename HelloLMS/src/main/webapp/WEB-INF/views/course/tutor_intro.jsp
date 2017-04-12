<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>


<div class="container">

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$("input[name^='apply_event']")
									.on(
											'click',
											function(e) {

												var j = $(this).attr('name');

												var num = j
														.split('apply_event');

												var coxseq = num[1];

												var apply = confirm("신청하시겠습니까?");

												if (apply) {
													$
															.ajax(
																	{
																		url : '/course/apply',
																		type : 'post',
																		data : {

																			coxseq : coxseq

																		}

																	})
															.done(
																	function(
																			coxseq) {
																		var jObj = JSON
																				.parse(coxseq);
																		var apply = jObj.apply;

																		if ('Y' == apply) {
																			alert('이미 신청하신 과목입니다.');
																		} else if ('N' == apply) {

																			var use = confirm('신청되었습니다.');
																			if (use) {

																				$(
																						'#btn${courses.coxseq}')
																						.attr(
																								'disabled',
																								'true');

																			} else {

																			}
																		}

																	})

												}

											});
						});
	</script>


	<!--
		<script type="text/javascript">
		function apply() {
			var popUrl = "apply";
			var popOption = "width=1080, height=720, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl, "", popOption);
		}
		-->



	<div class="page-header">
		<h1>
			<small>신청 가능한 강좌</small>
		</h1>
	</div>



	<div class="row">
		<div class="span12">
			<h3>신청 가능한 강좌</h3>
			<div class="alert alert-info"></div>
			<form method="post" id="apply">

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

					<c:forEach items="${course}" var="courses" varStatus="i">

						<tr>
							<td>${courses.coxcate}</td>
							<td><a href="#">${courses.coxname}</a></td>
							<td>${courses.coxstart}~${courses.coxend}</td>
							<td>${courses.coxreqstart}~${courses.coxreqend}</td>
							<td><a href="#">${courses.tuxseq}</a></td>
							<td><a href="#">${courses.coxintro}</a></td>
							<td>${courses.regdate}</td>
							<td><input type="hidden" id="coxseq${i.index }"
								value="${courses.coxseq }"> <input type="hidden"
								id="coxprog${i.index }" value="${courses.coxprog}"> <input
								type="hidden" id="coxscore${i.index }"
								value="${courses.coxscore}"> <input type="hidden"
								id="mxseq${i.index }" value="${courses.mxseq }"> <input
								type="button" name="apply_event${courses.coxseq }"
								class="btn btn-success" id="btn" value="강의신청" />
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