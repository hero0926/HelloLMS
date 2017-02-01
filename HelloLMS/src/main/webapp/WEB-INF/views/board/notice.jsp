<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
	<div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>공지사항 목록 <small>...공지사항 목록을 보여줍니다.</small></h1>
      </div>
      <div class="alert alert-info"></div>
	<div class="row">
		<table class="table table-bordered">
		<tr>
				<th><div class="span1">번호</div></th>
				<th><div class="span4">제목</div></th>
				<th><div class="span2">작성자</div></th>
				<th><div class="span2">작성일</div></th>
				<th><div class="span1">조회수</div></th>			
		
		</tr>
		<c:forEach items="${notice}" var="list" varStatus="i">
		<fmt:parseDate value="${list.regdate}" var="dateFmt" pattern="yyyyMMdd"/>
			<tr>
				<td><div class="span1">${i.count}</div></td>
				<td><div class="span4"><a href="/board/notice/readNotice?bxnseq=${list.bxnseq}">${list.bxnsubject}</a></div></td>
				<td><div class="span2">${list.cxname}</div></td>
				<td><div class="span2"><fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd"/></div></td>
				<td><div class="span1">${list.bxncnt}</div></td>			
			</tr>
		</c:forEach>
		</table>
		</div>
		<br><br>
			<c:if test="${!empty USEQ}">
				<a href="/board/notice/write">새글 작성</a>
			</c:if>
		<br>	
		<div class="row">
			<div class="span7">&nbsp</div>
			<div class="span2">
				<form action="search1.do">
					<select name="searchName">
						<option value="author">글쓴이</option>
						<option value="title">글제목</option>
						<option value="content">글내용</option>
					</select>
					<input name="searchValue">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>