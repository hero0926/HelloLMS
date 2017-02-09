<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>

<script>
function sc() {
	if (!$.trim($('#cmtn').val())) {
		alert('검색할 키워드를 입력해 주세요.');
	}else{
	$('#frmSearch').submit();
	}
}
</script>

<div class="container">
	<div class="page-header">
		<h1>
			공지사항 목록 <small>...공지사항 목록을 보여줍니다.</small>
		</h1>
	</div>
	<form action="/board/notice/searchNotice" method="get" id="frmSearch">
		<div class="alert alert-info"></div>
	

		<table class="table table-bordered">
	<c:forEach items="${search}" var="search">
<input type="hidden" name="bxnsubject" value="${search.bxnsubject}">
<input type="hidden" name="bxncontent" value="${search.bxncontent}">	
</c:forEach>	
				<tr>
					<td></td>
					<td></td>
					<td><select name="searchName">
					
						<option value="bxnsubject">글제목</option>
						<option value="bxncontent">글내용</option>
						<option value="">글제목+글내용</option>
					</select></td>
					<td><input id="cmtn" name="searchValue"></td>
					<td><button type="button" class="btn btn-default btn-sm" onclick="sc();">검색</button></td>
			
			</tr>
			
			<tr>
				<th><div class="span1">번호</div></th>
				<th><div class="span4">제목</div></th>
				<th><div class="span2">작성일</div></th>
				<th><div class="span1">조회수</div></th>

			</tr>
			<c:forEach items="${notice}" var="list" varStatus="i">
			<input type="hidden" name="bxngrid" value="${list.bxngrid}">
				<fmt:parseDate value="${list.regdate}" var="dateFmt"
					pattern="yyyyMMdd" />
				<tr>
					<td><div class="span1">${i.count}</div></td>
					<td><div class="span4">
							<a href="/board/notice/readNotice?bxnseq=${list.bxnseq}">${list.bxnsubject}</a>
						</div></td>
					<td><div class="span2">
							<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" />
						</div></td>
					<td><div class="span1">${list.bxncnt}</div></td>
				</tr>
			</c:forEach>
	<c:if test="${!empty USEQ}">
		<% String udiv = session.getAttribute("UDIV").toString();
			request.setAttribute("udiv", udiv); %>
		<c:if test="${udiv=='A'}">
			<tr>
				<td><button type="button"
					onclick="location.href='/board/notice/write'">공지 작성</button>
				<td>
			</tr>
		</c:if>
		
	</c:if>
	</table>
</form>
</div>
<%@ include file="../include/footer.jsp"%>