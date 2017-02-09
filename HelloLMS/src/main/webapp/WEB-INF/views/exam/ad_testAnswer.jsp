<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>

	<script>
		function addScore(n) {
			if(confirm("점수를 등록 하시겠습니까?")){
				$('#taxseq').val(n);
				$('#taxscore').val(document.getElementById("taxscore"+n).value);
				alert($('#taxscore').val());
				$('#frm1').attr('action','/admin/addScore');
				$('#frm1').submit();
			}
		}

	</script>
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
       <h3>답안지</h3>
		<h3>${answerOne.mxname }(${answerOne.mxid })<br>
			<small>
				시험시작시간:${answerOne.trxstart }&nbsp;&nbsp;
				종료시간:${answerOne.trxend }<br>
				남은시간:${answerOne.trxrest }&nbsp;&nbsp;
				점수:${answerOne.trxscore }
			</small>
			<br>
			<button class="btn btn-small" type="button" onClick="self.close();">닫기</button>
		</h3>
		<form action="" id="frm1" method="post">
			<input type="hidden" id="taxseq" name="taxseq">
			<input type="hidden" id="taxscore" name="taxscore">
			<input type="hidden" name="trxseq" value="${answerOne.trxseq }">
		</form>
		<c:if test="${ !empty answerList }">
          <table class="table table-bordered">
  			<tr>
  				<th>번호</th>
  				<th>정답</th>
  				<th>문제점수</th>
  				<th>사용자답안</th>
  				<th>정답여부</th>
  				<th>맞은점수</th>
  				<th>수동채점</th>
  			</tr>
			<c:forEach var="answer" items="${answerList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count }"/></td>
					<td><c:out value="${answer.txcorrect }"/></td>
					<td><c:out value="${answer.txscore }"/></td>
					<td><c:out value="${answer.taxanswer }"/></td>
					<td><c:out value="${answer.taxcorrect }"/></td>
					<td><c:out value="${answer.taxscore }"/></td>
					<td><c:if test="${answer.txtype=='2'}">
							<input type="number" class="span2" id="taxscore<c:out value="${answer.taxseq }"/>" min="0" max="100"  placeholder="점수" value="${testpaper.taxscore }">
							<button class="btn btn-small" type="button" onClick="addScore('${answer.taxseq }');">채점</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
          </table>

		</c:if>
		<c:if test="${ empty answerList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

</body>
</html>