<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

<style>
.content{

text-align : center;

}

.table-hover{

text-align : center;

}


.hoverthings{

  background : #fffff;
  cursor: pointer;
  position: relative;
  bottom: 0;
  transition: all 0.4s linear;
  padding: 62px 22px 62px 22px;
  margin-top: 20px;
  margin-bottom : 30px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  float: right;
  position: relative;
  left: -7.5%;

}

.hoverthings:hover {
  background : #fffff;
  bottom: 100px;
}

.courseheader{

	margin-bottom: 4px solid #D8D8D8;
    padding: 0 0 15px 0;
    margin: 30px 0px;
    list-style: none;
    text-align: center;
    font-size: 25px;
}

</style>

	<div class="container">
	
		<div class="page-header">
        	<h1><small>강의실  > 공개강좌</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<h3>공개 강좌 목록</h3>
        		<div class="alert alert-info">
	          	</div>
	          	<form id="frm2" method="post">
					<input type="hidden" name="coxseq" id="coxseq" />
				</form>
        	</div>
        	
        	<div class="content">
	            <c:if test="${empty list}">
					자료가 없습니다.
				</c:if>
				
				<c:forEach var="list" items="${list}" varStatus="status">
					<div class="span3 hoverthings">
							<div class="courseheader">
								<h4>${list.coxname}<br></h4>
								<c:if test="${empty list.coximgname}">
									<img src="/resources/course/noimg.jpg">
								</c:if>
								<c:if test="${!empty list.coximgname}">
									<div align="center">
										<div style="max-width: 100%; width: 230px; max-height: 150px;">
											<img src="/resources/course/${list.coximgname}" style="max-width: 100%; height: auto;">
										</div>
									</div>
								</c:if>
							</div>
						
						<div class="alert alert-info">
							<h5>과정 소개: ${list.coxintro}</h5>
							<h5>강사명: ${list.mxname}
								<div class="dropdown">
									<i class="icon-search"></i>
									<div class="dropdown-content">
										<c:if test="${!empty list.tuxpicture}">
											<img src="/resources/tutor/${list.tuxpicture}">
										</c:if>
										<c:if test="${empty list.tuxpicture}">
											<img src="/resources/tutor/tutor.jpg">
										</c:if><br>
										강사 이력: ${list.tuxhistory}<br>
										강사 좋아요: ${list.cnt}
									</div>
								</div>
							</h5>
							<a href="openLecture?coxseq=${list.coxseq}">
								<button class="btn btn-small btn-primary disabled">과정 수강</button>
							</a>
						</div>
					</div>
				</c:forEach>
          	</div>
			
        </div>                                                                                                
        <hr>
        
	</div> <!-- /container -->
	
<%@ include file="../include/footer.jsp"%>