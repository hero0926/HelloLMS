<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#btnSubmit').click(function(){
				$('#form1').attr('action','/admin/quizWrite');
				
				if(checkVal()){
					$('#form1').submit();
					//return false;
				} else {
					return false;
				}
			});
			$('#btnList').click(function(){
				$('#form1').attr('action','/admin/lecture/lectureList');
				$('#form1').submit();
			});
		});

		function checkVal() {
			if(confirm("자료를 등록 하시겠습니까?")){
				var ok=true;
				$("input[required='required']").each(function(index){
					if($(this).val()==''){
						alert("입력이 필요한 항목이 있습니다.");
						$(this).focus();
						ok=false;
						return false;
					}
		        });
				$("textarea[required='required']").each(function(index){
					if($(this).val()==''){
						alert("입력이 필요한 항목이 있습니다.");
						$(this).focus();
						ok=false;
						return false;
					}
		        });

				$("input[type='number']").each(function(index){
					if($(this).val()=='') {
						$(this).val("0");
					}
					if(!$.isNumeric($(this).val())) {
						alert("숫자를 입력해야 합니다.");
						$(this).focus();
						ok=false;
						return false;
					}

		        });
				if(ok){
					return true;
				}else{
					return false;
				}
				
			}
		}
		
		function goDelete(n) {
			if(confirm("문제를 삭제하시겠습니까?")){
				$('#qxseq').val(n);
				$('#form1').attr('action','/admin/quizDelete');
				$('#form1').submit();
			}
		}

	</script>
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>퀴즈관리 <small>...강의별 퀴즈를 관리합니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
          <form id="form1" method="post">
		    <input type="hidden" name="lxseq" value="${quizList.get(0).lxseq }">
			<input type="hidden" name="coxseq" value="${quizList.get(0).coxseq }">
			<input type="hidden" name="qxseq" id="qxseq">
			<div class="alert alert-info">
	          <h3>강의 : ${quizList.get(0).lxnum }-${quizList.get(0).lxname }&nbsp;<button class="btn" id="btnList">◀강의실로 돌아가기</button></h3>
			</div>
			 순서 : <input type="number" class="span2" id="qxorder" name="qxorder" min="0" max="9"  placeholder="순서" required="required">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn" id="btnSubmit">등록</button>
			 <br>
			 문제 : <textarea rows="3" class="span10" name="qxcont" placeholder="문제" required="required"></textarea><br>
			 정답 : <label class="radio inline">
			   <input type="radio" name="qxcorrect" value="1" checked>
			       O
			  </label>
			  <label class="radio inline">
			    <input type="radio" name="qxcorrect" value="2">
			      X
			  </label><br>
			<hr>
			<c:if test="${ !empty quizList.get(0).qxseq }">
				<table class="table table-bordered">
		  			<tr>
		  				<th>퀴즈번호</th>
		  				<th>퀴즈</th>
		  				<th>답</th>
		  				<th>삭제</th>
		  			</tr>
					<c:forEach var="quiz" items="${quizList}" varStatus="status">
						<tr>
							<td><c:out value="${quiz.qxorder }"/></td>
							<td><c:out value="${quiz.qxcont }"/></td>
							<td><c:choose>
								    <c:when test="${quiz.qxcorrect eq '1'}">
								        O
								    </c:when>
								    <c:otherwise>
								        X
								    </c:otherwise>
								</c:choose>
							</td>
							<td><button class="btn btn-small" type="button" onclick="goDelete('${quiz.qxseq }')">삭제</button></td>
						</tr>
					</c:forEach>
		          </table>
	          </c:if>

			
			
		  </form>
          
        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>