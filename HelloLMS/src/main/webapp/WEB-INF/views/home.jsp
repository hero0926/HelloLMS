<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false"%> --%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<link href="/resources/home/main.css" rel="stylesheet">

<style type="text/css">
	body {
		padding-top: 0px;
		padding-bottom: 0px;
	}
</style>

<script>

	$(document).ready(function (e){
		<c:if test="${(!empty Is_p)&&(empty USEQ) }">
			popupLayer();
		</c:if>
		
	});
	
	$('.carousel').carousel({
		  interval: 2000
		})
		
	function Popup() {
	    window.open("/FrmPopup",
	    "popup",
		"width = 700, height = 400, left = 300, top = 300, toolbar = no, location = no, directories = no, status = no, resizable = no"	);
		
	}

	function popupLayer(){
		var seq = ${Is_p.pxseq}; 
		cookiedata = document.cookie;
		var cookseq = "ncookie"+seq+"=done";
		if (cookiedata.indexOf(cookseq) < 0){ 
	    	 $('#apopup').trigger('click');
	    }
	}
	
	
	function setCookie( name, value, expirehours ) { 
	 var todayDate = new Date(); 
	 todayDate.setHours( todayDate.getHours() + expirehours ); 
	 document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	function closeWin() { 
	 	var seq = ${Is_p.pxseq};
		if(document.getElementById("pop_today").checked){
	 	 setCookie( "ncookie"+seq, "done" , 24 ); 
	 	}
	 document.getElementById('popup').style.display = "none";
	}

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
    background:hsla(1, 1%, 1%, .1);    
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
    65% {-webkit-transform:translate(0, -55px)}
    to {-webkit-transform: translate(0, -0px)}
}
    
@-moz-keyframes Floating{
    from {-moz-transform:translate(0, 0px);}
    65% {-moz-transform:translate(0, 15px);}
    to {-moz-transform: translate(0, -0px);}    
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

div.span3:hover {
    opacity: 0.8;
    filter: alpha(opacity=80); /* For IE8 and earlier */
}

</style>




	
    
    
    <div id="myCarousel" class="carousel slide">
    <a href="#popup" data-toggle="modal" id="apopup"></a>  
      <div class="carousel-inner">
      <c:forEach var="b" items="${b}" varStatus="status">
        <div class="item active">
          <img src="/resources/home/slide-01.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h2>Example headline.</h2>
              <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <a class="btn btn-large btn-primary" href="${b.adxurl1 }">View details</a>
              
            </div>
          </div>
        </div>
        <div class="item">
          <img src="/resources/home/slide-02.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h2>Another example headline.</h2>
              <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <a class="btn btn-large btn-primary" href="${b.adxurl2 }">View details</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="/resources/home/slide-03.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h2>One more for good measure.</h2>
              <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <a class="btn btn-large btn-primary" href="${b.adxurl3 }">View details</a>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->
    
    
    
    
    <!-- 슬라이드=====================================================슬라이드 -->
    
    
    
    
    <div class="test">
    <div class="container light">
			<h1>What can we offer</h1>
		<ul class="thumbnails">
		  <li class="span4">
		    <div class="thumbnail">
		      <img alt="" src="/resources/home/offerIcon1.png">
		      <h3>Well Connected</h3>
		      <p>Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate</p>
		    </div>
		  </li>
		
		  <li class="span4">
		    <div class="thumbnail">
		      <img alt="" src="/resources/home/offerIcon2.png">
		      <h3>Award Winning</h3>
		      <p>Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate</p>
		    </div>
		  </li>
		  
		  <li class="span4">
		    <div class="thumbnail">
		       <img alt="" src="/resources/home/offerIcon3.png">
		      <h3>Creative Thinking</h3>
		      <p>Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate</p>
		    </div>
		  </li>
		</ul>
	</div>
	</div>
    
    
    
    <!-- we offer...=====================================================we offer... -->
    
    
    
     <!-- Three columns of text below the carousel -->
     <div class="lecture">
     <div class="container light">
      <div class="row">
      	<c:forEach var="course" items="${c}">
      		<div class="span4">
      			<c:if test="${empty course.coximgname}">
		    		<img class="img-circle" data-src="holder.js/140x140" src="/resources/course/noimg.jpg">
		    	</c:if>
		    	<c:if test="${!empty course.coximgname}">
		      		<img alt="" src="/resources/course/${course.coximgname}">
		    	</c:if>
	          
	          <h2>${course.coxname}</h2>
	          <p>${course.coxintro}</p>
	          <p><a class="btn" href="/course/openLecture?coxseq=${course.coxseq}" data-slide="next">Take a class &raquo;</a></p>
	        </div>
      	</c:forEach>
      </div><!-- /.row -->
      </div>
	</div>
    
    
    
    <!-- 강의링크=====================================================강의링크 -->



















   <div class="container">
 
<!-- 
      Main hero unit for a primary marketing message or call to action
      <div class="hero-unit">
        <h1>Hello, LMS!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div> -->
      
      <!-- 팝업 -->
       
      
      <!-- 슬라이드쇼  -->

<hr>

<!-- 슬라이드 아래 -->
			<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
				<div class="section-title">
					<h5 class="wow bounceIn">Team HelloLMS</h5>
					<h1 class="heading">자유롭게 배움의 기회를 누리세요!</h1>
					<hr>
					<p>최신 인기 강의를 찾아보세요.</p>
					<br>
			        <form action="/scourse/list">
			        <div class="col-xs-5">         	         
			         	<input type="text" class="form-control col-xs-5" placeholder="Search : 과정명" name="coxname">
			   		
			   			<button class="btn btn-default" type="submit">
			     		<i class="icon-search icon-black"></i>
			  			</button>			  		
					</div>			
					</form>
				</div>
			</div>			
			
      <!-- 최신 강의 출력하기   --> 

 <hr>
 
 <!-- 유저수 -->
 <div> 
 <c:forEach var="m" items="${m}" varStatus="status"> 
 
    <section class="lms">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span4">
                    <div class="stats-div">
                        <h3>${m.s_count } </h3>
                        <h4>Users</h4>
                    </div>
                </div>
                <div class="span4">
                    <div class="stats-div">
                        <h3>${m.t_count } </h3>
                        <h4>Teachers</h4>
                    </div>
                </div>
                <div class="span4">
                    <div class="stats-div">
                        <h3>${m.c_count } </h3>
                        <h4>Courses</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:forEach>
 
 </div>
 
 
 
 
 <div class="main-container">
<div class="container dark">
		<h1>Meet the tutor</h1>
			<ul class="thumbnails">
				<c:forEach var="tutor" items="${tutor}">
				  	<li class="span3">
				    <div class="thumbnail">
				    	<c:if test="${empty tutor.tuxpicture}">
				    		<img alt="" src="/resources/tutor/tutor.jpg">
				    	</c:if>
				    	<c:if test="${!empty tutor.tuxpicture}">
				      		<img alt="" src="/resources/tutor/${tutor.tuxpicture}">
				    	</c:if>
				      <h3>${tutor.mxname}</h3>
				      <p>Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate</p>
				      <div class="social">
					      <img alt="" src="/resources/home/linkedin.png">
					      <img alt="" src="/resources/home/twitter.png">
					      <img alt="" src="/resources/home/facebook.png">
					      <img alt="" src="/resources/home/email.png">
				      </div>
				    </div>
				  </li>
			  </c:forEach>
			 </ul>
		</div>
	</div>
	
	<!-- 강사소개==================================================강사소개 -->

      
<div id="contact">
	<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
		<div class="section-title">
			<h5 class="wow bounceIn">새 강좌를 개설해 보세요.</h5>
			<h1 class="heading">CONTACT US</h1>
			<hr>
			<a href="#email" data-toggle="modal"><p>새로운 과정을 오픈 하시려면 연락주세요.</p></a>
		</div>
		
	</div>	
</div>



<div id="email" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <form action="/member/contact" method="post" >

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">과정 오픈 요청을 하고 싶으신가요?</h3>
		<h5>관리자에게 이메일로 요청됩니다.</h5>
	</div>
	<div class="modal-body">
		<p>이름 <input type="text" class="class="span2" name = "name" placeholder="Name"></p>  
		<!-- <p>이메일 <input type="text" class="class="span2" name = "mail" placeholder="Email"></p> -->
		<p>내용 <textarea class="form-control" placeholder="Message" rows="7" name="message"></textarea>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" type="submit" >전송</button>
	</div> 
  </form>
</div>

				
	<div id="popup" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onClick="closeWin();">×</button>
			<h3 id="myModalLabel">${Is_p.pxname}</h3>
		</div>
		<div class="modal-body">
			<img class="no-resize" src="/displayFile?fileName=${Is_p.pxfile}" alt="">
		</div>
		<div class="modal-footer">
			<button class="btn" type="button" onClick="window.open('${Is_p.pxurl}');" align="center">바로가기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="pop_today" id="pop_today" />하루 동안 이 창 열지 않음
			
		</div> 
	</div>

</div><!-- /container -->

<!-- <script src="/resources/holder.js"></script>
<script src="/resources/bootstrap-carousel.js"></script> -->
<script>
	!function ($) {
		$(function(){
			// carousel demo
			$('#myCarousel').carousel()
		})
	}(window.jQuery)
</script>
      
<%@ include file="include/footer.jsp"%>