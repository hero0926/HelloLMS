<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<%@ include file="../include/menu.jsp"%>
<script>
/*     $(function(){
         
        CKEDITOR.replace( 'bxncontent', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            filebrowserImageUploadUrl: '/upload/image' //여기 경로로 파일을 전달하여 업로드 시킨다.
        });
         
         
        CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
         
    });
     */
    function list() {
		location.href="/board/ad_qna"
	}
     
     $(document).ready(function(){
     	$('#addFile').click(function(){
         	if ($('#file1').val() == '') {
         		alert('첫 번째 파일을 올려주세요.');
         	} else {
            	$('#file2').show();
         	}
         });
     });
          

</script>
<form class="form-horizontal" role="form" id="editorForm" method="post" action="/board/qna/writeQna" enctype="multipart/form-data">
<div class="container">
		<div class="page-header">
			<h1>
				QNA 작성 <small>...QNA를 작성합니다.</small>
			</h1>
		</div>
		<div class="alert alert-info"></div>
		<table class="table table-bordered">
			<tr>
				<td><div class="span1">제목</div></td>
				<td><div class="span5">
						<input name="bxqsubject"
							style="background-color: transparent; border: 0"
							placeholder="제목을 입력하세요." required="required">
					</div></td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<td><textarea class="ckeditor" cols="80" id="content"
						name="bxqcontent" rows="20"></textarea></td>
			</tr>
			<!-- <tr>
				<td align="right"><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td align="right"><input type="file" name="file" /></td>
			</tr> -->
			<tr>
				<td align="right"><input id="file1" type="file" name="file" value="${originalFileName}">
				<button id="addFile" class="btn btn-default btn-sm" type="button">click</button></td>
			</tr>
			<tr id="file2" style="display: none;">
				<td align="right"><input type="file" name="file" value="${originalFileName2}"></td>
			</tr>
		<tr>
			<td><button type="submit" class="btn btn-default btn-sm">작성</button></td>
		</tr>
	</table>
	<button type="button" class="btn btn-default btn-sm" onclick="list()">작성취소</button>
	</div>
</form>
<%@ include file="../include/footer.jsp"%>