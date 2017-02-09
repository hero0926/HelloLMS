<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
       <h3>응시자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-small" type="button" onClick="self.close();">닫기</button></h3>
		<c:if test="${ !empty resultList }">
          <table class="table table-bordered">
  			<tr>
  				<th>일련번호</th>
  				<th>이름</th>
  				<th>아이디</th>
  				<th>시험시작시간</th>
  				<th>종료시간</th>
  				<th>남은시간(분)</th>
  				<th>점수</th>
  			</tr>
			<c:forEach var="testresult" items="${resultList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count }"/></td>
					<td><c:out value="${testresult.mxid }"/></td>
					<td><c:out value="${testresult.mxname }"/></td>
					<td><c:out value="${testresult.trxstart }"/></td>
					<td><c:out value="${testresult.trxend }"/></td>
					<td><c:out value="${testresult.trxrest }"/></td>
					<td><c:out value="${testresult.trxscore }"/></td>
				</tr>
			</c:forEach>
          </table>

		</c:if>
		<c:if test="${ empty resultList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

</body>
</html>