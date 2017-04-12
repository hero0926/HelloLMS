<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
	<script>
	var BSEQ = ${notice.bxnseq};
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
		location.href="/board/notice"
	}
	
    </script>

<div class="container">
	<div class="page-header">
		<h1>
			공지사항 내용 <small>...공지사항 내용을 보여줍니다.</small>
		</h1>
	</div>
	<div class="alert alert-info"></div>
<f:parseDate value="${notice.regdate}" var="dateFmt" pattern="yyyyMMdd" />
<form method="post" id="frm1">
	<input type="hidden" name="bxngrid" value="${notice.bxngrid}">
	<input type="hidden" name="bxnseq" value="${notice.bxnseq}">
	<input type="hidden" name="bxncnt" value="${notice.bxncnt}">
</form>
<table class="table table-bordered">
			<tr>
				<td><div class="span2">작성날짜</div></td>
				<td><div class="span2"><f:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" /></div></td>
				<td><div class="span1">조회수</div></td>
				<td><div class="span1"><p4 id="${notice.bxnseq}">${notice.bxncnt}</p4></div></td>
			</tr>
			<tr>
				<td><div class="span2">제목</div></td>
				<td><div class="span4">${notice.bxnsubject}</div></td>
				<td></td>
				<td></td>
			</tr>
			<c:if test="${notice.bxnfile1 != null}">
			<tr>
			<td><div class="span2">첨부파일</div></td>
				<td><div class="span4"><a href="/board/download?originalFileName=${notice.bxnfile1}&fileName=${notice.bxnconvertfile1}">${notice.bxnfile1}</a></div></td>
				<td></td>
				<td></td>
			</tr>
			</c:if>
			<c:if test="${notice.bxnfile2 != null}">
			<tr>
			<td><div class="span2"></div></td>
				<td><div class="span4"><a href="/board/download?originalFileName=${notice.bxnfile2}&fileName=${notice.bxnconvertfile2}">${notice.bxnfile2}</a></div></td>
				<td></td>
				<td></td>
			</tr>	
			</c:if>
		</table>
		<br><br>
		<table>
			<tr>
				<td>${notice.bxncontent}</td>
			</tr>
		</table>
		<hr>
		<table>
	<c:if test="${!empty USEQ}">
		<% String udiv = session.getAttribute("UDIV").toString();
			request.setAttribute("udiv", udiv); %>
		<c:if test="${udiv=='A'}">
	<button onclick="edit()" class="btn btn-default btn-sm">수정하기</button>&nbsp;&nbsp;<button onclick="deleteNotice()" class="btn btn-default btn-sm">삭제하기</button>
		</c:if>
	</c:if>
	</table>
	<br>
	<%-- <table class="table table-bordered">
	<tr>
			<th><div class="span5">제목</div></th>
			<th><div class="span2">작성일</div></th>
			<th><div class="span1">조회수</div></th>
		</tr>
		<c:forEach items="${list}" var="list">
		<input type="hidden" name="bxnseq" value="${list.bxnseq}">
			<fmt:parseDate value="${list.regdate}" var="dateFmt"
				pattern="yyyyMMdd" />
			<tr>
			
				<td><div class="span5">
						<a href="/board/notice/readNotice?bxnseq=${list.bxnseq}">
							<c:if test="${list.bxnseq}=='$("p4").attr("id")'">${list.bxnsubject} <<</c:if>
							${list.bxnsubject}
							<c:if test="${list.bxnfile1 != null}"><i class="icon-file"></i></c:if>
							<c:if test="${list.ASNEW_FLG == 'NEW'}">
								<font color="blue"><small>[ NEW! ]</small></font>
									<c:if test="${list.bxncnt >= 20}">
										<font color="red">[ HOT! ]</font>
									</c:if>
							</c:if>
							<c:if test="${list.ASNEW_FLG == 'OLD'}">
								<c:if test="${list.bxncnt >= 20}">
									<font color="red"><small>[ HOT! ]</small></font>
								</c:if>
							</c:if>
						</a>
					</div></td>

				<td><div class="span2">
						<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" />
					</div></td>
				<td><div class="span1">${list.bxncnt}</div></td>
			</tr>
		</c:forEach>
	</table> --%>
	<table class="table table-bordered">
	<tr>
	<c:forEach items="${lin}" var="lin1" begin="0" end="0">
	<c:if test="${lin1.bxnseq != null}">
	<c:if test="${lin1.bxnseq > notice.bxnseq}">
	<td><div class="span1">NEXT</div></td>
	<f:parseDate value="${lin1.regdate}" var="dateFmt1" pattern="yyyyMMdd" />
	<td><div class="span3"><a href="/board/notice/readNotice?bxnseq=${lin1.bxnseq}">${lin1.bxnsubject}</a></div></td>
	<td><div class="span2"><f:formatDate value="${dateFmt1}" pattern="yyyy. MM. dd" /></div></td>
	</c:if>
	</c:if>
	</c:forEach>
	</tr>
	<tr>
	<c:forEach items="${lin}" var="lin2" begin="2">
	<td><div class="span1">PREV</div></td>
	<c:if test="${lin2.bxnseq < notice.bxnseq}">
	<f:parseDate value="${lin2.regdate}" var="dateFmt2" pattern="yyyyMMdd" />
	<td><div class="span3"><a href="/board/notice/readNotice?bxnseq=${lin2.bxnseq}">${lin2.bxnsubject}</a></div></td>
	<td><div class="span2"><f:formatDate value="${dateFmt2}" pattern="yyyy. MM. dd" /></div></td>
	</c:if>
	</c:forEach>
	</tr>
	</table>
	<table>
	<tr>
	<button onclick="list()" type="button" class="btn btn-default btn-sm">목록보기</button>
	</tr>
	</table>
</div>
<%@ include file="../include/footer.jsp"%>