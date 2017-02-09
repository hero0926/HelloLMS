<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="include/header.jsp" %>
<%@ include file="include/ad_menu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="/resources/js/jquery-2.1.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/js/angular.1.4.8.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<h1>팝업 업로드하기</h1><br>
<table>

<th>광고 제목</th>
<th>게시 시작일</th>
<th>게시 종료일</th>
<th>팝업</th>
<th>이동할 url</th>
<form action="/admin/popupload" method="post" enctype="multipart/form-data">
<tr>
<Td><input type="text" id="pxname" name="pxname" placeholder="subject"/></Td>
<td><input type="date" id="pxfrom" name="pxfrom"></td>
<td><input type="date" id="pxto" name="pxto"></td>
<td><input type="hidden" name="uploadpath" value="popup">
<input type="file" name="file" id="f1"/>
</td>
<Td><input type="url" id="pxurl" name="pxurl" placeholder="url"/></Td>
<tr>
<tr>
<Td><button class="btn btn-inverse" type="submit">업로드</button></Td>
</tr>
</div>
</table>
</form>
</div>
</body>
</html>