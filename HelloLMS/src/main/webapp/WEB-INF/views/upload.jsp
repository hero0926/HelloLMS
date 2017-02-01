<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty originalFileName}">
		<P>OriginalFileName is ${originalFileName}.</P>

	</c:if>
	<form id="frm1" action="/upload" method="post" enctype="multipart/form-data">
		<input type="hidden" name="uploadpath" value="etc">
		<input type="file" name="file" />
		<br>
		<input type="file" name="file" />
		<br>
		<input type="submit"/>
	</form>

</body>
</html>