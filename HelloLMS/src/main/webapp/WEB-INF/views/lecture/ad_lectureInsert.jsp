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
				
			}
		}

	</script>
	<div class="container">
	<div class="page-header">
		<h1>강의 등록<small>...과정별 강의를 등록합니다.</small></h1>
	</div>
	
	<div class="row">
		<div class="span12">
			<form action="/admin/lecture/lectureInsert" id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="coxseq" value="${coxseq}">
				<input type="hidden" name="lxseq" value="${lxseq}">
				
				<div class="alert alert-info">
					<h3>강의명: ${coxname}</h3>
				</div>
				
				<table class="table table-hover">
					<tr>
						<th>회차</th>
						<td>
							<c:if test="${empty lxseq}"><input type="text" name="lxnum" /></c:if>
							<c:if test="${!empty lxseq}">${lxnum}</c:if><br>
						</td>
					</tr>
					<tr>
						<th>강의명</th>
						<td>
							<input type="text" class="span4" name="lxname" placeholder="${lxname}" required="required" /><br>
						</td>
					</tr>
					<tr>
						<th>강의 링크 등록</th>
						<td>
							<select class="span2" name="lxtype">
								<c:forEach var="cate" items="${cateList}">
									<option value='<c:out value="${cate.cxseq}"/>' <c:if test="${!empty lxtype && cate.cxseq==lxtype}">selected</c:if>><c:out value="${cate.cxname}"/></option>
								</c:forEach>
							</select>
							<input type="text" name="lxlink" placeholder="${lxlink}" /><br>
						</td>
					</tr>
					<tr>
						<th>강의 자료 등록</th>
							<td>
								<c:if test="${!empty lxfile}">
										OriginalFileName is ${lxfile}.
								</c:if>
								<input type="file" name="lxfile" /><br>
							</td>
					</tr>
				</table>
				<div align="right">
					<c:if test="${empty lxseq}"><button class="btn" id="btnSubmit" >등록</button></c:if>
					<c:if test="${!empty lxseq}"><button class="btn" id="btnMod" >수정</button></c:if>
					<button class="btn" id="btnList" >취소</button>
				</div>
			</form>
		</div>
	</div>
	<hr>
	
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>