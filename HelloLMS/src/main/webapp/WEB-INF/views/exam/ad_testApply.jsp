<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
       <h3>평가대상자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-small" type="button" onClick="self.close();">닫기</button></h3>
		
		<c:if test="${ !empty applyList }">
          <table class="table table-bordered">
  			<tr>
  				<th>일련번호</th>
  				<th>이름</th>
  				<th>아이디</th>
  			</tr>
			<c:forEach var="apply" items="${applyList}" varStatus="status">
				<tr>
					<td><c:out value="${status.count }"/></td>
					<td><c:out value="${apply.mxid }"/></td>
					<td><c:out value="${apply.mxname }"/></td>
				</tr>
			</c:forEach>
          </table>

		</c:if>
		<c:if test="${ empty applyList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

</body>
</html>