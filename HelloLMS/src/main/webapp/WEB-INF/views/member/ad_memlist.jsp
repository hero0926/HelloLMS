<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	<script>
		$(document).ready(function (e){	
		
		});
		function deleteMember(n) {
			
			if(confirm("회원을 강퇴시킬까요?")){
				
				$('#mxid').val(n);
				$('#frm2').attr('action','/admin/deleteMember');				
				$('#frm2').submit();
			}
		}
		
		function updateMemberT(n){
			
			if(confirm("회원을 강사로 만들까요?")){
				
	            $('#mxid').val(n);
	            $('#frm2').attr('action','/admin/updateMemberT');            
	            $('#frm2').submit();

			}
		}
		
		function deleteT(mxseq){
			
			if(confirm("강사를 삭제하시겠습니까? 회원 구분이 'S'로 전환됩니다.")){
	            $('#mxseq').val(mxseq);
	            $('#frm2').attr('action','/admin/deleteT');            
	            $('#frm2').submit();
			}
		}
		
		function loginHistory(mxseq){
            var popUrl = "/admin/loginHistory?mxseq="+mxseq;
			var popOption = "width=1080, height=600, resizable=no, scrollbars=no, status=no;";
			var title="loginHistory";
			
			window.open(popUrl, title, popOption);
		}
		

	</script>
	

   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>회원 리스트 <small>...회원 정보를 확인하고 강사관리를 합니다.</small></h1>
      </div>
        <div class="span12">
        <h3> </h3>
      <!-- Example row of columns -->
		<form id="frm2" action="deleteMember" method="post">
			<input type="hidden" name="mxid" id="mxid" />
			<input type="hidden" name="mxseq" id="mxseq" />
		</form>
       
          <table class="table table-hover">
  			<tr>
  				<th>시퀀스</th>
  				<th>아이디</th>  				
  				<th>이름</th>  				
  				<th>메일</th>  				
  				<th>회사</th>  				
  				<th>회원구분</th>
  				<th>회원관리</th>
  				<th>로그인 기록 조회</th>
  			</tr>
			<c:forEach var="m" items="${list}" varStatus="status">
				<tr>
					<td><c:out value="${m.mxseq }"/></td>
					<td><c:out value="${m.mxid }"/></td>
					<td><c:out value="${m.mxname }"/></td>
					<td><c:out value="${m.mxmail }"/></td>
					<td><c:out value="${m.mxoffice }"/></td>
					<td><c:out value="${m.mxdiv }"/></td>
					<td><button class="btn btn-danger btn-small" type="button" onclick="deleteMember('${m.mxid }')">강퇴</button>
						<c:if test="${m.mxdiv eq 'S'}"> 
						<button class="btn btn-success btn-small" type="button" onclick="updateMemberT('${m.mxid }')">강사등록</button>
						</c:if>
						<c:if test="${m.mxdiv eq 'T'}"> 
						<button class="btn btn-inverse btn-small" type="button" onclick="deleteT('${m.mxseq }')">강사삭제</button>
						</c:if>
					</td>
					<td><button class="btn btn-small" type="button" onclick="loginHistory('${m.mxseq}')">조회</button></td>
				</tr>
			</c:forEach>
			
          </table>
     
			<div class="pagination" style="text-align: center">
			  <ul>
			    <li><a href="#">Prev</a></li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#">Next</a></li>
			  </ul>
			</div>		

        </div>
	  </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>