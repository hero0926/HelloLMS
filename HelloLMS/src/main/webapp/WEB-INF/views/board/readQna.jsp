<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
session.setAttribute("USEQ", "1"); //로그인 부분 완성 하면 이 부분 뺄것
session.setAttribute("UID", "test");
session.setAttribute("bxqgrid", 1);
session.setAttribute("UNAME", "홍길동");
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
    <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
	<script>
	function edit() {
		location.href="/board/qna/editUi?bxqseq=${qna.bxqseq}"
	}
	function deleteNotice() {
		var delNotice=confirm("글을 삭제합니다.");
		if (delNotice) {
			location.href="/board/qna/deleteQna?bxqseq=${qna.bxnseq}"
			alert("글을 삭제하였습니다.")	
		} else {
			alert("취소하였습니다.")
			return;
		}
	}
	function list() {
		location.href="/board/qna?bxqgrid=${bxqgrid}"
	}
    </script>
  </head>
<body>
<%@ include file="../include/menu.jsp"%>
<f:parseDate value="${qna.qnadate}" var="qnaFmt" pattern="yyyyMMdd" />
<f:parseDate value="${qna.repdate}" var="repFmt" pattern="yyyyMMdd" />
<script src="/resources/ckeditor/ckeditor.js"></script>
<input type="hidden" name="bxqgrid" value="${qna.bxqgrid}">
<input type="hidden" name="bxqno" value="${qna.bxqno}">
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
	<button onclick="edit()">수정하기</button>&nbsp;&nbsp;<button onclick="deleteNotice()">삭제하기</button>
	&nbsp;&nbsp;<button onclick="list()">목록보기</button>
	</c:if>
	<br><br><br><br>
	<c:choose>
	<c:when test="${qna.bxqno==null}">
	<form action="/board/qna/writeQnarep" method="post">
	<input type="hidden" name="bxqseq" value="${qna.bxqseq}">
	<input type="hidden" name="bxqno" value="${qna.bxqseq}">
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
		<br><br><button onclick="list()">목록보기</button>
	</c:otherwise>
	</c:choose>
	
<%@ include file="../include/footer.jsp"%>