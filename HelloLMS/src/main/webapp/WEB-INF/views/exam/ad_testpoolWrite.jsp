<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#btnSubmit').click(function(){
				$('#form1').attr('action','/admin/testpoolWrite');
				
				if(checkVal()){
					//alert("");
					$('#form1').submit();
					//return false;
				} else {
					return false;
				}
			});
			$('#btnList').click(function(){
				$('#form1').attr('action','/admin/testpoolList');
				$('#txseq').val('');
				$('#form1').submit();
			});
		});
		
		function checkVal() {
			if(confirm("자료를 등록 하시겠습니까?")){
				if($(':radio[name="txtype"]:checked').val()=="1"){
					$('#txcorrect').val($(':radio[name="corr"]:checked').val());
				} else if($(':radio[name="txtype"]:checked').val()=="3"){
					if($(':radio[name="corr"]:checked').val()=="1"||$(':radio[name="corr"]:checked').val()=="2"){
						$('#txcorrect').val($(':radio[name="corr"]:checked').val());
					}else{
						alert("OX의 경우엔 1번(O)과 2번(X) 만 선택할 수 있습니다.");
						return false;
					}
				}
				if($("input[required='required']").val()=='') {
					alert("입력이 필요한 항목이 있습니다.");
					return false;
				}
				return true;
			}
		}

	</script>
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가 문제 <c:if test="${ !empty testpool }">수정</c:if>
        	<c:if test="${ empty testpool }">등록</c:if> <small>...과정별 평가문제를 등록합니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
          <form id="form1" method="post">
		    <input type="hidden" name="txseq" id="txseq" value="${testpool.txseq }">
		    <input type="hidden" name="coxseq"  value="${coxseq }">
			<div class="alert alert-info">
	          <h3>과정명 : ${course }</h3>
			</div>
			강의회차 : <select class="span2" name="lxseq" placeholder="회차">
					<c:forEach var="lec" items="${lexList}">
						<option value='<c:out value="${lec.lxseq }"/>' <c:if test="${ !empty testpool && testpool.lxseq==lec.lxseq }">selected</c:if>><c:out value="${lec.lxnum }"/>:<c:out value="${lec.lxname }"/></option>
					</c:forEach>
				</select><br>
			타입 : 
			<label class="radio inline">
			  <input type="radio" name="txtype" value="1" <c:if test="${ empty testpool || '1'==testpool.txtype }">checked</c:if>>
			  객관식
			</label>
			<label class="radio inline">
			  <input type="radio" name="txtype" value="2" <c:if test="${ !empty testpool && '2'==testpool.txtype }">checked</c:if>>
			  단답식
			</label>
			<label class="radio inline">
			  <input type="radio" name="txtype" value="3" <c:if test="${ !empty testpool && '3'==testpool.txtype }">checked</c:if> onClick="javascript:alert('[O]일 경우 1번을 [X]일 경우 2번을 정답으로 체크 하십시오.')">
			  OX
			</label><br>
						
			문제 : <textarea rows="3" class="span10" name="txcont" placeholder="문제" required="required">${testpool.txcont }</textarea><br>
			
			<label class="radio">
			  1.<input type="radio" name="corr" value="1" <c:if test="${ empty testpool || '1'==testpool.txcorrect }">checked</c:if>>
			  <input type="text" name="tx1" id="tx" value="${testpool.tx1 }" class="span10" placeholder="보기1">
			</label>
			<label class="radio">
			  2.<input type="radio" name="corr" value="2" <c:if test="${ !empty testpool && '2'==testpool.txcorrect }">checked</c:if>>
			  <input type="text" name="tx2" id="tx" value="${testpool.tx2 }" class="span10" placeholder="보기2">
			</label>
			<label class="radio">
			  3.<input type="radio" name="corr" value="3" <c:if test="${ !empty testpool && '3'==testpool.txcorrect }">checked</c:if>>
			  <input type="text" name="tx3" id="tx" value="${testpool.tx3 }" class="span10" placeholder="보기3">
			</label>
			<label class="radio">
			  4.<input type="radio" name="corr" value="4" <c:if test="${ !empty testpool && '4'==testpool.txcorrect }">checked</c:if>>
			  <input type="text" name="tx4" id="tx" value="${testpool.tx4 }" class="span10" placeholder="보기4">
			</label>
			<label class="radio">
			  5.<input type="radio" name="corr" value="5" <c:if test="${ !empty testpool && '5'==testpool.txcorrect }">checked</c:if>>
			  <input type="text" name="tx5" id="tx" value="${testpool.tx5 }" class="span10" placeholder="보기5">
			</label><br>
			
			정답 : <input type="text" class="span10" id="txcorrect" name="txcorrect" maxlength="30" placeholder="정답" value="${testpool.txcorrect }" required="required"><br>
			
			<button type="submit" class="btn" id="btnSubmit">
				<c:if test="${ !empty testpool.txseq }">수정</c:if>
				<c:if test="${ empty testpool.txseq }">등록</c:if>
			</button>
			
			<button class="btn" id="btnList">취소</button>
		  </form>
          
        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>