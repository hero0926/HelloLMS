<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<script>
	function joayo() {
		$.ajax({
			method : 'post',
			url : '/board/joayo',
			data : {
				mxseq : $('#mxseq').val()
			}
		}).done(function(msg) {
			var obj = JSON.parse(msg);
			$('h2').text(obj.cnt + '명째 좋아요!');

		});
	}	
</script>
<script>
	function deletePerson() {
		var del = confirm("삭제합니다.");
		if (del) {
			location.href = ""
			alert("삭제하였습니다.")
		} else {
			alert("취소하였습니다.")
			return;
		}
	}
</script>
<script>
	function commnt() {
		if (!$.trim($('#cmt').val())) {
			alert('코멘트를 입력해 주세요.');
		}else{
			var comm = confirm("코멘트를 입력하시겠습니까?\n삭제 및 수정이 불가능합니다.");
			if (comm) {
				$('#frmCommnt').submit();
				//location.href = "/board/tutor?mxseq=${tutor.mxseq}"
			} else {
				alert("취소하였습니다.")
				return;
			}
		}
	}
</script>
<input type="hidden" id= "mxseq" name="mxseq" value="${tutor.mxseq}">
<div class="container">
	<div class="page-header">
		<h1>
			강사 정보 <small>...강사 정보를 열람합니다..</small>
		</h1>
	</div>
	<div class="alert alert-info"></div>
	<table class="table table-bordered">
		<tr>

		</tr>
		<tr>
			<td><div class="span3">이름 : ${tutor.mxname}</div></td>
			<td>사진입니다요.<img src="/resources/tutor/${tutor.tuxpicture}"></td>
		</tr>
		<tr>
			<td><div class="span3">연혁</div></td>
			<td>
				<script>
					var tHistory = '${tutor.tuxhistory}';
					var splitHistory = tHistory.split(',');
					for ( var i in splitHistory) {
						document.write('<p>'+'ㆍ'+splitHistory[i]+'</p>');
					}
				</script>
			</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td>
				<h2>${tutor.cnt}명이 ${tutor.mxname}님을 좋아합니다.</h2>
			</td>
		</tr>
		<tr>
			<td>COMMENT<br> <br></td>
		</tr>
		<c:forEach items="${comment}" var="comment">
		<tr>
		<fmt:parseDate value="${comment.regdate}" var="dateFmt" pattern="yyyyMMdd"/>
		</tr>
			<tr>
				<td width="100" align="left">${comment.tucxcomment}</td>
				<td width="20" align="left"><fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" /></td>
				
			</tr>
		</c:forEach>
		</table>
		<form action="/board/writeComment" method="post" id="frmCommnt">
		<input type="hidden" name="mxseq" value="${tutor.mxseq}">
		<table class="table table-bordered">
		<tr>
		
			<td><textarea id="cmt" name="tucxcomment" rows="1"></textarea></td>
			<td><button id="commt" type="button" class="btn btn-default btn-sm" onclick="commnt();">코멘트 입력</button>
			<td><button type="button" class="btn btn-default btn-sm" onclick="joayo();">
          <span class="glyphicon glyphicon-thumbs-up"></span> 좋아요!
        </button></td>
		</tr>
	</table>
	</form>
	<button type="button" class="btn btn-default btn-sm" onclick="">돌아가기</button>
</div>
<%@ include file="../include/footer.jsp"%>