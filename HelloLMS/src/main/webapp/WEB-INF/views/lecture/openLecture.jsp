<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

	<div class="container">
	
	<script type="text/javascript">
			function lecturepopup(lxtype, lxlink, lxseq, coxseq){
				var popUrl;
				alert(lxtype);
				if(lxtype=="12"){
					popUrl = "lecture?lxlink="+lxlink+"&coxseq="+coxseq;
					alert(popUrl);
				} else if(lxtype=="11"){
					popUrl = "/download?path=/resources/lecture&fileName="+lxlink;
				} else if(lxtype=="13"){
					popUrl = lxlink;
				}
				winopen(popUrl, "lecture");
				doStudy(lxseq);
			}
			function quizpopupOpen(lxseq){
				
				var popOption = "resizable=no, scrollbars=no, status=no, width=500, height=500, top=200, left=500"; //팝업창 옵션
				window.open("/quiz?lxseq="+lxseq,"quiz",popOption);
				//winopen("/quiz?lxseq="+lxseq, "quiz");
				
				
/* 				var popUrl = "quizpopup";
				var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl, "", popOption);
 */			}
			
			function winopen(url, title){
				var popUrl = url;
				var popOption = "width=1080, height=600, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl, title, popOption);
			}
	</script>
	
		<div class="page-header">
        	<h1><small>강의실  > 공개 강좌</small></h1>
        </div>
        
        <div class="row">
        	<div class="span12">
        		<h3>강의 목록<small>...수강중인 과정의 강의 목록입니다.</small></h3>
        		<div class="alert alert-info">
        			<h3><c:out value="${coxname}"/></h3>
  				</div>
        		<table class="table table-bordered">
	  				<tr>
		  				<th>회차</th>
		  				<th>강의 제목</th>
		  				<th>강의보기</th>
		  				<th>강의자료</th>
		  				<th>Quiz</th>
		  			</tr>
		  			
					
	  				<c:if test="${!empty list}">
	  					<c:forEach var="lecture" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${lecture.lxnum}"/></td>
								<td><c:out value="${lecture.lxname}"/></td>
								<td><c:if test="${!empty lecture.lxlink}"><a href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lecture.lxseq}', '${lecture.coxseq}');"><button type="submit" class="btn">강의보기&nbsp;<i class="icon-facetime-video"></i></button></a></c:if></td>
								<td><c:if test="${!empty lecture.lxfile}"><a href="/download?path=/resources/lecture/&fileName=${lecture.lxfile}" ><c:out value="${lecture.lxfile}"/> <i class="icon-download-alt"></i></a></c:if></td>
								<td><c:if test="${lecture.qxcnt>0}"><a href="javascript:quizpopupOpen('<c:out value="${lecture.lxseq}"/>');"><button type="submit" class="btn<c:if test="${lecture.qaxcnt>0}"> btn-link</c:if>">Quiz</button></a></c:if>
									
								</td>
								</tr>
						</c:forEach>
					</c:if>
          		</table>
          	</div>
        </div>
        <hr>
        
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>