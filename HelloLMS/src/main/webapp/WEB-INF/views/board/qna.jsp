<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>

<div class="container">
	<div class="page-header">
		<h1>
			QNA 리스트 <small>...QNA를 관리합니다..</small>
		</h1>
	</div>
	<div class="alert alert-info"></div>
	<table class="table table-bordered">
		<tr>
			<th><div class="span1">번호</div></th>
			<th><div class="span4">제목</div></th>
			<th><div class="span2">문의날짜</div></th>

		</tr>
		<c:forEach items="${rep}" var="rep" varStatus="i">
			<input type="hidden" name="bxqgrid" value="${rep.bxqgrid}">
			<input type="hidden" name="bxqno" value="${rep.bxqno}">
			<input type="hidden" name="bxqseq" value="${rep.bxqseq}">
			
			<fmt:parseDate value="${rep.qnadate}" var="dateFmt"
				pattern="yyyyMMdd" />

			<tr>
				<td><div class="span1">${i.count}</div></td>

				<c:choose>
					<c:when test="${rep.bxqno==null}">
						<td><div class="span4">
								<a href="/board/qna/readQna?bxqseq=${rep.bxqseq}">[<font
									color="red"> 답변 준비중 </font>]&nbsp;${rep.bxqsubject}
								</a>
							</div></td>
					</c:when>
					<c:otherwise>
						<td><div class="span4">
								<a href="/board/qna/readQna?bxqseq=${rep.bxqseq}">[<font
									color="blue"> 답변 완료 </font>]&nbsp; ${rep.bxqsubject}
								</a>
							</div></td>
					</c:otherwise>
				</c:choose>
				<td><div class="span2">
						<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" />
					</div></td>
			</tr>
		</c:forEach>
	</table>
	<table border="0">
		<tr>
			<td><button type="button"
					onclick="location.href='/board/qna/write'">새 문의</button>
			<td>
		</tr>
	</table>
</div>
<br>


<%@ include file="../include/footer.jsp"%>