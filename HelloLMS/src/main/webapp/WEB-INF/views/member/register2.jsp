<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="../include/menu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 폼</title>

 <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <script src="/resources/js/jquery-2.1.1.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/js/angular.1.4.8.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  <style type="text/css">
    
      body {
        padding-top: 100px;
        padding-bottom: 40px;
      }
     </style>
  
  <script>
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

</script>

</head>
<body>
<div class="row span 5" align="center">
 <form name = "frm" action="/member/registered" method="post" >
 <table class="table table-hover" align="center">
     <tr>
     <th> 아이디 </th>
     <td> <input type = "text" name = "mxid" onkeyup="trimcheck(this);" onchange="trimcheck(this);" onkeydown="iskor(this);" style="ime-mode:disabled;"  > </td>
     </tr>
    
    <tr>
     <th> 비밀번호 </th>
     <td> <input type = "password" name = "mxpw" onkeyup="trimcheck(this);" onchange="trimcheck(this);" ></td>
     </tr>
     
     <tr>
     <th> 이름 </th>
    <td> <input type = "text" name = "mxname" onkeyup="trimcheck(this);" onchange="trimcheck(this);" ></td>
     </tr>
     
 	<tr>
     <th> 이메일 </th>
     <td>     
 <input name="email1" type="text" class="box" id="email1"  onkeyup='call()'> @
 <input name="email2" type="text" class="box" id="email2" value="" onkeyup='call()'>
 	<select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
    <option value="" selected>선택</option>
    <option value="naver.com">naver.com</option>
    <option value="hanmail.net">hanmail.net</option>    
    <option value="gmail.com">gmail.com</option>
    <option value="nate.com">nate.com</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="yahoo.co.kr">yahoo.co.kr</option>
    <option value="1">직접입력</option>
</select>

<input type="text" name="mxmail" id="mxmail" value="" style="display:none">

   
     </td>
     
     </tr>
     
     <tr>
     <!-- 회사는 코드 테이블에서 가져오는 int형 이예요. -->
      <th> 회사 </th>
     <td><input type="text" value="2" id="mxoffice" name="mxoffice"></td>
    </tr>
    
    <tr>
     <!-- 회원 구분은 S T A로 나뉘어요. -->
    <th>회원 구분</th>
    <td>
    <input type="radio" name="mxdiv" id="mxdiv" value="S">학생
	<input type="radio" name="mxdiv" id="mxdiv" value="T">선생님
	<input type="radio" name="mxdiv" id="mxdiv" value="A">기업
    </td>
    </tr>
  
    <tr>
     <td colspan = "4"> 
     <button class="btn btn-primary" type="submit" />전송</button>
     <button class="btn" type="reset" />취소</button>
    </tr>
    </table>
  </form>

</div>  

</body>
</html>