<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>


<script>

 ${doucment}.ready(function () {
	${'#apply'}.click(function () {
		$('#form1').attr('action','/course/apply');
		
		if(checkVal()){
			
			$()'}
		}
	})
	 
})



</script>

<div class="page-header">
	<h1>
		<small></small>
	</h1>
</div>

<div class="row">
	<div class="span12">
		<h3></h3>
		<div class="alert alert-info"></div>

		<table class="table table-bordered">
			<tr>

				<th>과정명</th>
				<th>신청 기간</th>
				<th>강사</th>
				<th>등록일</th>

			</tr>


			<c:forEach var="apply" items="${apply}">
				<tr>
					<td>${apply.coxname }</td>
					<td>${apply.coxstart }~ ${apply.coxend }</td>
					<td>${apply.tuxname }</td>
					<td>${apply.regdate }</td>


				</tr>
			</c:forEach>
		

		</table>
		
		<input type="button" onclick="apply" value="신청"/>
			
		
		<input type="button" onclick="apply_close" value="취소"/>
		
		
		
		
		
			
		
	
		
	</div>



</div>
<!-- /container -->

  </body>
</html>

