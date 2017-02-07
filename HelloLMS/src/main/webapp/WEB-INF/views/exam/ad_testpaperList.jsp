<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#goInsert').click(function(){
				$('#form1').attr('action','/admin/testpaperWriteForm');
				$('#form1').submit();
			});
		});

		
		function goSelect() {
			$('#form1').attr('action','/admin/testpaperList');
			$('#form1').submit();
		}
		function goDelete(n) {
			if(confirm("문제를 삭제 하시겠습니까? 삭제할 경우 사용자 답안도 삭제 됩니다.")){
				$('#tpxseq').val(n);
				$('#frm2').attr('action','/admin/testpaperDelete');
				$('#frm2').submit();
			}
		}
		function goWrite(n) {
			$('#tpxseq').val(n);
			$('#frm2').attr('action','/admin/testpaperWriteForm');
			$('#frm2').submit();
		}

	</script>
	
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가지 리스트 <small>...평가가 실시되는 일정을 관리합니다..</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3>  </h3>
                     
		<div class="alert alert-info" align="right">
	        <form id="form1" action="/admin/testpaperList" method="post">
	         	<button class="btn" id="goInsert">등록</button>
			</form>
			<form id="frm2" method="post">
				<input type="hidden" name="tpxseq" id="tpxseq" />
			</form>
		</div>
		<c:if test="${ !empty testpaperList }">
          <table class="table table-bordered">
  			<tr>
  				<th>일련번호</th>
  				<th>과정명</th>
  				<th>평가제목</th>
  				<th>평가기간(분)</th>
  				<th>수정/삭제</th>
  			</tr>
			<c:forEach var="testpaper" items="${testpaperList}" varStatus="status">
				<tr>
					<td><c:out value="${testpaper.tpxseq }"/></td>
					<td><c:out value="${testpaper.coxname }"/></td>
					<td><a href="javascript:goWrite('${testpaper.tpxseq }');"><c:out value="${testpaper.tpxtitle }"/></a></td>
					<td>
						<fmt:parseDate value="${testpaper.tpxfrom}" var="dateFmt1" pattern="yyyyMMddHHmm"/>
						<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd HH:mm"/>~
						<fmt:parseDate value="${testpaper.tpxto}" var="dateFmt2" pattern="yyyyMMddHHmm"/>
						<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd HH:mm"/>(<c:out value="${testpaper.tpxduring }"/>)
					</td>
					<td>
						<button class="btn btn-small" type="button" onClick="goWrite('${testpaper.tpxseq }');">수정</button>
						<button class="btn btn-small" type="button" onClick="goDelete('${testpaper.tpxseq }');">삭제</button>
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
		<c:if test="${ empty testpaperList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>