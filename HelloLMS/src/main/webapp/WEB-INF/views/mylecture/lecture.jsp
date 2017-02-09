<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>

		<script type="text/javascript">
				/* function lecturepopup(lxtype, lxlink, lxseq, coxseq){
					var popUrl;
					if(lxtype=="12"){
						popUrl = "lecture?lxlink="+lxlink+"&coxseq="+coxseq;
						alert("lecture-lecturepopupUrl----"+popUrl);
					} else if(lxtype=="11"){
						popUrl = "/download?path=/resources/lecture&fileName="+lxlink;
					} else if(lxtype=="13"){
						popUrl = lxlink;
					}
					document.location.href=popUrl;
					//winopen(popUrl);
					doStudy(lxseq);
				} */
				function lecturepopup(lxtype, lxlink, lxseq, coxseq){
					var popUrl;
					if(lxtype=="12"){
						popUrl = "lecture?lxlink="+lxlink+"&lxtype="+lxtype+"&coxseq="+coxseq;
					} else if(lxtype=="11"){
						popUrl = "/download?path=/resources/lecture&fileName="+lxlink;
					} else if(lxtype=="13"){
						/* popUrl = lxlink; */
						popUrl = "lecture?lxlink="+lxlink+"&lxtype="+lxtype+"&coxseq="+coxseq;
					}
					winopen(popUrl, "lecture");
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
					/* var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
						window.open(popUrl, "", popOption); */
					location.replace(popUrl);
				}
				function doStudy(lxseq) {
					$.ajax({
						type : "POST",
						url : "/mypage/mylecture/lexstudy",
						data : {
							lxseq : lxseq
						},
						dataType : "text"
					//contentType: "application/json; charset=utf-8"
					}).done(function() {
						opener.parent.location.reload();
						/* $('.ajaxLayer').hide(); */
						//alert(msg.message);
						//var html = '<div>'+msg.message+'</div>';
						//$('#test_Div').html(msg.message);
					});
				}
		</script>

	<div class="container-fluid">
	
		<div class="row-fluid">
			<div class="span10">
				<c:if test="${lecture.lxtype=='12'}">
					<video  class="span12" controls >
						<source src="/resources/lecture/${lecture.lxlink}" type="video/mp4">
					</video>
				</c:if>
	    		<c:if test="${lecture.lxtype=='13'}">
					<iframe width="750" height="500" src="${lecture.lxlink}" style="border:none;" frameborder="1">
						iframe을 지원하지 않는 브라우저를 사용하고 계십니다. 최신버전의 브라우저로 업그레이드 후 사용하세요
					</iframe>
				</c:if>
	    	</div>
	    	
		    <div class="span2">
				<table class="table table-bordered">
		 			<tr>
		  				<th>회차</th>
		  				<th>강의 제목</th>
		  			</tr>
		  			
			        <c:if test="${!empty list}">
						<c:forEach var="lecture" items="${list}" varStatus="status">
							<tr>
								<td><c:out value="${lecture.lxnum}"/></td>
								<td><c:out value="${lecture.lxname}"/>
									&nbsp;&nbsp;<c:if test="${!empty lecture.lxlink}"><a href="javascript:lecturepopup('${lecture.lxtype}', '${lecture.lxlink}', '${lecture.lxseq}', '${lecture.coxseq}');"><i class="icon-facetime-video"></i></a></c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>	      
		      
		    </div>
	  </div>
	
	</div>