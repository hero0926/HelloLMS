<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 폼</title>
</head>
<body>

<!-- 나중에 붓스트랩 적용하세요 ㅋㅋ -->
 <form action="../MemberJoin.do" method="post">
 <table border = "1" cellpadding = "5">
    <tr>
     <td> 아이디 </td>
     <td> <input type = "text" name = mxid> </td>
     <td colspan = "2" align = "right"><b> *15자이내 </b> </td>
    </tr>
    
    <tr>
     <td> 비밀번호 </td>
     <td> <input type = "password" name = mxpw></td>
     <td> 이름 </td>
    <td> <input type = "text" name = "mxname"></td>
    </tr>
 	<tr>
     <td> 이메일 </td>
     <td> <input type = "text" name = "mxmail"> </td>
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