<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>

		<script>
			function doAjax(taxorder) {
				alert(taxorder);
				alert($('#curOrder'));
				if(key==1){
					arr[0]=key;
					alert(key);
				}else if(key==2){
					arr[1]=key;
					alert(key);
				}else{
					arr[2]=key;
					alert(key);
				}
				$.ajax({
					type : "POST",
					url : "/mypage/mylecture/ajaxTest",
					data : {
						key: key
					},
					dataType : "text"
				}).done(function() {
					alert(arr);
				});
			}
		</script>
		
		<div class="container">
			<div class="row">
	    		<form id="form1" method="post">
					<%-- <input type="hidden" name="txseq" id="txseq" value="${testpool.txseq}">
					<input type="hidden" name="coxseq"  value="${coxseq}"> --%>
					<c:set var="curOrder" value="1" />
					<div class="span8">
						<c:forEach var="list" items="${testpoolList}" varStatus="status">
							<c:if test="${list.taxorder==curOrder}">
								<div class="alert alert-info">
									<h4>${list.taxorder}번( 문제유형:
										<c:choose>
			  								<c:when test="${list.txtype==1}">
			  									객관식
										  	</c:when>
										  	<c:when test="${list.txtype==3}">
										  		OX
										  	</c:when>
										  	<c:otherwise>
										  		단답식
										  	</c:otherwise>
										</c:choose>)
									</h4>
								</div>
								<div class="well">${list.txcont}</div>
								
								
								<c:if test="${list.txtype==1 || list.txtype==3}">
									<div class="breadcrumb">
										<c:if test="${!empty list.tx1}">
											<label class="radio inline">
												1. <input type="radio" name="taxanswer" value="1">
												 	${list.tx1}
											</label><br>
										</c:if>
									</div>
								</c:if>
								<c:if test="${list.txtype==1 || list.txtype==3}">
									<div class="breadcrumb">
										<c:if test="${!empty list.tx2}">
											<label class="radio inline">
												2. <input type="radio" name="taxanswer" value="2">
												 	${list.tx2}
											</label><br>
										</c:if>
									</div>
								</c:if>
								<c:if test="${list.txtype==1}">
									<c:if test="${!empty list.tx3}">
										<div class="breadcrumb">
											<label class="radio inline">
												3. <input type="radio" name="taxanswer" value="3">
												 	${list.tx3}
											</label><br>
										</div>
									</c:if>
									<c:if test="${!empty list.tx4}">
										<div class="breadcrumb">
											<label class="radio inline">
												4. <input type="radio" name="taxanswer" value="4">
												 	${list.tx4}
											</label><br>
										</div>
									</c:if>
									<c:if test="${!empty list.tx5}">
										<div class="breadcrumb">
											<label class="radio inline">
												5. <input type="radio" name="taxanswer" value="5">
												 	${list.tx5}
											</label><br>
										</div>
									</c:if>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div class="span4">
						<table class="table table-bordered">
							<c:forEach var="list" items="${testpoolList}" varStatus="status">
					 			<tr>
					  				<th>
						  				<a href="javascript:doAjax('${list.taxorder}');">
						  					<h6>${list.taxorder}번( 문제유형:
												<c:choose>
					  								<c:when test="${list.txtype==1}">
					  									객관식
												  	</c:when>
												  	<c:when test="${list.txtype==3}">
												  		OX
												  	</c:when>
												  	<c:otherwise>
												  		단답식
												  	</c:otherwise>
												</c:choose>)</h6>
										</a>
									</th>
					  			</tr>
				  			</c:forEach>
				  		</table>
					</div>
							
		
		<button type="button" class="btn" id="btnSubmit">
			<c:if test="${ !empty testpool.txseq }">수정</c:if>
		<c:if test="${ empty testpool.txseq }">등록</c:if>
		</button>
		
		<button class="btn" id="btnList">취소</button>
					
				</form>
		</div>
		
		<ul class="pager">
  <li class="previous">
    <a href="#">&larr; Older</a>
  </li>
  <li class="next">
    <a href="#">Newer &rarr;</a>
  </li>
</ul>
		
		<hr>
		<a href="javascript:doAjax('1');">test1</a>
		<a href="javascript:doAjax('2');">test2</a>
		<a href="javascript:doAjax('3');">test3</a>
		
		</div> <!-- /container -->

	</body>
</html>