<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
	
		<script>
			var rest = ${trxrest};
			$(document).ready(function() {
				$('#trxrest').html(rest);
				setInterval(function(){
					rest--;
					$('#trxrest').html(rest);
					$.ajax({
						type : "POST",
						url : "/mypage/mylecture/updateRest",
						data : {
							trxrest: rest,
							tpxseq: ${tpxseq}
						},
						dataType : "text"
					}).done(function(data) {
					});
					if(rest<=0){
						alert('시험 시간이 종료되었습니다.');
						changeOrder2("submit");
					}
				}, 60000);
				
			});
			
			function changeOrder(taxorder){
				$('#passorder').val(taxorder);
				changeOrder2("pass");
			}
			function changeOrder2(mode){
				$('#mode').val(mode);
				$('#form1').attr('action','/mypage/mylecture/updateAnswer');
				$('#form1').submit();
			}
			
			
		</script>
		
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="alert alert-warning" role="alert">
						<h4>시험 시간 : <strong id="tpxduring">${tpxduring}분</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;남은시간 : <strong id="trxrest">분</strong></h4>
						<div align="right">
							<button type="button" class="btn" id="btnSubmit" onClick="changeOrder2('submit');">제출</button>
						</div>
					</div>
				</div>
				
				<hr>
				
	    		<form id="form1" method="post">
					<input type="hidden" name="tpxseq"  value="${testpool.tpxseq}">
					<input type="hidden" name="taxseq" id="taxseq" value="${testpool.taxseq}" />
					<input type="hidden" name="passorder" id="passorder" />
					<input type="hidden" name="mode" id="mode"/>
					<input type="hidden" name="taxorder" id="taxorder" value="${testpool.taxorder}" />
					
					
					
					<div class="span8">
						<div class="alert alert-info">
							<div id="txtype">
								<h4>${testpool.taxorder}번(문제유형: 
									<c:choose>
										<c:when test="${testpool.txtype==1}">
											객관식
										</c:when>
										<c:when test="${testpool.txtype==3}">
											OX
										</c:when>
										<c:otherwise>
											단답식
										</c:otherwise>
									</c:choose>)
								</h4>
							</div>
						</div>
						<div class="well">
							${testpool.txcont}
						</div>
						<c:if test="${testpool.txtype==1 || testpool.txtype==3}">
							<div class="breadcrumb">
								<c:if test="${testpool.taxanswer==1}">
									<input type="radio" name="taxanswer" value="1" checked="checked">1. ${testpool.tx1}
								</c:if>
								<c:if test="${testpool.taxanswer!=1}">
									<input type="radio" name="taxanswer" value="1">1. ${testpool.tx1}
								</c:if>
							</div>
							<div class="breadcrumb">
								<c:if test="${testpool.taxanswer==2}">
									<input type="radio" name="taxanswer" value="2" checked="checked">2. ${testpool.tx2}
								</c:if>
								<c:if test="${testpool.taxanswer!=2}">
									<input type="radio" name="taxanswer" value="2">2. ${testpool.tx2}
								</c:if>
							</div>
						</c:if>
						<c:if test="${testpool.txtype==1}">
							<div class="breadcrumb">
								<c:if test="${testpool.taxanswer==3}">
								<i	nput type="radio" name="taxanswer" value="3" checked="checked">3. ${testpool.tx3}
								</c:if>
								<c:if test="${testpool.taxanswer!=3}">
									<input type="radio" name="taxanswer" value="3">3. ${testpool.tx3}
								</c:if>
							</div>
							<div class="breadcrumb">
								<c:if test="${testpool.taxanswer==4}">
									<input type="radio" name="taxanswer" value="4" checked="checked">4. ${testpool.tx4}
								</c:if>
								<c:if test="${testpool.taxanswer!=4}">
									<input type="radio" name="taxanswer" value="4">4. ${testpool.tx4}
								</c:if>
							</div>
							<div class="breadcrumb">
								<c:if test="${testpool.taxanswer==5}">
									<input type="radio" name="taxanswer" value="5" checked="checked">5. ${testpool.tx5}
								</c:if>
								<c:if test="${testpool.taxanswer!=5}">
									<input type="radio" name="taxanswer" value="5">5. ${testpool.tx5}
								</c:if>
							</div>
						</c:if>
						<c:if test="${testpool.txtype==2}">
							<div class="breadcrumb">
								<input type="textarea" name="taxanswer">
							</div>
						</c:if>
					</div>
				</form>
				
				<div class="span4">
					<table class="table table-bordered">
						<c:forEach var="list" items="${testpoolList}" varStatus="status">
				 			<tr>
				 				<c:choose>
				 					<c:when test="${list.taxanswer==null || list.taxanswer==''}">
				 						<th style="background-color: #FFD9EC;">
				 					</c:when>
				 					<c:otherwise>
				 						<th>
				 					</c:otherwise>
				 				</c:choose>
				 				
				  				<a href="javascript:changeOrder('${list.taxorder}');">
				  					<h6>
				  						${list.taxorder}번( 문제유형:
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
									</h6>
								</a>
				  			</tr>
			  			</c:forEach>
			  		</table>
				</div>
			</div>
			
			<hr>
			
			<ul class="pager">
				<c:choose>
					<c:when test="${testpool.taxorder!=1}">
						<li class="previous">
							<a href="javascript:changeOrder2('older');">&larr; Older</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="previous disabled">
							<a href="javascript:alert('첫 번째 번호 입니다.')">&larr; Older</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${testpool.taxorder!=taxSize}">
						<li class="next">
						<a href="javascript:changeOrder2('next');">Newer &rarr;</a>
					</li>
					</c:when>
					<c:otherwise>
						<li class="next disabled">
						<a href="javascript:alert('마지막 번호 입니다.')">Newer &rarr;</a>
					</li>
					</c:otherwise>
				</c:choose>
			</ul>
		
		</div> <!-- /container -->

	</body>
</html>