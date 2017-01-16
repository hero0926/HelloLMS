<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 폼</title>

<script src="http://code.jquery.com/jquery-latest.min.js">
//필요하신분 입력 폼마다 가져다쓰세요

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
	
//라디오버튼 선택 체크하기


</script>


</head>
<body>

<!-- 나중에 붓스트랩 적용하세요 ㅋㅋ -->
 <form name = "frm" action="어디가지" method="post" >
 <table border = "1" cellpadding = "5">
    <tr>
     <td> 아이디 </td>
     <td> <input type = "text" name = "mxid" onkeyup="trimcheck(this);" onchange="trimcheck(this);" onkeydown="iskor(this);" style="ime-mode:disabled;"  > </td>
     <td colspan = "2" align = "right"><b> *15자이내 </b> </td>
    </tr>
    
    <tr>
     <td> 비밀번호 </td>
     <td> <input type = "password" name = "mxpw" onkeyup="trimcheck(this);" onchange="trimcheck(this);" ></td>
     <td> 이름 </td>
    <td> <input type = "text" name = "mxname" onkeyup="trimcheck(this);" onchange="trimcheck(this);" ></td>
    </tr>
 	<tr>
     <td> 이메일 </td>
     <td> <input type="text" name="mail1" id="mail1" style="width:100px"> @ <input type="text" name="mail2" id="mail2" style="width:100px;">
     
     <!-- 두개를 합쳐서 mxmail로 넘기는법 연구해와... -->
     
     </td>
     <!-- 회사는 코드 테이블에서 가져오는 int형 이예요. -->
      <td> 회사 </td>
     <td> 개발중</td>
    </tr>
    <tr>
     <!-- 회원 구분은 S T A로 나뉘어요. -->
    <td>회원 구분</td>
    <td>
    <input type="radio" name="S" value="S">학생
	<input type="radio" name="T" value="T">선생님
	<input type="radio" name="A" value="A">기업
    </td>
    </tr>
  
    <tr>
     <td colspan = "4" align = "center"> 
     <input type = "submit" value = "전송">
     <input type = "reset" value = "취소"> </td>
    </tr>
    </table>
  </form>



</body>
</html>