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
		} else {
			alert("취소하였습니다.")
			document.location.reload();
		}
	}
	
	function delFile(no) {
		var delit=confirm("파일을 삭제하겠습니다.");
		if (delit) {
			var bxnconvertfile = '';
			if (no == 1) {
				bxnconvertfile = $('#bxnconvertfile1').val();
			}else {
				bxnconvertfile = $('#bxnconvertfile2').val();
			}
			$.ajax({
				method : 'post',
				url : '/board/notice/delNoticeFile',
				data : {
					bxnno : $('#bxnno').val()
					,no : no
					,bxnconvertfile : bxnconvertfile
					}
		}).done(function(msg) {
			var obj = JSON.parse(msg);
			if (obj.result == 1) {
			alert('파일을 삭제하였습니다.');
			document.location.reload();
			/* $('#delchk').text(''); */
			}else {
				
			alert('파일 삭제에 실패하였습니다.');
			}
		});
		} else {
			alert("취소하였습니다.")
			document.location.reload();
		}
	}
	
	function list() {
		alert("취소하였습니다.")
		document.location.href="/board/notice/readNotice?bxnseq=${notice.bxnseq}"
		
	}
	$(document).ready(function(){
    	$('#addFile').click(function(){
        	if ($('#file1').val() == '') {
        		alert('첫 번째 파일을 올려주세요.');
        	} else {
           	$('#file2').show();
        	}
        });
    	$('#updateFile').click(function(){
        	$('#file3').show();
        });
    });
	</script>
	<form action="/board/notice/editNotice" method="post" id="chk" enctype="multipart/form-data">
		<input type="hidden" name="bxngrid" value="${UOFFICE}"> 
		<input type="hidden" name="bxnseq" value="${notice.bxnseq}"> 
		<input type="hidden" name="bxncnt" value="${notice.bxncnt}">
		<input type="hidden" name="bxnno" value="${notice.bxnno}" id="bxnno">
		<input type="hidden" name="bxnconvertfile1" value="${notice.bxnconvertfile1}" id="bxnconvertfile1">
		<input type="hidden" name="bxnconvertfile2" value="${notice.bxnconvertfile2}" id="bxnconvertfile2"> 
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
			</table>
			<table class="table table-bordered">
				<c:if test="${notice.bxnfile1 != null && notice.bxnfile2 != null}">
				<tr>
				<td id="delchk"><div class="span2">${notice.bxnfile1}<button class="btn btn-default btn-sm" type="button" onclick="delFile(1);">삭제</button></div></td>
				<td><input id="file1" type="file" name="file" value="${notice.bxnfile1}"></td>
				<tr>
				<td id="delchk"><div class="span2">${notice.bxnfile2}<button class="btn btn-default btn-sm" type="button" onclick="delFile(2);">삭제</button></div></td>
				<td><input id="file2" type="file" name="file" value="${notice.bxnfile1}"></td>
				</tr>
				</c:if>
				<c:if test="${notice.bxnfile1 != null && notice.bxnfile2 == null}">
				<td id="delchk"><div class="span2">${notice.bxnfile1}<button class="btn btn-default btn-sm" type="button" onclick="delFile(1);">삭제</button></div></td>
				<td><input id="file1" type="file" name="file" value="${notice.bxnfile1}"></td>
				<td><button id="updateFile" class="btn btn-default btn-sm" type="button">파일추가</button></td>
				<tr id="file3" style="display: none;">
				<td><input id="file3" type="file" name="file" value="${notice.bxnfile2}"></td>
				</tr>
				</c:if>
				<c:if test="${notice.bxnfile1 == null && notice.bxnfile2 != null}">
				<tr>
				<td><input id="file1" type="file" name="file" value="${notice.bxnfile1}"></td>
				</tr>
				<tr>
				<td id="delchk"><div class="span2">${notice.bxnfile2}<button class="btn btn-default btn-sm" type="button" onclick="delFile(2);">삭제</button></div></td>
				<td><input id="file2" type="file" name="file" value="${notice.bxnfile2}"></td>
				</tr>
				</c:if>
				<c:if test="${notice.bxnfile1 == null && notice.bxnfile2 == null}">
				<tr>
				<td><input id="file1" type="file" name="file" value="${notice.bxnfile1}"></td>
				<td><button id="addFile" class="btn btn-default btn-sm" type="button">파일추가</button></td>
				<tr id="file2" style="display: none;">
				<td><input id="file2" type="file" name="file" value="${notice.bxnfile2}"></td>
				</tr>				
				</c:if>
				<tr>
				<td><input type="button" class="btn btn-default btn-sm" value="수정하기" onclick="editNotice();">&nbsp;&nbsp;<button type="button" class="btn btn-default btn-sm" onclick="list()">수정취소</button></td>
			</tr>
			</table>
		</div>

	</form>
	<%@ include file="../include/footer.jsp"%>