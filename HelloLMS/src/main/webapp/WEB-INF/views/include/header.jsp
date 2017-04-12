<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
/* session.setAttribute("USEQ", "1"); //로그인 부분 완성 하면 이 부분 뺄것
session.setAttribute("UID", "test");
session.setAttribute("UNAME", "홍길동");
session.setAttribute("UDIV", "S");
session.setAttribute("UOFFICE", "8");
 */

%>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Hello LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="/resources/bootstrap/img/glyphicons-329-podium.png">

    <!-- Le styles -->
    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    
    <!-- <script type="text/javascript">
	    String spath = request.getServletPath();  
		String url = request.getRequestURL().toString();  
		// 필요에 따라서 사용  
		Stirng strCurrentUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		alert();
	</script> -->
	
	<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
   	</style>
	
	<%-- <c:if test="<%= request.getRequestURI() %>!='/WEB-INF/views/home.jsp'">
	<%= request.getRequestURI() %>
		<style type="text/css">
	      body {
	        padding-top: 60px;
	        padding-bottom: 40px;
	      }
    	</style>
	</c:if> --%>
	
    <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
   <style>
		.dropbtn {
		    background-color: #4CAF50;
		    color: white;
		    padding: 10px;
		    font-size: 12.5px;
		    border: none;
		    cursor: pointer;
		}
		
		.dropdown {
		    position: relative;
		    display: inline-block;
		}
		
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		
		.dropdown-content a:hover {background-color: #f1f1f1}
		
		.dropdown:hover .dropdown-content {
		    display: block;
		}
		
		.dropdown:hover .dropbtn {
		    background-color: #3e8e41;
		}
		</style>
  </head>

  <body>

      
      