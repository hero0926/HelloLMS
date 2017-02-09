<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>

<div class="container">
	<script type="text/javascript">
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
		}
	</script>






	<div class="page-header">
		<h1>
			<small>강의실 > 강좌 > 강의 목록 </small>
		</h1>
	</div>

	<div class="row">
		<div class="span12">
			<h3>
				강의 목록<small>본 강좌의 강의 목록입니다.</small>
			</h3>
			<div class="alert alert-info">
				<h3></h3>
			</div>
			<form method="post" action="/course/LectureList">
				<table class="table table-bordered">

					<tr>
						<th>회차</th>
						<th>강의 제목</th>
						<th>등록 날짜</th>
						<th>강의보기</th>
						<th>강의자료</th>

					</tr>



					<c:forEach var="lecture" items="${LectureList}" varStatus="status">
						<tr>
							<td><c:out value="${lecture.lxnum}" /></td>
							<td><c:out value="${lecture.lxname}" /></td>
							<td><c:if test="${empty lecture.regdate}"></c:if></td>
							<td><c:if test="${!empty lecture.lxlink}">
									<a
										href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lecture.lxseq}', '${lecture.coxseq}');"><button
											type="submit" class="btn">
											강의보기&nbsp;<i class="icon-facetime-video"></i>
										</button></a>
								</c:if></td>
							<td><c:if test="${!empty lecture.lxfile}">
									<a
										href="/download?path=/resources/lecture/&fileName=${lecture.lxfile}"><c:out
											value="${lecture.lxfile}" /> <i class="icon-download-alt"></i></a>
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