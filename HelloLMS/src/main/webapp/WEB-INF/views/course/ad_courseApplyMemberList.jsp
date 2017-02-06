<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		function allApplyStatus(status) {
			$('#status').val(status);
			$('#frm2').attr('action','/admin/course/allApplyStatus');
			$('#frm2').submit();
		}
		function goStatus(axseq, status) {
			$('#axseq').val(axseq);
			$('#status').val(status);
			$('#frm2').attr('action','/admin/course/applyStatusMod');
			$('#frm2').submit();
		}
		function historyPopup(coxseq, mxseq){
			var popUrl = "historyPopup?coxseq="+coxseq+"&mxseq="+mxseq;
			var popOption = "width=1080, height=720, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
				window.open(popUrl, "history", popOption);
			}
	</script>
	
	<div class="container">
	
		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="page-header">
			<h1>수강생 리스트<small>...과정 신청 수강생 리스트 입니다.</small></h1>
		</div>
		
		<form id="frm2" method="post">
			<input type="hidden" name="axseq" id="axseq" />
			<input type="hidden" name="status" id="status" />
			<input type="hidden" name="coxseq" id="coxseq" value="${coxseq}" />
		</form>
		
		<!-- Example row of columns -->
		<div class="row">
			<div class="span12">

				<div class="alert alert-info">
					<h3>과정명: ${coxname}</h3>
				</div>
				
				<div style="float: right;" >	
					<button class="btn btn-small" type="button" onClick="allApplyStatus('A');">전체 수강 승인</button>&nbsp;&nbsp;
					<button class="btn btn-small" type="button" onClick="allApplyStatus('C');">전체 수강 취소</button>
				</div>
				<br><hr>
				
				<c:if test="${!empty list}">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
	  						<th>수강생 ID</th>
			  				<th>수강생 이름</th>
			  				<th>수강 신청일</th>
			  				<th>상태</th>
			  				<th>승인</th>
			  				<th>수강이력</th>
			  			</tr>
						
						<c:forEach var="apply" items="${list}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><c:out value="${apply.mxid}"/></td>
								<td><c:out value="${apply.mxname}"/></td>
								<td>
									<fmt:parseDate value="${apply.regdate}" var="dateFmt3" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateFmt3}" pattern="yyyy-MM-dd"/>
								</td>
								<td>
									<c:if test="${apply.axstatus=='R'}">
										신청
									</c:if>
									<c:if test="${apply.axstatus=='A'}">
										승인
									</c:if>
									<c:if test="${apply.axstatus=='C'}">
										수강 불가
									</c:if>
								</td>
								<td>
									<c:if test="${apply.axstatus=='R'}">
										<button class="btn btn-small" type="button" onClick="goStatus('${apply.axseq}', '${apply.axstatus}');">승인</button>
									</c:if>
									<c:if test="${apply.axstatus=='A'}">
										<button class="btn btn-small" type="button" onClick="goStatus('${apply.axseq}', '${apply.axstatus}');">수강 불가</button>
									</c:if>
									<c:if test="${apply.axstatus=='C'}">
										<button class="btn btn-small" type="button" onClick="goStatus('${apply.axseq}', '${apply.axstatus}');">승인</button>
									</c:if>
								</td>
								<td>
									<button class="btn btn-small" type="button" onClick="historyPopup('${coxseq}', '${apply.mxseq}');">수강 이력</button>
								</td>
							</tr>
						</c:forEach>
					</table>
					<br>
        		  
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
		
				<c:if test="${empty list}">
					자료가 없습니다.
				</c:if>
				
			</div>
		</div>
		
		<hr>
		
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>