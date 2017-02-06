<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false"%> --%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

 <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>

<script>
$('.carousel').carousel({
	  interval: 2000
	})
</script>

<style>

body{
	justify-content: center;
}

img.no-resize {
    width: 1000px;
    height: 350px;
    max-height : auto;
}

.section-title {
  border: 4px solid #000;
  padding : 30px;
  position: relative;
  text-align: center;
  margin-bottom: 42px;
}

 .modal-body{
      	margin: 0 auto 10px;
      	padding: 5px;      
      }
      
      
      .modal-header{
      align : center;
      padding: 19px 29px 19px;
      margin: 0 auto 20px;
      
      }
      
      
      .alert{
      
        margin-top :15px;
      	font-size: 15px;
      
      }
      
       .div-ohter {
        max-width: 500px;
        text-align : center;
        padding: 39px 39px 39px;
        margin: 0 auto 40px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      
  div.span3{  
    margin : 30px 70px 30px 30px;
  	padding : 30px;
 	letter-spacing: 0.02em;
 	text-transform: uppercase;
 	text-align: center; 	
    background:hsla(11, 94%, 50%, .65);    
 	float:center;
 	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);  
        
    float: center;
    -webkit-animation-name: Floatingx;
    -webkit-animation-duration: 3s;
    -webkit-animation-iteration-count: infinite;
    -webkit-animation-timing-function: ease-in-out;
    -moz-animation-name: Floating;
    -moz-animation-duration: 3s;
    -moz-animation-iteration-count: infinite;
    -moz-animation-timing-function: ease-in-out;  
    }   

@-webkit-keyframes Floatingx{
    from {-webkit-transform:translate(0, 0px)}
    65% {-webkit-transform:translate(0, 55px)}
    to {-webkit-transform: translate(0, -0px)}
}
    
@-moz-keyframes Floating{
    from {-moz-transform:translate(0, 0px);}
    65% {-moz-transform:translate(0, 15px);}
    to {-moz-transform: translate(0, -0px);}    
}
   
   div.span3:nth-child(2) {
          background:hsla(44, 94%, 50%, .65);
        }
        
    div.span3:nth-child(3) {
          background:hsla(114, 94%, 50%, .65);  
        }
        div.span3:nth-child(4) {
          background:hsla(144, 94%, 50%, .35);  
        }
        div.span3:nth-child(5) {
          background:hsla(224, 94%, 50%, .65);  
        }            
          div.span3:nth-child(6) {
          background:hsla(634, 94%, 50%, .65);  
        }   
   
   div.row-fluid{   	    
        text-align : center;
   }
.lms{
	text-align : cetner;
  	margin: 70px;
}

.stats-div {
    text-align:center;
    width: 100%;
    min-height: 100px;
    padding: 30px 20px 30px 20px;
}

.stats-div > h3 {
    font-size:30px;
    font-weight:600;
}
      
</style>

   <div class="container">
<!-- 
      Main hero unit for a primary marketing message or call to action
      <div class="hero-unit">
        <h1>Hello, LMS!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div> -->
      
      <!-- 슬라이드쇼  -->
      
   <div id="myCarousel" class="carousel slide">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- Carousel items -->
   <div class="carousel-inner">
   
   <c:forEach var="b" items="${b}" varStatus="status">
    <div class="active item" align="center">
    <a href="${b.adxurl1 }">
     <img class="no-resize" src="http://localhost/displayFile?fileName=${b.adxname1}" alt="">   </a> 
    </div>
    <div class="item" align="center">
    <a href="${b.adxurl2 }">
     <img class="no-resize"  src="http://localhost/displayFile?fileName=${b.adxname2}" alt=""> </a>
    </div>    
  <div class="item" align="center">    
  <a href="${b.adxurl3 }">
     <img class="no-resize"  src="http://localhost/displayFile?fileName=${b.adxname3}" alt=""> </a>
  </div>
    </c:forEach>
  </div>
  
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>

<hr>

<!-- 슬라이드 아래 -->
			<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
				<div class="section-title">
					<h5 class="wow bounceIn">Team HelloLMS</h5>
					<h1 class="heading">자유롭게 배움의 기회를 누리세요!</h1>
					<hr>
					<p>최신 인기 강의를 찾아보세요.</p>
				</div>
			</div>			
			
      <!-- 최신 강의 출력하기 -->      
 <div class ="row-fluid" >
<c:forEach var="c" items="${c}" varStatus="status">      
        <div class="span3">
          <h2>${c.coxname }</h2>
          <p>${c.coxintro }</p>
          <p><a class="btn" href="#">수강하기 &raquo;</a></p>
        </div>     
 </c:forEach>
</div>
 
 <hr>
 
 <!-- 유저수 -->
 
 <div> 
    <section class="lms">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span4">
                    <div class="stats-div">
                        <h3>5000+ </h3>
                        <h4>Users</h4>
                    </div>
                </div>
                <div class="span4">
                    <div class="stats-div">
                        <h3>205+ </h3>
                        <h4>Teachers</h4>
                    </div>
                </div>
                <div class="span4">
                    <div class="stats-div">
                        <h3>1300+ </h3>
                        <h4>Courses</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
 </div>
 
      <!-- 제휴 문의하기 -->
      
<section id="contact">
	<div class="container">
		<div class="row">
			
			<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
				<div class="section-title">
					<h5 class="wow bounceIn">새 직업을 찾아보세요</h5>
					<h1 class="heading">CONTACT US</h1>
					<hr>
					<a href="#email" data-toggle="modal"><p>제휴 문의를 하시려면 연락주세요.</p></a>
				</div>
			</div>
			

<div class="div-ohter" align="center">			
				
<div id="email" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">제휴를 문의하고 싶으신가요?</h3>
  </div>
  <div class="modal-body">
  <form action="/member/contact" method="post" >
    <p>이름 <input type="text" class="class="span2" name = "name" placeholder="Name"></p>  
    <p>이메일 <input type="text" class="class="span2" name = "mail" placeholder="Email"></p>
    <p>내용 <textarea class="form-control" placeholder="Message" rows="7" name="message"></textarea>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" type="submit" >보내!</button>
    </form>
  </div> 
</div>

</div>			
				
			
		</div>
	</div>
</section>
 
 
      
<%@ include file="include/footer.jsp"%>