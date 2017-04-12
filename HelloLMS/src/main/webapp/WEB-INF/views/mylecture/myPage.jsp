<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/menu.jsp" %>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      <c:if test="${!empty graphTitle}">
    	google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawSeriesChart);
	    function drawSeriesChart() {
	      var data = google.visualization.arrayToDataTable([
	          ['회차', '날짜', '시간대', '강좌',     '접속수'],
	          <c:forEach var="list" items="${graphList}" varStatus="status">
				['<c:out value="${list.lxnum}"/>강', new Date(<c:out value="${list.ystr}"/>, <c:out value="${list.mstr}"/>-1, <c:out value="${list.dstr}"/>),<c:out value="${list.hstr}"/>,'<c:out value="${list.coxname}"/>',  <c:out value="${list.cnt}"/>],
			  </c:forEach>
	      ]);
	      var options = {
	        title: '${graphTitle.fromstr} 부터 ${graphTitle.tostr} 까지의 학습 현황입니다. 참고하여 열심히 학습하시기 바랍니다.',
	        hAxis: {title: '날짜', format: 'M/d'},
	        vAxis: {title: '시간'},
	        bubble: {textStyle: {fontSize: 11}}
	        
	      };
	      var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
	      chart.draw(data, options);
    	}
	  </c:if>
    
    </script>


	<div class="container">
        
        <div class="row">
        	<div class="span12" align="center">
        		<h3>학습현황</h3>
        		<c:if test="${!empty graphTitle}">
				<div id="series_chart_div" style="width: 900px; height: 500px;"></div><br>
				</c:if>
        		<c:if test="${empty graphTitle}">
        		<h1><small>최근 학습 기록이 없습니다.</small></h1>
				<br>
				</c:if>
				<hr>
        		<h3>평가점수 </h3>
        		<c:if test="${!empty gradeList}">
		          <c:forEach var="list" items="${gradeList}" varStatus="status">
	        		<h1><small><c:out value="${list.coxname}"/><c:if test="${!empty list.axscore}">:<c:out value="${list.axscore}"/>점</c:if>
	        		<c:if test="${!empty list.axresult}">(
	        			<c:if test="${list.axresult=='D'}">미이수</c:if>
	        			<c:if test="${list.axresult=='G'}">이수</c:if>
	        		)</c:if></small></h1><br>
				  </c:forEach>

				<br>
				</c:if>
        		<c:if test="${empty gradeList}">
        		<h1><small>과정에 대한 데이타가 없습니다.</small></h1>
				<br>
				</c:if>
				<hr>
        		<h3>진도</h3>
        		<c:if test="${!empty progressList}">
					<div class="container">
						<div class="row">
							<div class="span2" align="right">
							
							</div>
							<div class="span9">
							<%	 java.util.ArrayList arr = new java.util.ArrayList();
								 arr.add("striped");
								 arr.add("success");
								 arr.add("warning");
								 arr.add("danger");
								%> 
								<c:set var="array" value="<%=arr %>"/>
					          <c:forEach var="list" items="${progressList}" varStatus="status">
								<c:out value="${list.coxname}"/>
								<div class="progress progress-<c:out value='${array[status.count%4]}'/>">
								  <div class="bar" style="width: <c:out value="${list.prog}"/>%"><c:out value="${list.prog}"/>%</div>
								</div>
							  </c:forEach>
							</div>
						</div>
					</div>
        		</c:if>

        		<c:if test="${empty progressList}">
        		<h1><small>과정에 대한 데이타가 없습니다.</small></h1>
        		</c:if>
     		
          	</div>
        </div>
        <hr>
        
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>