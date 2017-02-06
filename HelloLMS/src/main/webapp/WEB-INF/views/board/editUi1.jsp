<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
session.setAttribute("USEQ", "1"); //로그인 부분 완성 하면 이 부분 뺄것
session.setAttribute("UID", "test");
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
   <script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
	function editNotice() {
		var editit=confirm("글을 수정합니다.");
		if (editit) {
			$("#chk").submit();
			alert("글을 수정하였습니다.");	
		} else {
			alert("취소하였습니다.")
			location.reload();
		}
	}
	
	function list() {
		alert("취소하였습니다..")
		history.go(-1)
	}
	</script>
  </head>
<body>
<%@ include file="../include/menu.jsp"%>
	<form action="/board/notice/editNotice" method="post" id="chk">
		<input type="hidden" name="bxngrid" value="${notice.bxngrid}">
		<input type="hidden" name="bxnseq" value="${notice.bxnseq}">
		<input type="hidden" name="bxncnt" value="${notice.bxncnt}">
		<table border="0">
			<tr>
				<td>글번호1</td>
				<td>${cxname}</td>
				<td>작성날짜</td>
				<td>${notice.regdate}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="bxnsubject" value="${notice.bxnsubject}"></td>
				<td>조회수</td>
				<td>${notice.bxncnt}</td>
			</tr>
		</table>
		<br><br>
		<table>
			<tr>
				<td><textarea class="ckeditor" cols="80" id="content" name="bxncontent" rows="10">${notice.bxncontent}</textarea></td>
			</tr>
		</table>
		<hr>
		
	<input type="button" value="수정하기" onclick="editNotice();">&nbsp;&nbsp;<button onclick="list()">수정취소</button>
	</form>
<%@ include file="../include/footer.jsp"%>