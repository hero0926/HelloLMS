<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<%@ include file="../include/menu.jsp"%>
<form action="/board/notice/writeNotice" method="post" enctype="multipart/form-data">
	<c:choose>
		<c:when test="${pageContext.request.serverName eq 'oracle.ja.com'}">
			<input type="hidden" name="bxngrid" value="1">
		</c:when>
		<c:when test="${pageContext.request.serverName eq 'hanwha.ja.com'}">
			<input type="hidden" name="bxngrid" value="2">
		</c:when>
		<c:when test="${pageContext.request.serverName eq 'lg.ja.com'}">
			<input type="hidden" name="bxngrid" value="3">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="bxngrid" value="1">
		</c:otherwise>
	</c:choose>
	<div class="container">
		<div class="page-header">
			<h1>
				공지사항 수정 <small>...공지사항을 수정합니다.</small>
			</h1>
		</div>
		<div class="alert alert-info"></div>
		<table class="table table-bordered">
			<tr>
				<td><div class="span1">제목</div></td>
				<td><div class="span5">
						<input name="bxnsubject"
							style="background-color: transparent; border: 0"
							placeholder="제목을 입력하세요." required="required">
					</div></td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<td><textarea class="ckeditor" cols="80" id="content"
						name="bxncontent" rows="20"></textarea></td>
			</tr>
			<tr>
				<td align="right"><input type="file" name="file" /></td>
				<td><input type="submit" name="file"></td>
			</tr>
			<tr>
				<td align="right"><input type="file" name="file" /></td>
				<td><input type="submit" name="file"></td>
			</tr>
		</table>
	</div>
	<table border="0">
		<tr>
			<td><input type="submit" value="작성"></td>
		</tr>
	</table>
</form>
<%@ include file="../include/footer.jsp"%>