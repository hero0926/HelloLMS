<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>

	<script type="text/javascript">
	
		function mdown(){
			if(confirm("강사 삭제하시겠습니까?")){
				//yes
	            //$('#mxid').val(m);
	            //$('#mup').attr('action','/admin/memberup');   
	            //$('#mup').submit();
	            
	            $.ajax({
	            	type : 'post'
	            	,url : '/admin/memberup'
	            	,data : {
	            		mxid : $('#mxid').val()
	            	}
	            }).done(function(msg){
	            	if(msg ==1){
						alert("강사 삭제가 완료되었습니다.");
	            	}else{
	            		alert("에러가 발생했습니다.");
	            	}
	            	location.href="/admin/member"; //돌아갈페이지
	            });
	            
				//location.href="/admin/memberup";
			}else{
				//no
				alert("회원관리 페이지로 돌아갑니다.");
				location.href="/admin/member"; //돌아갈페이지
			}
		}
	</script>

	<h1>강사정보 삭제<small>  ...강사를 삭제시킬 수 있습니다.</small></h1>
	<input type="hidden" name="mxid" id="mxid" value="${m.mxid }"/>
	<table class="table table-bordered">
		<tr>
	   		<td>회원아이디: <c:out value="${m.mxid }"/></td>
	    	<td>이름: <c:out value="${m.mxname }"/></td>
	  	</tr>
		<tr>
	    	<td>사진 </td>
	    	<td></td>
		</tr>
		<tr>
	   		<td> 강사 삭제이유</td>
	    	<td><textarea rows="10" cols="150" style = "resize:none;" autofocus required wrap = "hard" placeholder = "사유를 적어주세요"></textarea></td>
	  	</tr>	
	</table>
	<button class="btn btn-success btn-small" type="button" onclick="mdown()">삭제</button>
</body>
</html>