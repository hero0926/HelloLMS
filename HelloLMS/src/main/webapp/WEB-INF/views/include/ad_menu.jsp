<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${ !empty deviceType && deviceType=='mobile' }">
	    <div class="navbar navbar-inverse navbar-fixed-top">
	      <div class="navbar-inner">
	        <div class="container">
	          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="brand" href="/admin/">Hello LMS!(Admin)</a>
	          <div class="nav-collapse collapse">
	            <ul class="nav">
	              <li <c:if test="${ '1'==adMenu }">class="active"</c:if>><a href="/admin/">코드관리</a></li>
	              <li <c:if test="${ '2'==adMenu }">class="active"</c:if>><a href="/admin/member">회원관리</a></li>
	              <li <c:if test="${ '3'==adMenu }">class="active"</c:if>><a href="/admin/courseList">강좌관리</a></li>
	              <li><a href="/admin/testpoolList">평가문제관리</a></li>
	              <li><a href="/admin/testpaperList">평가지관리</a></li>
	              <li><a href="/admin/testMonitor">평가현황</a></li>
	              <li><a href="/admin/aduploadForm">슬라이드배너</a></li>
	              <li><a href="/admin/popuploadForm">팝업광고</a></li>
	              <li><a href="/admin/loginStatistics/">로그인 통계</a></li>
	            </ul>
	            
	          </div><!--/.nav-collapse -->
	        </div>
	      </div>
	    </div>
	</c:when>
	<c:otherwise>
	    <div class="navbar navbar-inverse navbar-fixed-top">
	      <div class="navbar-inner">
	        <div class="container">
	          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="brand" href="/admin/">Hello LMS!(Admin)</a>
	          <div class="nav-collapse collapse">
	            <ul class="nav">
	              <li <c:if test="${ '1'==adMenu }">class="active"</c:if>><a href="/admin/">코드관리</a></li>
	              <li <c:if test="${ '2'==adMenu }">class="active"</c:if>><a href="/admin/member">회원관리</a></li>
	              <li <c:if test="${ '3'==adMenu }">class="active"</c:if>><a href="/admin/courseList">강좌관리</a></li>
	              <li class="dropdown <c:if test="${ '4'==adMenu }">active</c:if>">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">평가관리 <b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                  <li><a href="/admin/testpoolList">평가문제관리</a></li>
	                  <li><a href="/admin/testpaperList">평가지관리</a></li>
	                  <li><a href="/admin/testMonitor">평가현황</a></li>
	                </ul>
	              </li>
	              <li class="dropdown <c:if test="${ '5'==adMenu }">active</c:if>">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">광고관리 <b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                  <li><a href="/admin/aduploadForm">슬라이드배너</a></li>
	                  <li><a href="/admin/popuploadForm">팝업광고</a></li>
	                </ul>
	              </li>
	              <li <c:if test="${ '6'==adMenu }">class="active"</c:if>><a href="/admin/loginStatistics/">로그인 통계</a></li>
	            </ul>
	            
	          </div><!--/.nav-collapse -->
	        </div>
	      </div>
	    </div>
	</c:otherwise>
</c:choose>
