<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#goSelect').click(function(){
				$('#form1').attr('action','/admin/courseList');
				$('#form1').submit();
			});
			$('#goInsert').click(function(){
				$('#form1').attr('action','/admin/courseWriteForm');
				$('#form1').submit();
			});
		});
		
		function goDelete(n) {
			if(confirm("과정을 삭제하시겠습니까? 과정에 관한 모든 정보가 함께 삭제 됩니다.")){
				$('#coxseq').val(n);
				$('#coxoffice2').val($('#coxoffice1').val());
				$('#frm2').attr('action','/admin/courseDelete');
				$('#frm2').submit();
			}
		}
		function goWrite(n) {
			$('#coxseq').val(n);
			$('#coxoffice2').val($('#coxoffice1').val());
			$('#frm2').attr('action','/admin/courseWriteForm');
			$('#frm2').submit();
		}
		function goLecture(n) {
			$('#coxseq').val(n);
			$('#coxoffice2').val($('#coxoffice1').val());
			//$('#frm2').attr('action','/admin/lectureList');
			//$('#frm2').submit();
		}
		function goApply(n) {
			$('#coxseq').val(n);
			$('#coxoffice2').val($('#coxoffice1').val());
			//$('#frm2').attr('action','/admin/applyList');
			//$('#frm2').submit();
		}

	</script>
	
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>과정 리스트 <small>...기업별 과정을 관리 할 수 있습니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3>  </h3>
                     
		<div class="alert alert-info">
	        <form id="form1" action="/admin/courseList" method="post">
	         <div class="row">
        		<div class="span12">
				  <div class="span8">
					<select class="span2" name="coxoffice" placeholder="회사" id="coxoffice1">
						<c:forEach var="biz" items="${bizList}">
							<option value='<c:out value="${biz.cxseq }"/>' <c:if test="${ !empty coxoffice && biz.cxseq==coxoffice }">selected</c:if>><c:out value="${biz.cxname }"/></option>
							
						</c:forEach>
					</select>
					&nbsp;
					<input type="text" class="span2" id="coxname" name="coxname" maxlength="20" placeholder="과정명">
					&nbsp;진행중인과정<input type="checkbox" name="term" value="term">
					<button class="btn" id="goSelect">검색</button>
				  </div>
				  <div class="span2" align="right">
					<button class="btn" id="goInsert">등록</button>
				  </div>
			    </div>
			  </div>
			</form>
			<form id="frm2" method="post">
				<input type="hidden" name="coxseq" id="coxseq" />
				<input type="hidden" name="coxoffice" id="coxoffice2" />
			</form>
		</div>
		<c:if test="${ !empty courseList }">
          <table class="table table-bordered">
  			<tr>
  				<th>분류</th>
  				<th>과정명</th>
  				<th>수강신청기간</th>
  				<th>수강기간</th>
  				<th>강의관리</th>
  				<th>수강생관리</th>
  				<th>수정/삭제</th>
  			</tr>
			<c:forEach var="course" items="${courseList}" varStatus="status">
				<tr>
					<td><c:out value="${course.cxname }"/></td>
					<td><a href="javascript:goWrite('${course.coxseq }');"><c:out value="${course.coxname }"/></a></td>
					<td>
						<fmt:parseDate value="${course.coxreqstart}" var="dateFmt1" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/>~
						<fmt:parseDate value="${course.coxreqend}" var="dateFmt2" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<fmt:parseDate value="${course.coxstart}" var="dateFmt3" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${dateFmt3}" pattern="yyyy-MM-dd"/>~
						<fmt:parseDate value="${course.coxend}" var="dateFmt4" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${dateFmt4}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<button class="btn btn-small" type="button" onClick="goLecture('${course.coxseq }');">강의</button>
					</td>
					<td>
						<button class="btn btn-small" type="button" onClick="goApply('${course.coxseq }');">수강생</button>
					</td>
					<td>
						<button class="btn btn-small" type="button" onClick="goWrite('${course.coxseq }');">수정</button>
						<button class="btn btn-small" type="button" onClick="goDelete('${course.coxseq }');">삭제</button>
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
		<c:if test="${ empty courseList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>