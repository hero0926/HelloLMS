<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/ad_menu.jsp"%>

<div class="container">

	<!-- Main hero unit for a primary marketing message or call to action -->
	<div class="page-header">
		<h1>
			QNA 리스트 <small>...QNA를 관리합니다..</small>
		</h1>
	</div>
	<div class="alert alert-info"></div>
	<div class="row">
		<table class="table table-bordered">
			<tr>
				<th><div class="span1">번호</div></th>
				<th><div class="span4">제목</div></th>
				<th><div class="span2">문의날짜</div></th>
				
			</tr>
			<c:forEach items="${qna}" var="list" varStatus="i">
			<fmt:parseDate value="${list.regdate}" var="dateFmt" pattern="yyyyMMdd"/>
			<tr>
					<td><div class="span1">${i.count}</div></td>
					<c:choose>
						<c:when test="${list.bxqrepchk==N}">
							<td><div class="span4"><a href="/board/notice/readQna?bxqseq=${list.bxqseq}">[&nbsp;답변 준비중&nbsp;]&nbsp;${list.bxqsubject}</a></div></td>
						</c:when>
						<c:when test="${list.bxqrepchk==Y}">
							<td><div class="span4"><a href="/board/notice/readQna?bxqseq=${list.bxqseq}">[&nbsp;답변 완료&nbsp;]&nbsp;${list.bxqsubject}</a></div></td>
						</c:when>
					</c:choose>
					<td><div class="span2"><fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd"/></div></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
	<br>
	<br> <a href="/board/notice/write">새 문의</a>

	<%@ include file="../include/footer.jsp"%>