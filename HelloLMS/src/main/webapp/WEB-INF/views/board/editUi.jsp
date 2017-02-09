<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
	<%@ include file="../include/header.jsp"%>	
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<%@ include file="../include/menu.jsp"%>
	<script>
	function editNotice() {
		var editit=confirm("글을 수정합니다.");
		if (editit) {
			$("#chk").submit();
			alert("글을 수정하였습니다.");	
		} else {
			alert("취소하였습니다.")
			location.reload();
		}
	}
	
	function list() {
		alert("취소하였습니다..")
		history.go(-1)
	}
	</script>
	<form action="/board/notice/editNotice" method="post" id="chk">
		<input type="hidden" name="bxngrid" value="${bxngrid}"> 
		<input type="hidden" name="bxnseq" value="${notice.bxnseq}"> 
		<input type="hidden" name="bxncnt" value="${notice.bxncnt}">
		<div class="container">
			<div class="page-header">
				<h1>
					공지사항 수정 <small>...공지사항을 수정합니다.</small>
				</h1>
			</div>
			<div class="alert alert-info"></div>
			<table class="table table-bordered">
				<tr>
					<td><div class="span1">제목</div></td>
					<td><div class="span5">
						<input name="bxnsubject" style="background-color: transparent; border: 0" value="${notice.bxnsubject}" required="required">
						</div></td>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr>
					<td><textarea class="ckeditor" cols="80" id="content"
							name="bxncontent" rows="20">${notice.bxncontent}</textarea></td>
				</tr>
				<tr>
					<td align="right"><input type="file" name="file" /></td>
					<td><input type="submit" name="file"></td>
				</tr>
				<tr>
					<td align="right"><input type="file" name="file" /></td>
					<td><input type="submit" name="file"></td>
				</tr>
				<tr>
				<td><input type="button" value="수정하기" onclick="editNotice();">&nbsp;&nbsp;<button onclick="list()">수정취소</button></td>
			</tr>
			</table>
		</div>

	</form>
	<%@ include file="../include/footer.jsp"%>