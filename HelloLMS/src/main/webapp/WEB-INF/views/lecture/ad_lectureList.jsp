<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>

		<script type="text/javascript">
			function goMod(lxseq) {
				$('#lxseq').val(lxseq);
				$('#frm2').attr('action','/admin/lecture/lectureModPage');
				$('#frm2').submit();
			}
			function goDel(lxseq) {
				$('#lxseq').val(lxseq);
				$('#frm2').attr('action','/admin/lecture/lectureDel');
				$('#frm2').submit();
				/* if(checkVal()){
					alert(coxseq);
					alert(lxseq);
					$('#frm2').attr('action','/admin/lecture/lectureDel');
					$('#frm2').submit();
				} */
			}
			function goInsert() {
				$('#frm2').attr('action','/admin/lecture/lectureInsertPage');
				$('#frm2').submit();
			}
			function goQuiz(lxseq) {
				$('#lxseq').val(lxseq);
				$('#frm2').attr('action','/admin/quizWriteForm');
				$('#frm2').submit();
			}
			function checkVal() {
				if(confirm("강의를 삭제 하시겠습니까?")){
					/* if($("input[required='required']").val()=='') {
						alert("입력이 필요한 항목이 있습니다.");
						return false;
					}
					//$("input[type='number']").attr('value', '333');
					if(!$.isNumeric($("input[type='number']").val())) {
						return false;
					} */
						
				}
			}
			
			function goCourse() {
				$('#frm2').attr('action','/admin/courseList');
				$('#frm2').submit();
			}
		</script>

   <div class="container">
		
		<form id="frm2" method="post">
			<input type="hidden" name="lxseq" id="lxseq" />
			<input type="hidden" name="coxseq" id="coxseq" value="${coxseq}">
		</form>
	
		<div class="page-header">
        	<h1><small>강좌 관리  >  강의 리스트</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<div class="alert alert-info">
	        		<c:forEach var="test" items="list" end="2" varStatus="status">
	        				<c:set value="${list[status.index].coxname}" var="coxname" />
	        		</c:forEach>
	        		<h3><a href="javascript:goCourse();"><c:out value="${coxname}"/></a>
	  				<small>...강의 리스트 입니다.</small></h3>
	  				
	  				<div align="right">
						<button class="btn btn-small" type="button" onClick="goInsert();">강의 등록</button>
					</div>
  				</div>
				
        		<table class="table table-bordered">
	  				<tr>
		  				<th>회차</th>
		  				<th>강의명</th>
		  				<th>강의 링크</th>
		  				<th>강의자료</th>
		  				<th>퀴즈</th>
		  				<th>수정</th>
		  				<th>삭제</th>
		  			</tr>
  				
	  				<c:if test="${!empty list}">
	  					<c:forEach var="lecture" items="${list}" varStatus="status">
	  						<tr>
								<td><c:out value="${lecture.lxnum}"/></td>
								<td><c:out value="${lecture.lxname}"/></td>
								<td><c:out value="${lecture.lxlink}"/></td>
								<td><c:out value="${lecture.lxfile}"/>
									<%-- <form action="/admin/lecture/fileUpload" id="form1" method="post" enctype="multipart/form-data">
										<input type="hidden" name="lxseq" value="${lecture.lxseq}">
										<c:if test="${!empty lecture.lxfile}">
											OriginalFileName is ${lecture.lxfile}.
										</c:if>
										<!-- <input type="hidden" name="uploadpath" value="lecture"> -->
										<input type="file" name="lxfile" />
										<input type="submit" value="파일 등록" />
									</form> --%>
								</td>
								<td><button class="btn btn-small" type="button" onClick="goQuiz('${lecture.lxseq}');">퀴즈 관리</button>
									<c:if test="${lecture.qxcnt>0}">
										(<c:out value="${lecture.qxcnt}"/>)
									</c:if></td>
								<td><button class="btn btn-small" type="button" onClick="goMod('${lecture.lxseq}');">수정</button></td>
								<td><button class="btn btn-small" type="button" onClick="goDel('${lecture.lxseq}');">삭제</button></td>
							</tr>
						</c:forEach>
					</c:if>
          		</table>
          	</div>
          	
			<c:if test="${!empty list}">
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
			</c:if>
        </div>
        <hr>
        
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>