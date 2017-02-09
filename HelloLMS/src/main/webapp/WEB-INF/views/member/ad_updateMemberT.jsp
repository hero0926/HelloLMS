<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>강사정보 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


</head>
<body>

<h1>강사정보 등록<small>  ...강사로 등록시킬 수 있습니다.</small></h1>

 <table class="table table-bordered">
 

 
<c:forEach var="m" items="${m}" varStatus="status">
  	<tr>
   		<td>회원아이디: <c:out value="${m.mxid }"/></td>
    	<td>이름: <c:out value="${m.mxname }"/></td>
  	</tr>

 <form id="mup" action="memberup" method="post">
 	<input type="hidden" name="mxid" id="mxid"/>

 
	<tr>
    	<td>사진 </td>
    	<td> </td>
	</tr>
	<tr>
   		<td> 강사연혁</td>
    	<td><textarea rows="10" cols="150" style = "resize:none;" autofocus required wrap = "hard" placeholder = "강사를 소개해주세요."></textarea></td>
  	</tr>	
</table>
 </form>

	<script type="text/javascript">

	function mup(m){
		if(confirm("강사로 등록하시겠습니까?")== true){
			//yes
			alert("강사로 등록이 되었습니다.");
            $('#mxid').val(m);
            $('#mup').attr('action','/admin/memberup');   
            $('#mup').submit();
			//location.href="/admin/memberup";
		}else{
			//no
			alert("회원관리 페이지로 돌아갑니다.");
			location.href="/admin/member"; //돌아갈페이지
		}
	}
	

	
</script>
<button class="btn btn-success btn-small" type="button" onclick="mup('${m.mxid}')">강사등록</button>
</c:forEach>
</body>
</html>