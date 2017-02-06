<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="/">Hello LMS</a>
          
<c:if test="${!empty USEQ }">

          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown <c:if test="${ '1'==Menu }">active</c:if>" >
              	<a href="" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				  <li><a href="member/update">개인정보수정</a></li>
				  <li class="dropdown-submenu">
				    <a tabindex="-1" href="#">내강의</a>
				    <ul class="dropdown-menu">
				      <li><a href="/mypage/mylecture/myApplyCourse">수강신청한 과정</a></li>
				      <li><a href="/mypage/mylecture/myCourse">수강중인 과정</a></li>
				    </ul>
				  </li>
				</ul>
              </li>
              <li class="dropdown <c:if test="${ '2'==Menu }">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">강의실 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/course/viewcourse">수강신청가능한 강좌</a></li>
                  <li><a href="/course/apply">진행중인 강좌</a></li>
                  <li><a href="/course/openCourse">공개 강좌</a></li>
                </ul>
              </li>
              <li class="dropdown <c:if test="${ '3'==Menu }">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/board/notice/">공지사항</a></li>
                  <li><a href="#">FAQ</a></li>
                  <li><a href="/board/qna?bxqgrid=1">Q&A</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-search pull-left">
			  <input type="text" class="search-query" placeholder="Search : 과정명">
			</form>
            <form class="navbar-form pull-right" action="/member/logout" >
	          <font style="color: white; font-style: inherit;">${UNAME }님 반갑습니다.</font>
              <button type="submit" class="btn">Sign off</button>
            </form>
          </div><!--/.nav-collapse -->
</c:if>
<c:if test="${empty USEQ }">

          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown">
              	<a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				  <li><a href="#about"  onClick="alert('로그인 하세요.');">개인정보수정</a></li>
				  <li class="dropdown-submenu">
				    <a tabindex="-1" href="#">내강의</a>
				    <ul class="dropdown-menu">
				      <li><a href="#about" onClick="alert('로그인 하세요.');">수강신청한 과정</a></li>
				      <li><a href="#about" onClick="alert('로그인 하세요.');">수강중인 과정</a></li>
				    </ul>
				  </li>
				</ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">강의실 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#" onClick="alert('로그인 하세요.');">수강신청가능한 강좌</a></li>
                  <li><a href="#" onClick="alert('로그인 하세요.');">진행중인 강좌</a></li>
                  <li><a href="#">공개 강좌</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/board/notice/">공지사항</a></li>
                  <li><a href="#">FAQ</a></li>
                  <li><a href="#" onClick="alert('로그인 하세요.');">Q&A</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-search pull-left">
			  <input type="text" class="search-query" placeholder="Search : 과정명">
			</form>
            <form class="navbar-form pull-right" action="/member/loginPost" method="post">
              <input class="span2" type="text" name="mxid" placeholder="ID">
              <input class="span2" type="password" name ="mxpw" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
</c:if>
          
          
        </div>
      </div>
    </div>