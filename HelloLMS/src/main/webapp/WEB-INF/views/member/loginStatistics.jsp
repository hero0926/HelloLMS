<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawCrosshairs);
	
		function drawCrosshairs() {
		      var data = new google.visualization.DataTable();
		      /* data.addColumn('number', 'X'); */
		      data.addColumn('date', 'X');
		      data.addColumn('number', 'nomal');
		      data.addColumn('number', 'mobile');
		      data.addColumn('number', 'tablet');
	
		      data.addRows([
				<c:forEach var="list" items="${list}" varStatus="status">
					[new Date(<c:out value="${list.ystr}"/>, <c:out value="${list.mstr}"/>-1, <c:out value="${list.dstr}"/>), <c:out value="${list.nomalsum}"/>, <c:out value="${list.mobilesum}"/>, <c:out value="${list.tabletsum}"/>], 
				 </c:forEach>
		      ]);
	
		      var options = {
		    	hAxis: {title: 'Date', format: 'M/d'},
		        vAxis: { title: 'Frequency'},
		        colors: ['#a52714', '#097138', '#a97138'],
		        crosshair: {
		          color: '#000',
		          trigger: 'selection'
		        }
		      };
	
		      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	
		      chart.draw(data, options);
		      chart.setSelection([{row: 38, column: 1}]);
	
		    }
	</script>


	<div class="container">
        
        <div class="row">
        	<div class="span12" align="center">
        		<h3>로그인 통계</h3>
        		<hr>
        		<h6>${fromstr} 부터 ${tostr} 까지의 로그인 통계입니다</h6>
				<div id="chart_div">
					
				</div>
			</div>
     		
		</div>
        
        <hr>
        
	</div> <!-- /container -->

<%@ include file="../include/footer.jsp"%>