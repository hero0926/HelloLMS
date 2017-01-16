<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (){
			
			$('#deleteBtn').click(function(){
				if(confirm("")){
					
					
				}
				
			})
		
		});
		

	</script>
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>Code 리스트 <small>...각 분야별로 사용되는 코드를 관리 할 수 있습니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span4">
       
		  <h3>코드구분</h3>
          <table class="table table-bordered">
  			<tr>
  				<th>분류</th>
  				<th>코드</th>
  				<th>코드명</th>
  			</tr>
		<c:if test="${ !empty list1 }">
			<c:forEach var="code" items="${list1}" varStatus="status">
				<tr>
					<td><c:out value="${code.cxgubun }"/></td>
					<td><a href="/admin/?cxgubun=${code.cxcode }"><c:out value="${code.cxcode }"/></a></td>
					<td><c:out value="${code.cxname }"/></td>
				</tr>
			</c:forEach>
		</c:if>
          </table>
     
        </div>
        
        <div class="span8">
        <h3>코드상세</h3>
                     
		<div class="alert alert-info">
	        <form class="form-inline" action="insertCode" method="post">
			  분류
			 <input type="text" class="span1" id="cxgubun" name="cxgubun" maxlength="3" size="3" placeholder="분류">
			 <input type="text" class="span1" id="cxcode" name="cxcode" maxlength="3" size="3" placeholder="코드">
			 <input type="text" id="cxname" name="cxname" maxlength="25" size="25" placeholder="코드명">
			 <button type="submit" class="btn">등록</button>
			</form>
		</div>
		<c:if test="${ !empty list2 }">
          <table class="table table-bordered">
  			<tr>
  				<th>분류</th>
  				<th>코드</th>
  				<th>코드명</th>
  				<th>수정/삭제</th>
  			</tr>
			<c:forEach var="code2" items="${list2}" varStatus="status">
				<tr>
					<td><c:out value="${code2.cxgubun }"/></td>
					<td><c:out value="${code2.cxcode }"/></td>
					<td><c:out value="${code2.cxname }"/></td>
					<td><button class="btn btn-small" type="button" id="deleteBtn">삭제</button></td>
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

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>