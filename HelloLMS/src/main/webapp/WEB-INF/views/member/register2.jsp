<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>
  
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
		
//ID 중복검사하기

function chkDupId(){
	
  var mxid = $('#mxid').val();
  
  $.ajax({

	     type : 'POST',  
	     data:"mxid="+ mxid,
	     dataType : 'text',
	     url : '/member/chkDupId.do',  
	     success : function(rData, textStatus, xhr) {
	      var chkRst = rData;
	      if(chkRst == 0){
	       alert("등록 가능 합니다.");
	       $("#idChk").val('Y');
	      }else{
	       alert("중복 되어 있습니다.");
	       $("#idChk").val('N');
	      }
	     },
	     error : function(xhr, status, e) {  
	      alert(e);
	     }
	  });  
	 }

function insertChk(){
	
	  
	  var frm = document.companyForm; 
	  
	  if($("#idChk").val() == 'N'){
		  alert("ID 중복체크를 해주세요!");
		  $('#mxid').focus();
	  }
	  
	  if($("#idChk").val() == 'Y'){
		  document.getElementById("submitbtn").disabled = false;
	  }
}

//라디오버튼 체크하기

function chk_radio() 
{
	
	var chk_radio = document.getElementsByName('mxdiv');
	var sel_type = null;
	for(var i=0;i<chk_radio.length;i++){
		if(chk_radio[i].checked == true){ 
			sel_type = chk_radio[i].value;
		}
	}
	

	/* if(sel_type == null){
        alert("회원유형을 선택하세요."); 
        
        event.preventDefault();
        
	} */
}

</script>

</head>
<body>

<div class="container">
<div class="page-header">
        <h1>회원가입</h1>
</div>
<!-- <div class="row span 5" align="center"> -->
 <form name = "frm" action="/member/register2" method="post" >
 <table class="table table-hover" align="center">
     <tr>
     <th> 아이디 </th>
     <td> 
     <input type="hidden" id="idChk" value="N" />
     <input type="hidden" name="mxdiv" value="S" />
	 <input type="hidden" value="${UOFFICE }" name="mxoffice">
     <input type = "text" required="required" name = "mxid" id="mxid" onkeyup="trimcheck(this);" onchange="trimcheck(this);" onkeydown="iskor(this);" style="ime-mode:disabled;" required="required" >
     <input type="button" value="Id체크" onclick="javascript:chkDupId();" />    
     </td>    
     
     </tr>
    
    <tr>
     <th> 비밀번호 </th>
     <td> <input type = "password" required="required" name = "mxpw" onkeyup="trimcheck(this);" onchange="trimcheck(this);" required="required" ></td>
     </tr>
     
     <tr>
     <th> 이름 </th>
    <td> <input type = "text" required="required" name = "mxname" onkeyup="trimcheck(this);" onchange="trimcheck(this);" required="required" ></td>
     </tr>
     
 	<tr>
     <th> 이메일 </th>
     <td>     
 <input name="email1" type="text" class="box" id="email1" required="required"  onkeyup='call()' onkeydown ="insertChk();" required="required" > @
 <input name="email2" type="text" class="box" id="email2" value="" onkeyup='call()' required="required" >
 	<select name="email_select" class="box" id="email_select" onclick='call()' onChange="checkemailaddy();">
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
     <td colspan = "4"> 
     <button class="btn btn-primary" id="submitbtn" type="submit" onclick="chk_radio()" disabled='true'/>전송</button>
     <button class="btn" type="reset" />취소</button>
    </tr>
    </table>
  </form>

<!-- </div> -->  
 </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>