<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
	
	<script>
	function tutor() {
	    var x = document.getElementById('myDIV');
	    if (x.style.display === 'none') {
	        x.style.display = 'block';
	    } else {
	        x.style.display = 'none';
	    }
	}
	</script>

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
					<input type="hidden" name="mxseq" id="mxseq" />
				</form>
	        		<table class="table table-bordered">
		  				<tr>
			  				<th>과정명</th>
			  				<th>공개 강좌 수강 가능 기간</th>
			  				<th>강사명</th>
			  			</tr>
	  				</div>
  				
	  				<c:if test="${!empty list}">
	  					<c:forEach var="list" items="${list}" varStatus="status">
							<tr>
								<td><a href="openLecture?coxseq=${list.coxseq}"><c:out value="${list.coxname}"/></a></td>
								<td><fmt:parseDate value="${list.coxstart}" var="dateFmt1" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/> ~ 
									<fmt:parseDate value="${list.coxend}" var="dateFmt2" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/></td>
								<td>
									<div class="dropdown">
										<button class="btn btn-small btn-primary disabled">${list.mxname}</button>
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
								</td>
							</tr>
						</c:forEach>
					</c:if>
          		</table>
        	</div>
        	
            
          	
			<c:if test="${!empty list}">
				<div class="pagination" style="text-align: center">
				  <ul>
				    <li><a href="#">Prev</a></li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">Next</a></li>
				  </ul>
				</div>
			</c:if>
        </div>
        <hr>
        
	</div> <!-- /container -->
	
<%@ include file="../include/footer.jsp"%>