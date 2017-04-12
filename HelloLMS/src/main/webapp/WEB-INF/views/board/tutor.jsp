<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
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
			$('#like').text(obj.cnt);

		});
	}	
</script>
<script>
/* $('#commt').click(function(){
var delCmt = [];
$('input:checkbox[name=checkDel]').each(function(){
	if($(this).is(':checked')) {
		delCmt.push($(this).val());
	}
	$('#delCmt').val(delCmt.toString());
	$('#commt').submit();
});
console.log(delCmt);
}); */
	/* $(document).ready(function(){
		$("input[type=checkbox][name=checkDel]").bind('checked',function(){
			
		});
	}); */
	var chks = [];
	function deletecomment() {
		var del = confirm("삭제합니다.");
		if (del) {
			$('input:checkbox[name=checkDel]').each(function(){
				if($(this).is(':checked')) {
					chks.push($(this).val());
				}
			});
			$('#chks').val(chks.toString());
			
			console.log(chks);
			$('#frm1').attr("action", "/board/deleteComment");
			$('#frm1').submit();
		} else {
			alert("취소하였습니다.")
			return;
		}
	}
		
	
	/* var delCmt = $("input[type=radio][name=checkDel]:checked").val() */
	
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
			${tutor.mxname}
		</h1>
	</div>
	<div class="alert alert-info"></div>
<form action="/board/writeComment" method="post" id="frmCommnt">
	
	
	<table class="table table-bordered">
		<tr>
			<td><img src="/resources/tutor/${tutor.tuxpicture}"><br>
			${tutor.tuxhistory}
			</td>
		</tr>
		<tr>
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
			<td>
				<small><b id="like">${tutor.cnt}</b>명 <a href="javascript:joayo();"><i class="icon-heart"></i></a></small>
			</td>
		</tr>
		<c:forEach items="${comment}" var="comment">
		<fmt:parseDate value="${comment.regdate}" var="dateFmt" pattern="yyyyMMdd"/>
			<tr>
				<%-- <td width="100" align="left"><c:if test="${sessionScope.UDIV eq 'A'.charAt(0)}"><input type="checkbox" id="checkDel" name="checkDel" value="${comment.tucxseq}"></c:if>${comment.tucxseq}${comment.tucxcomment}</td> --%>
				<td width="100" align="left">
					<c:if test="${sessionScope.UDIV eq 'A'.charAt(0)}">	<input type="checkbox" name="checkDel" value="${comment.tucxseq}"></c:if>
					${comment.tucxcomment}..........
					<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" />
				</td>
				
			</tr>
		</c:forEach>
		</table>
		<input type="hidden" name="mxseq" value="${tutor.mxseq}">
		<table class="table table-bordered">
		<tr>
			<td><textarea id="cmt" name="tucxcomment" rows="1"></textarea></td>
			<td><button id="commt" type="button" class="btn btn-default btn-small" onclick="commnt();">입력</button>
		</tr>
	</table>
	</form>
	<form method="post" id="frm1">
		<input type="hidden" id="chks" name="chks">
		<input type="hidden" name="mxseq" value="${tutor.mxseq}">
		<c:if test="${sessionScope.UDIV eq 'A'.charAt(0)}"><button id="comm" type="button" class="btn btn-default btn-small" onclick="deletecomment();">삭제</button></c:if>
	</form>
	<button type="button" class="btn btn-default btn-sm" onclick="self.close();">닫기</button>
</div>
<%@ include file="../include/footer.jsp"%>