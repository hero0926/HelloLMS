<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#btnSubmit').click(function(){
				$('#form1').attr('action','/admin/courseWrite');
				
				if(checkVal()){
					$('#form1').submit();
				}
			});
			$('#btnList').click(function(){
				$('#coxname').val('');
				$('#form1').attr('action','/admin/courseList');
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
        <h1>과정 <c:if test="${ !empty course }">수정</c:if>
        	<c:if test="${ empty course }">등록</c:if> <small>...기업별 과정을 등록합니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
          <form id="form1" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="coxseq"  value="${course.coxseq }">
		    <input type="hidden" name="coxoffice" value="${coxoffice }">
			<div class="alert alert-info">
	          <h3>회사 : ${coxofficenm }</h3>
			</div>
			<table class="table table-hover">
				<tr>
					<th>분야 </th>
					<td>
						<select class="span2" name="coxcate" placeholder="분류">
							<c:forEach var="cate" items="${cateList}">
								<option value='<c:out value="${cate.cxseq }"/>' <c:if test="${ !empty course && cate.cxseq==course.coxcate }">selected</c:if>><c:out value="${cate.cxname }"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>과정명 </th>
					<td>
						<input type="text" class="span4" id="coxname" name="coxname" maxlength="30" placeholder="과정명" value="${course.coxname }" required="required"><br>
					</td>
				</tr>
				
				<fmt:parseDate value="${course.coxstart}" var="dateFmt1" pattern="yyyyMMdd"/>
				<fmt:parseDate value="${course.coxend}" var="dateFmt2" pattern="yyyyMMdd"/>
				<fmt:parseDate value="${course.coxreqstart}" var="dateFmt3" pattern="yyyyMMdd"/>
				<fmt:parseDate value="${course.coxreqend}" var="dateFmt4" pattern="yyyyMMdd"/>
				
				<tr>
					<th>과정시작일</th>
					<td>
						<input type="date" class="span3" id="coxstart" name="coxstart" value='<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd"/>' required="required"><br>
					</td>
				</tr>
				<tr>
					<th>과정종료일 </th>
					<td>
						<input type="date" class="span3" id="coxend" name="coxend" value='<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/>' required="required"><br>
					</td>
				</tr>
				<tr>
					<th>수강신청시작일</th>
					<td>
						<input type="date" class="span3" id="coxreqstart" name="coxreqstart" value='<fmt:formatDate value="${dateFmt3}" pattern="yyyy-MM-dd"/>' required="required"><br>
					</td>
				</tr>
				<tr>
					<th>수강신청종료일 </th>
					<td>
						<input type="date" class="span3" id="coxreqend" name="coxreqend" value='<fmt:formatDate value="${dateFmt4}" pattern="yyyy-MM-dd"/>' required="required"><br>
					</td>
				</tr>
				<tr>
					<th>강사 </th>
					<td>
						<select class="span2" name="tuxseq">
							<c:forEach var="tutor" items="${tutorList}">
								<option value='<c:out value="${tutor.tuxseq }"/>' <c:if test="${ !empty course && tutor.tuxseq==course.tuxseq }">selected</c:if>><c:out value="${tutor.mxname }"/></option>
							</c:forEach>
						</select><br>
					</td>
				</tr>
				<tr>
					<th>과정소개</th>
					<td>
						<input type="text" class="span6" id="" name="coxintro" maxlength="100" placeholder="과정소개" value="${course.coxintro }"><br>
					</td>
				</tr>
				<tr>
					<th>공개 여부</th>
					<td>
						<label class="radio inline">
						  <input type="radio" name="coxopen" value="Y" <c:if test="${ !empty course && 'Y'==course.coxopen }">checked</c:if>>
						  공개
						</label>
						<label class="radio inline">
						  <input type="radio" name="coxopen" value="N" <c:if test="${ empty course || 'N'==course.coxopen }">checked</c:if>>
						  비공개
						</label><br>
					</td>
				</tr>
				<tr>
					<th>이수기준 진도 </th>
					<td>
						<input type="number" class="span2" id="coxprog" name="coxprog" min="0" max="100"  placeholder="진도" value="${course.coxprog }" required="required"><br>
					</td>
				</tr>
				<tr>
					<th>이수기준 평가점수</th>
					<td>
						<input type="number" class="span2" id="coxscore" name="coxscore" min="0" max="100"  placeholder="점수" value="${course.coxscore }" required="required"><br>
					</td>
				</tr>
				<tr>
					<th>강좌 이미지 등록</th>
					<td>
						<c:if test="${!empty course.coximgname}">
							OriginalFileName is ${course.coximgname}.
						</c:if>
						<input type="file" name="coximgname" />
					</td>
			</table>
			
			<div align="right">
				<button type="button" class="btn" id="btnSubmit">
					<c:if test="${ !empty course.coxseq }">수정</c:if>
					<c:if test="${ empty course.coxseq }">등록</c:if>
				</button>
				
				<button class="btn" id="btnList">취소</button>
			</div>
		  </form>
          
        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>