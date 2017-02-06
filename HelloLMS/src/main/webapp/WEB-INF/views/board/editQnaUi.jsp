<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	session.setAttribute("USEQ", "1"); //로그인 부분 완성 하면 이 부분 뺄것
	session.setAttribute("UID", "test");
	session.setAttribute("UNAME", "홍길동");
	session.setAttribute("bxngrid", "1");
	session.setAttribute("UDIV", "S");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hello LMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}
</style>
<link href="/resources/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="/resources/bootstrap/css/sticky-footer-navbar.css"
	rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

<script src="/resources/js/jquery-2.1.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/js/angular.1.4.8.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<form action="/board/qna/writeQna" method="post">
		<input type="hidden" name="bxqgrid" value="${bxngrid}"> 
		<input type="hidden" name="bxqseq" value="${qna.bxnseq}"> 
		<div class="container">
			<div class="page-header">
				<h1>
					공지사항 쓰기 <small>...공지사항을 작성합니다.</small>
				</h1>
			</div>
			<div class="alert alert-info"></div>
			<table class="table table-bordered">
				<tr>
					<td><div class="span1">제목</div></td>
					<td><div class="span5">
						<input name="bxqsubject" style="background-color: transparent; border: 0" placeholder="제목을 입력하세요." required="required">
						</div></td>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr>
					<td><textarea class="ckeditor" cols="80" id="content"
							name="bxqcontent" rows="20"></textarea></td>
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