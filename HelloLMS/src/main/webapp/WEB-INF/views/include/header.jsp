<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
  </head>

  <body>

      
      