<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="include/header.jsp" %>
<%@ include file="include/ad_menu.jsp" %>
<div class="container">
      <div class="page-header">
        <h1>팝업 업로드 <small>...메인화면의 팝업공지를 관리합니다.</small></h1>
      </div>
  <div class="row">
	<form action="/admin/popupload" method="post" enctype="multipart/form-data">
	
	<table>
	
	<th>광고 제목</th>
	<th>게시 시작일</th>
	<th>게시 종료일</th>
	<th>팝업</th>
	<th>이동할 url</th>
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
	
	</table>
</form>
</div>
</div>
<!-- /container -->

<%@ include file="include/footer.jsp"%>