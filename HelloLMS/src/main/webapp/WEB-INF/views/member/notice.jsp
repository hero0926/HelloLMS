<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%-- <%@ page session="false"%> --%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
	<h1>공지사항</h1>
	<hr>
	<table border="0" align="center">
		<tr>
			<th width="50"><img src="../resources/img/ico_no.gif"></th>
			<th width="500"><img src="../resources/img/ico_subject.gif"></th>
			<th></th>
			<th width="150"><img src="../resources/img/ico_nickname.gif"></th>
			<th width="100"><img src="../resources/img/ico_date.gif"></th>
			<th width="50"><img src="../resources/img/ico_hit.gif"></th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td align="center"><f:formatNumber value="${dto.num}" pattern="###,###"/></td>
				
				<td colspan="2" align="left"><a href="retrieve1.do?num=${dto.num}">${dto.title}</a></td>
				<td align="center">${dto.author}</td>
				<td align="center">${dto.writeday}</td>
				<td align="center"><f:formatNumber value="${dto.readCnt}" pattern="###,###"/></td>
			</tr>
			
		</c:forEach>
			<tr>
				
				<td></td>
				<td><a href="">새글 작성</a></td>
				<td colspan="4"><form action="search1.do">
					<select name="searchName">
						<option value="author">글쓴이</option>
						<option value="title">글제목</option>
						<option value="content">글내용</option>
					</select>
					<input name="searchValue">
					
					<input type="submit" value="검색">
				</form>
				<td></td>
				
			</tr>
	</table>

<%@ include file="../include/footer.jsp"%>