<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%-- <%@ page session="false"%> --%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
	<div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>공지사항 목록 <small>...공지사항 목록을 보여줍니다.</small></h1>
      </div>
	<div class="row">
		<table border="0">
		<tr>
			<h6>
				<th><div class="span1">번호</div></th>
				<th><div class="span4">제목</div></th>
				<th><div class="span2">작성자</div></th>
				<th><div class="span2">작성일</div></th>
				<th><div class="span1">조회수</div></th>			
			</h6>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td align="center"><f:formatNumber value="" pattern="###,###"/></td>
				
				<td colspan="2" align="left"><a href=""></a></td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"><f:formatNumber value="" pattern="###,###"/></td>
			</tr>
		</c:forEach>
		</table>
		</div>
		<br><br>
				<a href="">새글 작성</a>
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