<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

	<script> 
		function viewFaq(f) {
			var x = document.getElementById('answer'+f);
		    $(x).toggle();
		}
		function goPage(curPage){
			document.location.href="/etc/faqList?curPage="+curPage;
		}
		
	</script>
	<style> 
	.panel {
	    padding: 5px;
	    display: none;
	}

	</style>
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
        <h1>FAQ<small>...자주 묻는 질문입니다.</small></h1>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3> </h3>
		<c:if test="${ !empty faqList }">
          <table class="table table-striped">
  			<tr>
  				<th width="10%" align="center">번호</th>
  				<th class="ss" align="center">제목</th>
  			</tr>
			<c:forEach var="faq" items="${faqList}" varStatus="status">
				<tr>
					<td width="5%"><c:out value="${status.count+pageVo.flimit }"/></td>
					<td align="left"><a href="javascript:viewFaq('${faq.bfxseq }');"><c:out value="${faq.bfxtitle }"/></a></td>
				</tr>
				<tr class="panel" id="answer${faq.bfxseq }">
					<td width="5%">&nbsp;</td>
					<td>
						<c:out value="${faq.bfxanswer }"/>
					</td>
				</tr>
			</c:forEach>
          </table>

          <hr>
     		<c:if test="${ !empty pageVo && pageVo.totalCount>0 }">
				<div class="pagination" style="text-align: center">
				  <ul>
					<c:if test="${ pageVo.startN > pageVo.naviSize }">
						<li><a href="javascript:goPage('1');"><i class="icon-fast-backward"></i></a></li>
				    	<li><a href="javascript:goPage('${ pageVo.startN-1}');">Prev</a></li>
					</c:if>
				    <c:forEach var="i" begin="${pageVo.startN}" end="${pageVo.endN}" step="1">
						<li <c:if test="${ pageVo.curPage ==i }">class="active"</c:if>><a href="javascript:goPage('${i}');"><c:out value="${i}" /></a></li>
				    </c:forEach>
					<c:if test="${ pageVo.totalPage > pageVo.endN }">
				    	<li><a href="javascript:goPage('${ pageVo.endN+1}');">Next</a></li>
				    	<li><a href="javascript:goPage('${ pageVo.totalPage}');"><i class="icon-fast-forward"></i></a></li>
					</c:if>
				  </ul>
				</div>
			</c:if>
		</c:if>
		<c:if test="${ empty faqList }">
			자료가 없습니다.
		</c:if>

        </div>
      </div>

      <hr>

    </div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>