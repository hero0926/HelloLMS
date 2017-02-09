<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
	
	<script>
		function Delete(mxseq, coxseq) {
			if(confirm("수강을 취소하시겠습니까?")){
				$('#mxseq').val(mxseq);
				$('#coxseq').val(coxseq);
				$('#frm2').attr('action','/mypage/mylecture/myApplyCourseDelete');
				$('#frm2').submit();
			}
		}
	</script>

	<div class="container">
	
		<div class="page-header">
        	<h1><small>My Page  >  내 강의</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<h3>내가 수강신청한 과정</h3>
        		<div class="alert alert-info">
	          	</div>
	          	<form id="frm2" method="post">
					<input type="hidden" name="coxseq" id="coxseq" />
					<input type="hidden" name="mxseq" id="mxseq" />
				</form>
	        		<table class="table table-bordered">
		  				<tr>
			  				<th>과정명</th>
			  				<th>수강 신청 기간</th>
			  				<th>수강 신청일</th>
			  				<th>승인여부</th>
			  				<th>수강 취소</th>
			  				<th>평가 결과</th>
			  			</tr>
	  				</div>
  				
	  				<c:if test="${!empty list}">
	  					<c:forEach var="applycourse" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${applycourse.coxname}"/></td>
								<td><fmt:parseDate value="${applycourse.coxreqstart}" var="dateFmt1" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/> ~ 
									<fmt:parseDate value="${applycourse.coxreqend}" var="dateFmt2" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:parseDate value="${applycourse.regdate}" var="dateFmt3" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt3}" pattern="yyyy-MM-dd"/></td>
								<td><c:choose>
										<c:when test="${applycourse.axstatus=='R'}">
											신청
										</c:when>
										<c:when test="${applycourse.axstatus=='A'}">
											승인
										</c:when>
										<c:when test="${applycourse.axstatus=='C'}">
											수강불가
										</c:when>
										<c:otherwise>
											입력 오류
										</c:otherwise>
									</c:choose><%-- <c:out value="${applycourse.axstatus}"/> --%></td>
								<td><c:choose>
										<c:when test="${applycourse.axstatus=='R'}">
											<button type="button" onClick="Delete('${mxseq}', '${applycourse.coxseq}');">수강취소</button>
										</c:when>
									</c:choose></td>
								<td><c:choose>
									<c:when test="${applycourse.axresult=='G'}">
										이수
									</c:when>
									<c:when test="${applycourse.axresult=='D'}">
										미이수
									</c:when>
									<c:otherwise></c:otherwise>
									</c:choose>
									<c:if test="${!empty applycourse.axscore}">(${applycourse.axscore})</c:if>
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