<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
	<script>
	function edit() {
		location.href="/board/notice/editUi?bxnseq=${notice.bxnseq}"
	}
	function deleteNotice() {
		var delNotice=confirm("글을 삭제합니다.");
		if (delNotice) {
			$('#frm1').attr("action", "/board/notice/deleteNotice");
			$('#frm1').submit();
			//location.href="/board/notice/deleteNotice?bxnseq=${notice.bxnseq}"
		} else {
			alert("취소하였습니다.")
			return;
		}
	}
	function list() {
		location.href="/board/notice?bxngrid=${notice.bxngrid}"
	}
    </script>

<f:parseDate value="${notice.regdate}" var="dateFmt" pattern="yyyyMMdd" />
<form method="post" id="frm1">
	<input type="hidden" name="bxngrid" value="${notice.bxngrid}">
	<input type="hidden" name="bxnseq" value="${notice.bxnseq}">
	<input type="hidden" name="bxncnt" value="${notice.bxncnt}">
</form>
<table border="0">
			<tr>
				<td>작성날짜</td>
				<td><f:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" /></td>
				<td>조회수</td>
				<td>${notice.bxncnt}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${notice.bxnsubject}</td>
			</tr>
		</table>
		<br><br>
		<table>
			<tr>
				<td>${notice.bxncontent}</td>
			</tr>
		</table>
	<hr>
	<br>
	<br>
	<c:if test="${!empty USEQ}">
		<% String udiv = session.getAttribute("UDIV").toString();
			request.setAttribute("udiv", udiv); %>
		<c:if test="${udiv=='A'}">
	<button onclick="edit()">수정하기</button>&nbsp;&nbsp;<button onclick="deleteNotice()">삭제하기</button>
		</c:if>
	</c:if>
	&nbsp;&nbsp;<button onclick="list()">목록보기</button>
<%@ include file="../include/footer.jsp"%>