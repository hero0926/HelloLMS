<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Hello LMS</a>
          
<c:if test="${!empty USEQ }">

          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown <c:if test="${ '1'==Menu }">active</c:if>" >
              	<a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				  <li><a href="#about">개인정보수정</a></li>
				  <li class="dropdown-submenu">
				    <a tabindex="-1" href="#">내강의</a>
				    <ul class="dropdown-menu">
				      <li><a href="#about">수강신청한 과정</a></li>
				      <li><a href="#about">수강중인 과정</a></li>
				    </ul>
				  </li>
				</ul>
              </li>
              <li class="dropdown <c:if test="${ '2'==Menu }">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">강의실 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">수강신청가능한 강좌</a></li>
                  <li><a href="#">진행중인 강좌</a></li>
                  <li><a href="#">공개 강좌</a></li>
                </ul>
              </li>
              <li class="dropdown <c:if test="${ '3'==Menu }">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">공지사항</a></li>
                  <li><a href="#">FAQ</a></li>
                  <li><a href="#">Q&A</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-search pull-left">
			  <input type="text" class="search-query" placeholder="Search : 과정명">
			</form>
            <form class="navbar-form pull-right">
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
                  <li><a href="#">공지사항</a></li>
                  <li><a href="#">FAQ</a></li>
                  <li><a href="#" onClick="alert('로그인 하세요.');">Q&A</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-search pull-left">
			  <input type="text" class="search-query" placeholder="Search : 과정명">
			</form>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="ID">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
</c:if>
          
          
        </div>
      </div>
    </div>