<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#goInsert').click(function(){
				$('#form1').attr('action','/admin/testpoolWriteForm');
				$('#form1').submit();
			});
		});

		
		function goSelect() {
			$('#form1').attr('action','/admin/testpoolList');
			$('#form1').submit();
		}
		function goDelete(n) {
			if(confirm("문제를 삭제 하시겠습니까?")){
				$('#txseq').val(n);
				$('#coxseq2').val($('#coxseq1').val());
				$('#frm2').attr('action','/admin/testpoolDelete');
				$('#frm2').submit();
			}
		}
		function goWrite(n) {
			$('#txseq').val(n);
			$('#frm2').attr('action','/admin/testpoolWriteForm');
			$('#frm2').submit();
		}

	</script>
	
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가문제 리스트 <small>...과정별 평가 문제를 관리 할 수 있습니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3>  </h3>
                     
		<div class="alert alert-info">
	        <form id="form1" action="/admin/testpoolList" method="post">
	         <div class="row">
        		<div class="span12">
				  <div class="span8">
					<select class="span2" name="coxseq" id="coxseq1" placeholder="과정" onChange="javascript:goSelect();">
						<c:forEach var="course" items="${courseList}">
							<option value='<c:out value="${course.coxseq }"/>' <c:if test="${ !empty course && course.coxseq==coxseq }">selected</c:if>><c:out value="${course.coxname }"/></option>
							
						</c:forEach>
					</select>
				  </div>
				  <div class="span2" align="right">
					<button class="btn" id="goInsert">등록</button>
				  </div>
			    </div>
			  </div>
			</form>
			<form id="frm2" method="post">
				<input type="hidden" name="txseq" id="txseq" />
				<input type="hidden" name="coxseq" id="coxseq2" />
			</form>
		</div>
		<c:if test="${ !empty testpoolList }">
          <table class="table table-bordered">
  			<tr>
  				<th>일련번호</th>
  				<th>강의명</th>
  				<th>문제유형</th>
  				<th>문제</th>
  				<th>수정/삭제</th>
  			</tr>
			<c:forEach var="testpool" items="${testpoolList}" varStatus="status">
				<tr>
					<td><c:out value="${testpool.txseq }"/></td>
					<td><c:out value="${testpool.lxnum }"/>-<c:out value="${testpool.lxname }"/></td>
					<td><c:out value="${testpool.cxname }"/></td>
					<td><a href="javascript:goWrite('${testpool.txseq }');"><c:out value="${testpool.txcont }"/></a></td>
					<td>
						<button class="btn btn-small" type="button" onClick="goWrite('${testpool.txseq }');">수정</button>
						<button class="btn btn-small" type="button" onClick="goDelete('${testpool.txseq }');">삭제</button>
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
		<c:if test="${ empty testpoolList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>