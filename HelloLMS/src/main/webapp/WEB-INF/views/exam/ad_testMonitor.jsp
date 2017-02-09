<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){

		});

		//selectTestApply
		function goApplyList(n) {
			var url = '/admin/selectTestApply?coxseq='+n;
			winopen(url, "apply");
		}
		function goResultList(n) {
			var url = '/admin/selectTestresult?tpxseq='+n;
			winopen(url, "result");
		}
		function goScore(n) {
			if(confirm("가채점 하시겠습니까? 수동 채점한 답안도 모두 다시 채점 됩니다.")){
				var tpxseq = n;
				$.ajax({
					type : "POST",
					url : "/admin/updateScore",
					data : {
						tpxseq : tpxseq
					},
					dataType : "text"
				}).done(function(msg) {
					if(msg.length>0){
						alert(msg);
					} else {
						alert("완료되었습니다.");
					}
				});
			}
		}
		function goAnswerList(coxseq, tpxseq) {
			$('#coxseq').val(coxseq);
			$('#tpxseq').val(tpxseq);
			$('#form1').attr('action','/admin/selectResult');
			$('#form1').submit();
		}
		
		function winopen(url, title){
			var popUrl = url;
			var popOption = "width=300, height=400, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
				window.open(popUrl, title, popOption);
		}

		function goGrad(n) {
			if(confirm("마감 하시겠습니까? 과정에 대한 평가들의 평균으로 마감 됩니다.")){
				var coxseq = n;
				$.ajax({
					type : "POST",
					url : "/admin/updateScore3",
					data : {
						coxseq : coxseq
					},
					dataType : "text"
				}).done(function(msg) {
					if(msg.length>0){
						alert(msg);
					} else {
						alert("완료되었습니다.");
					}
				});
			}
		}
	</script>
	
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가현황 <small>...평가에 대한 모니터링을 합니다...</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3>  </h3>
		
		<form id="form1" method="post">
			<input type="hidden" name="coxseq" id="coxseq" />
			<input type="hidden" name="tpxseq" id="tpxseq" />
		</form>

		<c:if test="${ !empty testMonitorList }">
          <table class="table table-bordered">
  			<tr>
  				<th>일련번호</th>
  				<th>과정명-평가제목</th>
  				<th>평가기간(분)</th>
  				<th>대상자/응시자</th>
  				<th>관리</th>
  			</tr>
			<c:forEach var="testMonitor" items="${testMonitorList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count }"/></td>
					<td><c:out value="${testMonitor.coxname }"/>-<c:out value="${testMonitor.tpxtitle }"/></td>
					<td>
						<fmt:parseDate value="${testMonitor.tpxfrom}" var="dateFmt1" pattern="yyyyMMddHHmm"/>
						<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd HH:mm"/>~
						<fmt:parseDate value="${testMonitor.tpxto}" var="dateFmt2" pattern="yyyyMMddHHmm"/>
						<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd HH:mm"/>(<c:out value="${testMonitor.tpxduring }"/>)
					</td>
					<td><a href="javascript:goApplyList('${testMonitor.coxseq }');"><c:out value="${testMonitor.applycnt }"/></a>&nbsp;/&nbsp;
						<a href="javascript:goResultList('${testMonitor.tpxseq }');"><c:out value="${testMonitor.resultcnt }"/></a>
					</td>
					<td>
						<button class="btn btn-small" type="button" onClick="goScore('${testMonitor.tpxseq }');">가채점</button>
						<button class="btn btn-small" type="button" onClick="goAnswerList('${testMonitor.coxseq }','${testMonitor.tpxseq }');">응시자별</button>
						<button class="btn btn-small" type="button" onClick="goGrad('${testMonitor.coxseq }');">이수처리</button>
					</td>
				</tr>
			</c:forEach>
          </table>
     
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
		<c:if test="${ empty testMonitorList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>