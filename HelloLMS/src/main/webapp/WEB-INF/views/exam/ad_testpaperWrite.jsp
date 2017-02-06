<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#btnSubmit').click(function(){
				$('#form1').attr('action','/admin/testpaperWrite');
				
				if(checkVal()){
					$('#form1').submit();
				}
			});
			$('#btnList').click(function(){
				$('#tpxseq').val('');
				$('#form1').attr('action','/admin/testpaperList');
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
					
			} else {
				return false;
			}
		}

	</script>
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가지 <c:if test="${ !empty testpaper }">수정</c:if>
        	<c:if test="${ empty testpaper }">등록</c:if> <small>...과정별 평가정보를 등록합니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
          <form id="form1" method="post">
		    <input type="hidden" name="tpxseq" id="tpxseq"  value="${testpaper.tpxseq }">
			과정명 : <select class="span4" name="coxseq" placeholder="분류">
					<c:forEach var="course" items="${courseList}">
						<option value='<c:out value="${course.coxseq }"/>' <c:if test="${ !empty testpaper && course.coxseq==testpaper.coxseq }">selected</c:if>><c:out value="${course.coxname }"/></option>
					</c:forEach>
				</select><br>
			평가명 : <input type="text" class="span4" id=tpxtitle name="tpxtitle" maxlength="30" placeholder="평가명" value="${testpaper.tpxtitle }" required="required"><br>
			<c:if test="${ empty testpaper }">
				평가시작일시 : <input type="datetime-local" id="tpxfrom" name="tpxfrom" required="required"><br>
				평가종료일시 : <input type="datetime-local" id="tpxto" name="tpxto" required="required"><br>
			</c:if>
			<c:if test="${ !empty testpaper }">
				<fmt:parseDate value="${testpaper.tpxfrom}" var="dateFmt1" pattern="yyyyMMddHHmm"/>
				<fmt:parseDate value="${testpaper.tpxto}" var="dateFmt2" pattern="yyyyMMddHHmm"/>
				평가시작일시 : <input type="datetime-local" id="tpxfrom" name="tpxfrom" value='<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${dateFmt1}" pattern="HH:mm"/>'><br>
				평가종료일시 : <input type="datetime-local" id="tpxto" name="tpxto" value='<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${dateFmt2}" pattern="HH:mm"/>'><br>
			</c:if>
			시험시간(분) : <input type="number" class="span2" id="tpxduring" name="tpxduring" min="0" max="100"  placeholder="시간(분)" value="${testpaper.tpxduring }" required="required"><br>
			객관식문제수 : <input type="number" class="span2" id="tpx1cnt" name="tpx1cnt" min="0" max="99"  placeholder="객관식" value="${testpaper.tpx1cnt }">
			문제당 점수 : <input type="number" class="span2" id="tpx1score" name="tpx1score" min="0" max="100"  placeholder="점수" value="${testpaper.tpx1score }">
			<br>
			단답식문제수 : <input type="number" class="span2" id="tpx2cnt" name="tpx2cnt" min="0" max="99"  placeholder="단답식" value="${testpaper.tpx2cnt }">
			문제당 점수 : <input type="number" class="span2" id="tpx2score" name="tpx2score" min="0" max="100"  placeholder="점수" value="${testpaper.tpx2score }">
			<br>
			O&nbsp;X&nbsp;&nbsp;&nbsp;&nbsp;문제수 : <input type="number" class="span2" id="tpx3cnt" name="tpx3cnt" min="0" max="99"  placeholder="OX" value="${testpaper.tpx3cnt }">
			문제당 점수 : <input type="number" class="span2" id="tpx3score" name="tpx3score" min="0" max="100"  placeholder="점수" value="${testpaper.tpx3score }">
			<br>
			
			<button type="button" class="btn" id="btnSubmit">
				<c:if test="${ !empty testpaper.tpxseq }">수정</c:if>
				<c:if test="${ empty testpaper.tpxseq }">등록</c:if>
			</button>
			
			<button class="btn" id="btnList">취소</button>
		  </form>
          
        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>