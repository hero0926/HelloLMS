<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#btnSubmit').click(function(){
				$('#form1').attr('action','/admin/lecture/lectureInsert');
				$('#form1').submit();
			});
			$('#btnMod').click(function(){
				$('#form1').attr('action','/admin/lecture/lectureMod');
				$('#form1').submit();
			});
			$('#btnList').click(function(){
				$('#form1').attr('action','/admin/lecture/lectureList');
				$('#form1').submit();
			});
		});
		
		function checkVal() {
			if(confirm("자료를 등록 하시겠습니까?")){
				if($("input[required='required']").val()=='') {
					alert("false");
					return false;
				}
				//$("input[type='number']").attr('value', '333');
				if(!$.isNumeric($("input[type='number']").val())) {
					return false;
				}
				
				
			}
		}

	</script>
	<div class="container">
	<div class="page-header">
		<h1>강의 등록<small>...과정별 강의를 등록합니다.</small></h1>
	</div>
	
	<c:forEach var="test" items="list" end="2" varStatus="status">
		<c:set value="${list[status.index].coxname}" var="coxname" />
	</c:forEach>
	
	<div class="row">
		<div class="span12">
			<form action="/admin/lecture/lectureInsert" id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="coxseq" value="${coxseq}">
				<input type="hidden" name="lxseq" value="${lxseq}">
				
				<div class="alert alert-info">
					<h3>강의명: ${coxname}</h3>
				</div>
				회차: <c:if test="${empty lxseq}"><input type="text" name="lxnum" /></c:if>
					<c:if test="${!empty lxseq}">${lxnum}</c:if><br>
				강의명: <input type="text" class="span4" name="lxname" placeholder="${lxname}" required="required" /><br>
				강의 링크 등록: <select class="span2" name="coxcate">
								<c:forEach var="cate" items="${cateList}">
									<option value='<c:out value="${cate.cxseq}"/>' <c:if test="${!empty lxlink}">selected</c:if>><c:out value="${cate.cxname }"/></option>
								</c:forEach>
							</select>
								<input type="text" name="lxlink" placeholder="URL을 입력하세요" /><br>
				강의 자료 등록: 
							<c:if test="${!empty lxfile}">
									OriginalFileName is ${lxfile}.
							</c:if>
							<input type="file" name="lxfile" /><br>
				
				<c:if test="${empty lxseq}"><button class="btn" id="btnSubmit" >등록</button></c:if>
				<c:if test="${!empty lxseq}"><button class="btn" id="btnMod" >수정</button></c:if>
				<button class="btn" id="btnList" >취소</button>
			</form>
		</div>
	</div>
	<hr>
	
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>