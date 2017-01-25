<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

	<div class="container">
	
	<script type="text/javascript">
			function lecturepopup(lxtype, lxlink, lxseq, coxseq){
				var popUrl;
				if(lxtype=="12"){
					popUrl = "lecture?lxlink="+lxlink+"&coxseq="+coxseq;
				} else if(lxtype=="11"){
					popUrl = "/download?path=/resources/lecture&fileName="+lxlink;
				} else if(lxtype=="13"){
					popUrl = lxlink;
				}
				winopen(popUrl);
				doStudy(lxseq);
			}
			function quizpopupOpen(){
				winopen("quizpopup");
/* 				var popUrl = "quizpopup";
				var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl, "", popOption);
 */			}
			
			function winopen(url){
				var popUrl = url;
				var popOption = "width=1080, height=720, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl, "", popOption);
			}
			function doStudy(lxseq) {
				$.ajax({
					type : "POST",
					url : "/mypage/mylecture/lexstudy",
					data : {
						lxseq : lxseq
					},
					dataType : "json"
				//contentType: "application/json; charset=utf-8"
				}).done(function() {
					/* $('.ajaxLayer').hide(); */
					//alert(msg.message);
					//var html = '<div>'+msg.message+'</div>';
					//$('#test_Div').html(msg.message);
				});
			}
	</script>
	
		<div class="page-header">
        	<h1><small>My Page  >  내 강의  >  수강 중인 과정</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<h3>강의 목록<small>...수강중인 과정의 강의 목록입니다.</small></h3>
        		<div class="alert alert-info">
        			<h3><c:forEach var="test" items="list" end="2" varStatus="status"><c:out value="${list[status.index].coxname}"/></c:forEach></h3>
  				</div>
        		<table class="table table-bordered">
	  				<tr>
		  				<th>회차</th>
		  				<th>강의 제목</th>
		  				<th>수강 여부</th>
		  				<th>강의보기</th>
		  				<th>다운로드</th>
		  				<th>Quiz</th>
		  			</tr>
		  			
        			<c:forEach var="test" items="list" end="2" varStatus="status">
        				<c:set value="${list[status.index].coxseq}" var="coxseq" />
        			</c:forEach>
        			<c:forEach var="test" items="list" end="2" varStatus="status">
        				<c:set value="${list[status.index].lxseq}" var="lxseq" />
        			</c:forEach>
					
	  				<c:if test="${!empty list}">
	  					<c:forEach var="lecture" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${lecture.lxnum}"/></td>
								<td><c:out value="${lecture.lxname}"/></td>
								<td><c:if test="${empty lecture.regdate}">미</c:if>수강</td>
								<%-- <td><c:if test="${!empty lecture.lxlink}"><a href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lexture.lxseq}', '${lexture.coxseq}');"><button type="submit" class="btn">강의보기</button></a></c:if></td> --%>
								<td><c:if test="${!empty lecture.lxlink}"><a href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lxseq}', '${coxseq}');"><button type="submit" class="btn">강의보기</button></a></c:if></td>
								<td><c:if test="${!empty lecture.lxfile}"><a href="/download?path=/resources/lecture/&fileName=${lecture.lxfile}" ><button type="submit" class="btn" onClick="fileDown();">다운로드</button></a></c:if></td>
								<td><c:if test="${!empty lecture.quiz}"><a href="javascript:quizpopupOpen();"><button type="submit" class="btn">Quiz</button></a></c:if></td>
								</tr>
						</c:forEach>
					</c:if>
          		</table>
          	</div>
        </div>
        <hr>
        
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>