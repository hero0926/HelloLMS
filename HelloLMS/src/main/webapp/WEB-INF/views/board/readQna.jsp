<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	function edit() {
		location.href = "/board/qna/editQnaUi?bxqseq=${qna.bxqseq}"
	}
	function deleteQna() {
		var delQna = confirm("글을 삭제합니다.");
		if (delQna) {
			$('#frm1').attr("action", "/board/qna/deleteQna");
			$('#frm1').submit();
		} else {
			alert("취소하였습니다.")
			return;
		}
	}
	function list() {
		location.href = "/board/ad_qna?bxqgrid=${qna.bxqgrid}"
	}
</script>
<div class="container">
	<div class="page-header">
		<h1>
			Q&A 내용 <small>...Q&A 내용을 보여줍니다.</small>
		</h1>
	</div>
	<div class="alert alert-info"></div>
	<f:parseDate value="${qna.qnadate}" var="qnaFmt" pattern="yyyyMMdd" />
	<f:parseDate value="${qna.repdate}" var="repFmt" pattern="yyyyMMdd" />
	<form method="post" id="frm1">
		<input type="hidden" name="bxqgrid" value="${qna.bxqgrid}">
		<input type="hidden" name="bxqseq" value="${qna.bxqseq}">
	</form>
	<table class="table table-bordered">
		<tr>
			<td><div class="span2">문의날짜</div></td>
			<td><div class="span2"><f:formatDate value="${qnaFmt}" pattern="yyyy. MM. dd" /></div></td>
		</tr>
		<tr>
			<td><div class="span2">제목</div></td>
			<td><div class="span2">${qna.bxqsubject}</div></td>
		</tr>
		<tr>
		<td><div class="span2">첨부파일</div></td>
			<c:if test="${qna.bxqfile1 != ''}">
				<td><div class="span2"><a href="/board/download?originalFileName=${qna.bxqfile1}&fileName=${qna.bxqconvertfile1}">${qna.bxqfile1}</a></div></td>
			</c:if>
		</tr>
		<tr>
			<td><div class="span2"></div></td>
			<c:if test="${qna.bxqfile2 != ''}">
				<td><div class="span2"><a href="/board/download?originalFileName=${qna.bxqfile2}&fileName=${qna.bxqconvertfile2}"">${qna.bxqfile2}</a></div></td>
			</c:if>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td>${qna.bxqcontent}</td>
		</tr>
	</table>
	<hr>
	<br>
	<input type="hidden" value="${qna.mxseq }">
	<c:if test="${qna.bxqno==null && qna.mxseq == sessionScope.USEQ}">
		<%-- <c:if test="${qna.mxseq=='${USEQ}'}"> --%>
			<button class="btn btn-default btn-sm" onclick="edit()">수정하기</button>&nbsp;&nbsp;
			<%-- <c:if test="${UDIV=='A'}"> --%>
				<button class="btn btn-default btn-sm" onclick="deleteQna()">삭제하기</button>&nbsp;&nbsp;
				<button class="btn btn-default btn-sm" onclick="list()">목록보기</button>
			
		
	</c:if>

	<c:choose>
		<c:when test="${qna.bxqno==null}">
			<form action="/board/qna/writeQnarep" method="post">
				<input type="hidden" name="bxqseq" value="${qna.bxqseq}">
				<input type="hidden" name="bxqno" value="${qna.bxqseq}">
				<c:if test="${!empty USEQ}">
<%
								String udiv = session.getAttribute("UDIV").toString();
											request.setAttribute("udiv", udiv);
							%>
							<c:if test="${udiv=='A'}">
								<button class="btn btn-default btn-sm" type="button" onclick="deleteQna()">삭제하기</button>&nbsp;&nbsp;
				<button class="btn btn-default btn-sm" type="button" onclick="list()">목록보기</button>
								<br><br>
								</c:if>
					<table class="table table-bordered">
						<tr>
							<td><textarea class="ckeditor" cols="80" id="content"
									name="bxqrepcontent" rows="20"></textarea></td>
						</tr>
					</table>
					<table>
						<tr><td><input type="submit" value="답변하기"></td>
						</tr>
					</table>
				</c:if>

			</form>
		</c:when>
		<c:otherwise>
		
			<table class="table table-bordered">
				<tr>
					<td><div class="span2"><f:formatDate value="${repFmt}" pattern="yyyy. MM. dd" /></div></td>
					<td><div class="span2">답변날짜</div></td>
				</tr>
			</table>
			<br>
			<table >
				<tr align="right">
					<td>${qna.bxqrepcontent}</td>
				</tr>
			</table>
			<br>
			<br>
			<%	String udiv = session.getAttribute("UDIV").toString();
				request.setAttribute("udiv", udiv);
			%>
							<!-- JDK 1.8버전부터 'A'뒤에 charAt(0)을 붙여줘야함. -->
							<%-- <c:if test="${qna.mxseq == sessionScope.USEQ || sessionScope.UDIV.toString() eq 'A'.toString()}">
							아래와 같은 구문이다. --%>
							<c:if test="${qna.mxseq == sessionScope.USEQ || sessionScope.UDIV eq 'A'.charAt(0)}">
								<button class="btn btn-default btn-sm" type="button" onclick="deleteQna()">삭제하기</button>&nbsp;&nbsp;
							</c:if>
			<button type="button" class="btn btn-default btn-sm" onclick="list()">목록보기</button>
		</c:otherwise>
	</c:choose>
	</div>

<%@ include file="../include/footer.jsp"%>