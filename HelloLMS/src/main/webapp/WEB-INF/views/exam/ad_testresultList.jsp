<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#goMonitor').click(function(){
				$('#form1').attr('action','/admin/testMonitor');
				$('#form1').submit();
			});
		});

		
		function goAnswer(n) {
			var url = '/admin/selectAnswer?trxseq='+n;
			winopen(url, "answer");
		}
		
		
		function winopen(url, title){
			var popUrl = url;
			var popOption = "width=800, height=800, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
				window.open(popUrl, title, popOption);
		}

	</script>
	
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가 대상자 <small>...응시자의 답안을 관리 할 수 있습니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3>  </h3>
                     
		<div class="alert alert-info">
	        <form id="form1" action="/admin/resultList" method="post">
	         <div class="row">
        		<div class="span11" align="right">
				  <button class="btn" id="goMonitor">돌아가기</button>
			    </div>
			  </div>
			</form>
		</div>
		<c:if test="${ !empty resultList }">
          <table class="table table-bordered">
  			<tr>
  				<th>일련번호</th>
  				<th>이름</th>
  				<th>아이디</th>
  				<th>평가시작시간</th>
  				<th>종료시간</th>
  				<th>남은시간</th>
  				<th>점수</th>
  				<th>답안관리</th>
  			</tr>
			<c:forEach var="resultList" items="${resultList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count }"/></td>
					<td><c:out value="${resultList.mxname }"/></td>
					<td><c:out value="${resultList.mxid }"/></td>
					<td><c:out value="${resultList.trxstart }"/></td>
					<td><c:out value="${resultList.trxend }"/></td>
					<td><c:out value="${resultList.trxrest }"/></td>
					<td><c:out value="${resultList.trxscore }"/></td>
					<td>
						<c:if test="${ ! empty resultList.trxseq }">
							<button class="btn btn-small" type="button" onClick="goAnswer('${resultList.trxseq }');">답안</button>
						</c:if>
						<c:if test="${ empty resultList.trxseq }">
							미응시
						</c:if>
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
		<c:if test="${ empty resultList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>