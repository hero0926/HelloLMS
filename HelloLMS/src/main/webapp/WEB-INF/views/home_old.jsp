<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="include/header.jsp" %>

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Home page</h3>
					</div>
				</div>
			</div>
		</div>
	</section>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>


<%@ include file="include/footer.jsp"%>



