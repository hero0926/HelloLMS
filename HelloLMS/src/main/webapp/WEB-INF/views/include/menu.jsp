<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

/* #searchType{
	width : 85px;
} */

/* GLOBAL STYLES
    -------------------------------------------------- */
    /* Padding below the footer and lighter body text */

    body {
      padding-bottom: 40px;
      color: #5a5a5a;
    }



    /* CUSTOMIZE THE NAVBAR
    -------------------------------------------------- */

    /* Special class on .container surrounding .navbar, used for positioning it into place. */
    .navbar-wrapper {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      z-index: 10;
      margin-top: 20px;
      margin-bottom: -90px; /* Negative margin to pull up carousel. 90px is roughly margins and height of navbar. */
    }
    .navbar-wrapper .navbar {

    }

    /* Remove border and change up box shadow for more contrast */
    .navbar .navbar-inner {
      border: 0;
      -webkit-box-shadow: 0 2px 10px rgba(0,0,0,.25);
         -moz-box-shadow: 0 2px 10px rgba(0,0,0,.25);
              box-shadow: 0 2px 10px rgba(0,0,0,.25);
    }

    /* Downsize the brand/project name a bit */
    .navbar .brand {
      padding: 14px 20px 16px; /* Increase vertical padding to match navbar links */
      font-size: 16px;
      font-weight: bold;
      text-shadow: 0 -1px 0 rgba(0,0,0,.5);
    }

    /* Navbar links: increase padding for taller navbar */
    .navbar .nav > li > a {
      padding: 15px 20px;
    }

    /* Offset the responsive button for proper vertical alignment */
    .navbar .btn-navbar {
      margin-top: 10px;
    }



    /* CUSTOMIZE THE CAROUSEL
    -------------------------------------------------- */

    /* Carousel base class */
    .carousel {
      margin-bottom: 60px;
    }

    .carousel .container {
      position: relative;
      z-index: 9;
    }

    .carousel-control {
      height: 80px;
      margin-top: 0;
      font-size: 120px;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
      background-color: transparent;
      border: 0;
      z-index: 10;
    }

    .carousel .item {
      height: 500px;
    }
    .carousel img {
      position: absolute;
      top: 0;
      left: 0;
      min-width: 100%;
      height: 500px;
    }

    .carousel-caption {
      background-color: transparent;
      position: static;
      max-width: 550px;
      padding: 0 20px;
      margin-top: 200px;
    }
    .carousel-caption h1,
    .carousel-caption .lead {
      margin: 0;
      line-height: 1.25;
      color: #fff;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
    }
    .carousel-caption .btn {
      margin-top: 10px;
    }



    /* MARKETING CONTENT
    -------------------------------------------------- */

    /* Center align the text within the three columns below the carousel */
    .marketing .span4 {
      text-align: center;
    }
    .marketing h2 {
      font-weight: normal;
    }
    .marketing .span4 p {
      margin-left: 10px;
      margin-right: 10px;
    }


    /* Featurettes
    ------------------------- */

    .featurette-divider {
      margin: 80px 0; /* Space out the Bootstrap <hr> more */
    }
    .featurette {
      padding-top: 120px; /* Vertically center images part 1: add padding above and below text. */
      overflow: hidden; /* Vertically center images part 2: clear their floats. */
    }
    .featurette-image {
      margin-top: -120px; /* Vertically center images part 3: negative margin up the image the same amount of the padding to center it. */
    }

    /* Give some space on the sides of the floated elements so text doesn't run right into it. */
    .featurette-image.pull-left {
      margin-right: 40px;
    }
    .featurette-image.pull-right {
      margin-left: 40px;
    }

    /* Thin out the marketing headings */
    .featurette-heading {
      font-size: 50px;
      font-weight: 300;
      line-height: 1;
      letter-spacing: -1px;
    }



    /* RESPONSIVE CSS
    -------------------------------------------------- */

    @media (max-width: 979px) {

      .container.navbar-wrapper {
        margin-bottom: 0;
        width: auto;
      }
      .navbar-inner {
        border-radius: 0;
        margin: -20px 0;
      }

      .carousel .item {
        height: 500px;
      }
      .carousel img {
        width: auto;
        height: 500px;
      }

      .featurette {
        height: auto;
        padding: 0;
      }
      .featurette-image.pull-left,
      .featurette-image.pull-right {
        display: block;
        float: none;
        max-width: 40%;
        margin: 0 auto 20px;
      }
    }


    @media (max-width: 767px) {

      .navbar-inner {
        margin: -20px;
      }

      .carousel {
        margin-left: -20px;
        margin-right: -20px;
      }
      .carousel .container {

      }
      .carousel .item {
        height: 300px;
      }
      .carousel img {
        height: 300px;
      }
      .carousel-caption {
        width: 65%;
        padding: 0 70px;
        margin-top: 100px;
      }
      .carousel-caption h1 {
        font-size: 30px;
      }
      .carousel-caption .lead,
      .carousel-caption .btn {
        font-size: 18px;
      }

      .marketing .span4 + .span4 {
        margin-top: 40px;
      }

      .featurette-heading {
        font-size: 30px;
      }
      .featurette .lead {
        font-size: 18px;
        line-height: 1.5;
      }

    }

</style>




	<div class="navbar-wrapper">
      <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
      <div class="container">

        <div class="navbar navbar-inverse">
          <div class="navbar-inner">
            <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="brand" href="/">Hello LMS</a>
            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
            <c:choose>
	<c:when test="${ !empty deviceType && deviceType=='mobile' }">
		<c:if test="${!empty USEQ }">
		
          <div class="nav-collapse collapse">
            <ul class="nav">
			  <li><a href="/member/update">개인정보수정</a></li>
			  <li><a tabindex="-1" href="/etc/">내강의</a></li>
		      <li><a href="/mypage/mylecture/myApplyCourse">수강신청한 과정</a></li>
		      <li><a href="/mypage/mylecture/myCourse">수강중인 과정</a></li>
		      <li><a href="/etc/">학습현황</a></li>
                 <li><a href="/course/applycourse">진행중인 강좌</a></li>
                 <li><a href="/course/openCourse">공개 강좌</a></li>
             		  <li><a href="/board/notice">공지사항</a></li>
              	  <li><a href="/etc/faqList">FAQ</a></li>
   			      <li><a href="/board/qna">Q&A</a></li>
            </ul>         
            
            <form class="navbar-form pull-right" action="/member/logout" >
	          <font style="color: white; font-style: inherit;">${UNAME }님 반갑습니다.</font>
              <button type="submit" class="btn">Sign off</button>
            </form>
          </div><!--/.nav-collapse -->
		          
		</c:if>
		<c:if test="${empty USEQ }">
		
          <div class="nav-collapse collapse">
            <ul class="nav">
			  <li><a href="#about" onClick="alert('로그인 하세요.');">개인정보수정</a></li>
			  <li><a href="#about" onClick="alert('로그인 하세요.');">내강의</a></li>
		      <li><a href="#about" onClick="alert('로그인 하세요.');">수강신청한 과정</a></li>
		      <li><a href="#about" onClick="alert('로그인 하세요.');">수강중인 과정</a></li>
		      <li><a href="#about" onClick="alert('로그인 하세요.');">학습현황</a></li>
                 <li><a href="#about" onClick="alert('로그인 하세요.');">수강신청가능한 강좌</a></li>
                 <li><a href="#about" onClick="alert('로그인 하세요.');">진행중인 강좌</a></li>
                 <li><a href="/course/openCourse">공개 강좌</a></li>
             		  <li><a href="/board/notice">공지사항</a></li>
              	  <li><a href="/etc/faqList">FAQ</a></li>
   			      <li><a href="#about" onClick="alert('로그인 하세요.');">Q&A</a></li>		            
           </ul>
           
            <form class="navbar-form pull-right" action="/member/loginPost" method="post">
              <input class="span2" type="text" name="mxid" placeholder="ID">
              <input class="span2" type="password" name ="mxpw" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>&nbsp;
              <button type="button" class="btn" onClick="javascript:document.location.href='/member/register1';">Join us</button>
            </form>
          </div><!--/.nav-collapse -->
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="${!empty USEQ }">
		
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown <c:if test="${ '1'==Menu }">active</c:if>" >
              	<a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				  <li><a href="/member/update">개인정보수정</a></li>
				  <li class="dropdown-submenu">
				    <a tabindex="-1" href="/etc/">내강의</a>
				    <ul class="dropdown-menu">
				      <li><a href="/mypage/mylecture/myApplyCourse">수강신청한 과정</a></li>
				      <li><a href="/mypage/mylecture/myCourse">수강중인 과정</a></li>
				      <li><a href="/etc/">학습현황</a></li>
				    </ul>
				  </li>
				</ul>
              </li>
              <li class="dropdown <c:if test="${ '2'==Menu }">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">강의실 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/course/viewcourse">수강신청가능한 강좌</a></li>
                  <li><a href="/course/applycourse">진행중인 강좌</a></li>
                  <li><a href="/course/openCourse">공개 강좌</a></li>
                </ul>
              </li>
              <li class="dropdown <c:if test="${ '3'==Menu }">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
                <ul class="dropdown-menu">
               		<li><a href="/board/notice">공지사항</a></li>
                	<li><a href="/etc/faqList">FAQ</a></li>
                	<li><a href="/board/ad_qna">Q&A</a></li>
                </ul>
              </li>
            </ul>         
            
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
				      <li><a href="#about" onClick="alert('로그인 하세요.');">학습현황</a></li>
				    </ul>
				  </li>
				</ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">강의실 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#" onClick="alert('로그인 하세요.');">수강신청가능한 강좌</a></li>
                  <li><a href="#" onClick="alert('로그인 하세요.');">진행중인 강좌</a></li>
                  <li><a href="/course/openCourse">공개 강좌</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                	<li><a href="/board/notice">공지사항</a></li>
                	<li><a href="/etc/faqList">FAQ</a></li>
     			    <li><a href="#" onclick="alert('로그인 하세요.');">Q&A</a></li>
                </ul>
              </li>
            </ul>

            <form class="navbar-form pull-right" action="/member/loginPost" method="post">
              <input class="span2" type="text" name="mxid" placeholder="ID">
              <input class="span2" type="password" name ="mxpw" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>&nbsp;
              <button type="button" class="btn" onClick="javascript:document.location.href='/member/register1';">Join us</button>
            </form>
          </div><!--/.nav-collapse -->
		</c:if>
	</c:otherwise>
</c:choose>
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->
    
    
    
    <!-- Menu=====================================================Menu -->
    
    
    
    

