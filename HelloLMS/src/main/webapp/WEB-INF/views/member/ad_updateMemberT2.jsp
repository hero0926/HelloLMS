<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){
			$('#btnSubmit').click(function(){
				$('#form1').attr('action','/admin/memberup');
				$('#form1').submit();
			});
			$('#btnList').click(function(){
				$('#form1').attr('action','/admin/member');
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
		<h1>강사 등록<small>...강사의 정보를 등록합니다.</small></h1>
	</div>
	
	<div class="row">
		<div class="span12">
			<form action="/admin/memberup" id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mxseq" value="${m.mxseq}"/>
				<input type="hidden" name="mxid" value="${m.mxid}"/>
				
				<div class="alert alert-info">
				</div>
				
				<table class="table table-hover">
					<tr>
						<th>아이디</th>
						<td>
							<c:out value="${m.mxid}"/>
						</td>
					</tr>
					<tr>
						<th>회원 이름</th>
						<td>
							<c:out value="${m.mxname}"/>
						</td>
					</tr>
					<tr>
						<th>강사 사진</th>
							<td>
								<input type="file" name="tuxpicture" /><br>
							</td>
					</tr>
					<tr>
						<th>강사 소개(연혁)</th>
						<td>
							<input type="text" class="span4" name="tuxhistory" placeholder="강사의 정보를 입력하세요" /><br>
						</td>
					</tr>
				</table>
				<div align="right">
					<button class="btn" id="btnSubmit" >등록</button>
					<button class="btn" id="btnList" >취소</button>
				</div>
			</form>
		</div>
	</div>
	<hr>
	
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>