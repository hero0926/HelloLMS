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

	</script>
	
	<style>
	
	div{
	
	margin : 2px auto;
	align : center;
	
	}
	
	</style>
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>회원 리스트 <small>...현재 우리 사이트 회원을 볼 수 있다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="container">
        
        <div class="span8">
       
          <table class="table table-hover">
  			<tr>
  				<th>시퀀스</th>
  				<th>아이디</th>  				
  				<th>이름</th>  				
  				<th>메일</th>  				
  				<th>회사</th>  				
  				<th>회원구분</th>
  				<th>회원관리</th>
  			</tr>
     
        </div>
        
		<form id="frm2" action="deleteMember" method="post">
			<input type="hidden" name="mxid" id="mxid" />
		</form>
		
			<c:forEach var="m" items="${list}" varStatus="status">
				<tr>
					<td><c:out value="${m.mxseq }"/></td>
					<td><c:out value="${m.mxid }"/></td>
					<td><c:out value="${m.mxname }"/></td>
					<td><c:out value="${m.mxmail }"/></td>
					<td><c:out value="${m.mxoffice }"/></td>
					<td><c:out value="${m.mxdiv }"/></td>
					<td><button class="btn btn-danger btn-small" type="button" onclick="deleteMember('${m.mxid }')">강퇴</button>
					<button class="btn btn-success btn-small" type="button" onclick="updateMemberT('${m.mxid }')">강사 만들기</button></td>

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