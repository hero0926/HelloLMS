<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>


<%
String mail= (String)session.getAttribute("UMAIL");
int at = mail.indexOf("@");
String mail1 = mail.substring(0, at);
String mail2 = mail.substring(at+1);
%>

  <script>
  
  
	$(document).ready(function (e){
		$('#update').click(function(){
			if(checkVal()){
				$('#frm').submit();
			}
		})
		
	});
	
	function checkVal() {
		if(confirm("정보를 수정 하시겠습니까?")){
			var ok=true;
			$("input[required='required']").each(function(index){
				if($(this).val()==''){
					alert("입력이 필요한 항목이 있습니다.");
					$(this).focus();
					ok=false;
					return false;						
				}
	        });
			
			if(ok){
				return true;
			}else{
				return false;
			}
			
				
		} else {
			return false;
		}
	}
//공백체크 후 제거하기
function trimcheck(obj){
	 
	var str = /^\s+|\s+$/g;
	
	if(str.exec(obj.value)){
		alert("공백 사용 금지!");
		obj.focus();
        obj.value = obj.value.replace(' ','');
        return false;
	}	
}

//한글체크하기

function iskor(obj){	
		obj.value = obj.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');			
}

//이메일 선택
function checkemailaddy(){
        if (frm.email_select.value == '1') {
            frm.email2.readOnly = false;
            frm.email2.value = '';
            frm.email2.focus();
        }
        else {
            frm.email2.readOnly = true;
            frm.email2.value = frm.email_select.value;
        }
    }

//이메일 합치기
function call()
{
	var m1 = document.getElementById("email1").value;
	var m2 = document.getElementById("email2").value;
	document.getElementById("mxmail").value = m1+"@"+m2;
}
		
//라디오버튼 선택 체크하기


//알람 띄우기
$(".alert").alert();
$('.alert').popover(options);
</script>


<div class="container">
      <div class="page-header">
        <h1>개인정보수정 <small>...개인정보를 수정할 수 있습니다.</small></h1>
      </div>

	<form id="frm" name="frm" action="/member/update" method="post">
		<table class="table table-hover" align="center">
			<tr>
				<th>아이디</th>
				<td><input type="text" readonly="readonly" name="mxid"
					value="${UID }"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mxpw"
					onkeyup="trimcheck(this);" onchange="trimcheck(this);" required="required"></td>
			</tr>

			<tr>
				<th>이름</th>
				<td><input type="text" name="mxname" value="${UNAME }"
					onkeyup="trimcheck(this);" onchange="trimcheck(this);" required="required"></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input name="email1" type="text" class="box" id="email1"
					value="<%=mail1 %>" onkeyup='call()'> @ <input
					name="email2" type="text" class="box" id="email2"
					value="<%=mail2 %>" onkeyup='call()'> <select
					name="email_select" class="box" id="email_select" onclick='call()'
					onChange="checkemailaddy();">
						<option value="" selected>선택</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="1">직접입력</option>
				</select> <input type="text" name="mxmail" id="mxmail" value="${UMAIL }"
					style="display: none"></td>
			</tr>


			<tr align="center">
				<td colspan="4">
					<button class="btn btn-primary" type="button" id="update" />수정
					</button>
					<button class="btn" type="reset" />취소
					</button>
			</tr>
		</table>
	</form>
	<hr>
  <h4>회원 탈퇴하기</h4>
  <a href="#myModal" data-toggle="modal">
  <button class="btn btn-danger"/>전송</button></a>
  
  <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="alert alert-block alert-error fade in">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
            <h4 class="alert-heading">탈퇴하면 되돌릴 수 없습니다!!</h4>
            <p>정말로 탈퇴하시겠습니까.</p>
            <p>
              <a class="btn btn-danger" data-dismiss="modal" aria-hidden="true">아니오</a>
               <a class="btn" href="/member/delete">네</a>
            </p>
	</div>
 </div>  
  

</div>  

<%@ include file="../include/footer.jsp"%>