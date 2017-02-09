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
		location.href="/board/qna/editQnaUi?bxqseq=${qna.bxqseq}"
	}
	function deleteQna() {
		var delQna=confirm("글을 삭제합니다.");
		if (delQna) {
			$('#frm1').attr("action", "/board/notice/deleteQna");
			$('#frm1').submit();	
		} else {
			alert("취소하였습니다.")
			return;
		}
	}
	function list() {
		location.href="/board/qna?bxqgrid=${qna.bxqgrid}"
	}
</script>
<f:parseDate value="${qna.qnadate}" var="qnaFmt" pattern="yyyyMMdd" />
<f:parseDate value="${qna.repdate}" var="repFmt" pattern="yyyyMMdd" />
<form method="post" id="frm1">
<input type="hidden" name="bxqgrid" value="${qna.bxqgrid}">
<input type="hidden" name="bxqno" value="${qna.bxqno}">
</form>
<table border="0">
			<tr>
				<td>문의날짜</td>
				<td><f:formatDate value="${qnaFmt}" pattern="yyyy. MM. dd" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${qna.bxqsubject}</td>
			</tr>
		</table>
		<br><br>
		<table>
			<tr>
				<td>${qna.bxqcontent}</td>
			</tr>
		</table>
	<hr>
	<br>
	<br>
	<c:if test="${qna.bxqno==null}">
	<button onclick="edit()">수정하기</button>&nbsp;&nbsp;<button onclick="deleteQna()">삭제하기</button>
	&nbsp;&nbsp;<button class="btn btn-default btn-sm" onclick="list()">목록보기</button>
	</c:if>
	<br><br><br><br>
	<c:choose>
	<c:when test="${qna.bxqno==null}">
	<form action="/board/qna/writeQnarep" method="post">
	<input type="hidden" name="bxqseq" value="${qna.bxqseq}">
	<input type="hidden" name="bxqno" value="${qna.bxqseq}">
		<c:if test="${!empty USEQ}">
		<% String udiv = session.getAttribute("UDIV").toString();
			request.setAttribute("udiv", udiv); %>
		<c:if test="${udiv=='A'}">
			<table class="table table-bordered">
				<tr>
					<td><textarea class="ckeditor" cols="80" id="content"
							name="bxqrepcontent" rows="20"></textarea></td>
				</tr>
			</table>
		</div>
		<table border="0">
			<tr>
				<td><input type="submit" value="답변하기"></td>
			</tr>
		</table>
		</c:if>
	</c:if>
	</form>
	</c:when>
	<c:otherwise>
	<table border="0">
			<tr>
				<td>답변날짜</td>
				<td><f:formatDate value="${repFmt}" pattern="yyyy. MM. dd" /></td>
			</tr>
		</table>
		<br><br>
		<table>
			<tr>
				<td>${qna.bxqrepcontent}</td>
			</tr>
		</table>
		<br><br><button type="button" class="btn btn-default btn-sm" onclick="list()">목록보기</button>
	</c:otherwise>
	</c:choose>
	
<%@ include file="../include/footer.jsp"%>