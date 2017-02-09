<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
	<script>
		function goTest(tpxseq) {
			$('#tpxseq').val(tpxseq);
			alert("평가에 응시 하시겠습니까?");
			$('#frm2').attr('action','/mypage/mylecture/testpool');
			$('#frm2').submit();
		}
	</script>
	
	
   <div class="container">
	
      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>평가지 리스트 <small>...과정별 평가지 리스트 입니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
          
        <form id="frm2" method="post">
			<input type="hidden" name="tpxseq" id="tpxseq" />
		</form> 
		<div class="alert alert-info">
	        <h3>${coxname}</h3>
		</div>
		<c:if test="${ !empty testpaperList }">
			<c:forEach var="testpaper" items="${testpaperList}" varStatus="status">
				
				<table class="table table-bordered">
					<tr>
						<th>일련번호</th>
						<th>평가제목</th>
						<th>평가기간(분)</th>
						<th>응시 현황</th>
					</tr>
					
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><c:out value="${testpaper.tpxtitle }"/></td>
						<td>
							<fmt:parseDate value="${testpaper.tpxfrom}" var="dateFmt1" pattern="yyyyMMddHHmm"/>
							<fmt:formatDate value="${dateFmt1}" pattern="yyyy-MM-dd HH:mm"/>~
							<fmt:parseDate value="${testpaper.tpxto}" var="dateFmt2" pattern="yyyyMMddHHmm"/>
							<fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd HH:mm"/>(<c:out value="${testpaper.tpxduring }"/>)
						</td>
						<td>
							<c:choose>
								<c:when test="${testpaper.thistime>testpaper.tpxfrom && testpaper.thistime<testpaper.tpxto}">
									<input type="button" class="btn btn-small btn-primary disabled" value="응시 가능" onclick="goTest('${testpaper.tpxseq}')"/>
								</c:when>
								<c:otherwise>
									응시 불가
								</c:otherwise>
							</c:choose>
						</td>
						</tr>
					</table>
				
			</c:forEach>
		</c:if>
		<c:if test="${ empty testpaperList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

	</body>
</html>