<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>

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

	<h2> ${lecture.coxname }</h2>
	<div class="alert alert-info"></div>
	<div class="container-fluid">
		<div class="row-fluid">


			<div class="span6">

				<img src="/resources/tutor/${lecture.tuxpicture}" width="250"
					height="200"><br>

				${lecture.tuxhistory }  
				
			</div>
			<div class="span6">
			
					<c:choose>

						<c:when test="${lecture.lxtype=='12'}">
							<video width="350"  controls>
								<source src="/resources/lecture/${lecture.lxlink}" type="video/mp4">
							</video>
						</c:when>

						<c:when test="${lecture.lxtype=='13'}">
							<iframe width="350" height="300" src="${lecture.lxlink}"
								style="border: none;" frameborder="1"> iframe을 지원하지 않는
								브라우저를 사용하고 계십니다. 최신버전의 브라우저로 업그레이드 후 사용하세요 </iframe>
						</c:when>

						<c:otherwise>
			        no image
			    </c:otherwise>

					</c:choose>
				
			</div>
		</div>
	</div>




	<br>
	<div class="row">
		<div class="span12">
			<br>
			<div class="alert alert-info"></div>




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
							<td><c:out value="${lecture.lxnum}" />회차</td>
							<td><c:out value="${lecture.lxname}" /></td>
							<td><fmt:parseDate value="${lecture.regdate}" var="dateFmt1"
									pattern="yyyyMMdd" /> <fmt:formatDate value="${dateFmt1}"
									pattern="yyyy-MM-dd" /></td>
							<td>
							
									강의보기&nbsp; <i class="icon-facetime-video"></i>
							</td>
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


	<!-- /container -->
</div>
</body>
</html>