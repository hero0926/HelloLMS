<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>


<div class="container">

	<script type="text/javascript">
		/* 	$(document).ready(function() {

				$("input[name^='apply_event']").on('click', function(e) {

					var j = $(this).attr('name');

					var num = j.split('apply_event');

					var coxseq = num[1];

					var apply = confirm("신청하시겠습니까?");

					if (apply) {
						$.ajax({
							url : '/course/apply',
							type : 'post',
							data : {
								coxseq : coxseq
							}

						}).done(function(coxseq,mxseq) {
							var jObj = JSON.parse(coxseq);
							var apply = jObj.apply;
							
							if ('Y' == apply) {
								alert('이미 신청하신 과목입니다.');
							} else if('N' == apply){

								var use = confirm('신청되었습니다.');
								if (use) {
									
									$('#btn${courses.coxseq}').attr('disabled', 'true');

								} else {

								}
							}

						})

					}

				});
			});
		 */

		function goApply(coxseq) {
			var apply = confirm("신청하시겠습니까?");
			if (apply) {
				$('#coxseq').val(coxseq);
				$('#apply').attr('action', '/course/apply');
				$('#apply').submit();
			} else {
				return;
			}
		}

		function goDelApply(axseq) {
			var godelete = confirm("취소하시겠습니까?");
			if (godelete) {
				$('#axseq').val(axseq);
				$('#apply').attr('action', '/course/applyDelte');
				$('#apply').submit();
			}
		}

		function lecturepopup(lxtype, lxlink, lxseq, coxseq) {
			var popUrl;
			if (lxtype == "12") {
				popUrl = "lecture?lxlink=" + lxlink + "&lxtype=" + lxtype
						+ "&coxseq=" + coxseq;
			} else if (lxtype == "11") {
				popUrl = "/download?path=/resources/lecture&fileName=" + lxlink;
			} else if (lxtype == "13") {
				/* popUrl = lxlink; */
				popUrl = "lecture?lxlink=" + lxlink + "&lxtype=" + lxtype
						+ "&coxseq=" + coxseq;
			}
			winopen(popUrl, "lecture");

			doStudy(lxseq);
		}

		function lectureOpen(coxseq, axstatus) {

			var popUrl;
			var popUrl = "/course/LectureList?coxseq=" + coxseq;
			var popOption = "width=800, height=800, resizable=yes, scrollbars=yes, status=no, location=no";

			window.open(popUrl, "lecture", popOption);

		}
		function goTutor(mxseq){
			var popUrl = "/board/tutor?mxseq="+mxseq;
			var popOption = "width=400, height=600, resizable=yes, scrollbars=yes, status=no, location=no";

			window.open(popUrl, "tutor", popOption);
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
			<form method="post" id="apply">
				<input type="hidden" id="coxseq" name="coxseq"> <input
					type="hidden" id="axseq" name="axseq">
				<table class="table table-bordered">

					<tr>

						<th>과정명</th>
						<th>강의 기간</th>
						<th>신청 기간</th>
						<th>강좌 소개</th>
						<th>강사</th>
						<th>등록일</th>
						<th>신청 여부</th>
					</tr>

					<c:forEach items="${course}" var="courses" varStatus="i">
						<input type="hidden" name="mxseq" value="${courses.mxseq}">

						<tr>
							
							<td><a href="javascript:lectureOpen('${courses.coxseq }');">${courses.coxname }</a></td>



							<td><fmt:parseDate value="${courses.coxstart}"
									var="dateFmt1" pattern="yyyyMMdd" /> <fmt:formatDate
									value="${dateFmt1}" pattern="yyyy-MM-dd" /> ~ <fmt:parseDate
									value="${courses.coxend}" var="dateFmt2" pattern="yyyyMMdd" />
								<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:parseDate value="${courses.coxreqstart}"
									var="dateFmt1" pattern="yyyyMMdd" /> <fmt:formatDate
									value="${dateFmt1}" pattern="yyyy-MM-dd" /> ~ <fmt:parseDate
									value="${courses.coxreqend}" var="dateFmt2" pattern="yyyyMMdd" />
								<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd" /></td>
							<td>${courses.coxintro}</td>
							<td>
									<a href="javascript:goTutor('${courses.mxseq}');">${courses.mxname}</a>
									<div class="dropdown">
									<i class="icon-search"></i>
									<div class="dropdown-content">
										<c:if test="${!empty courses.tuxpicture}">
											<img src="/resources/tutor/${courses.tuxpicture}" onclick="joayo();">
										</c:if>
										<c:if test="${empty courses.tuxpicture}">
											<img src="/resources/tutor/tutor.jpg" onclick="joayo();">
										</c:if><br>
										강사 이력: ${courses.tuxhistory}<br>
										강사 좋아요: ${courses.cnt}
									</div>
								</div>
									</td>
							<td>${courses.regdate}</td>
							<td><input type="hidden" id="axseq" name="axseq"> <c:if
									test="${ empty courses.axseq }">
									<input type="button" class="btn-small btn-success" id="btn"
										value="강의신청" onClick="goApply('${courses.coxseq }');" />
								</c:if> <c:if test="${ !empty courses.axseq }">
									<button class="btn-small btn btn-inverse" disabled="disabled">신청중</button>
									<button class="btn-small" id="btn"
										onClick="goDelApply('${courses.axseq }');">신청취소</button>
								</c:if></td>
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