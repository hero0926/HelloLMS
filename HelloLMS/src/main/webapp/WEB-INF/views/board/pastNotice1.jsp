<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<script>
function chkEnter() {
	 
    if (event.which || event.keyCode) {

        if ((event.which == 13) || (event.keyCode == 13)) {
       
            $("#clickBtn").click();
            return false;
        }
    }
    else {       
        return true;
    }
}

	function sc() {
		if (!$.trim($('#searchTxt').val())) {
			alert('검색할 키워드를 입력해 주세요.');
		} else {
			if ($('#searchName').val() == 'bxnsubject') {
				$('#bxnsubject').val($('#searchTxt').val());
				$('#bxncontent').val('');
			} else if ($('#searchName').val() == 'bxncontent') {
				$('#bxnsubject').val('');
				$('#bxncontent').val($('#searchTxt').val());
			} else {
				$('#bxnsubject').val($('#searchTxt').val());
				$('#bxncontent').val($('#searchTxt').val());
			}
			$('#frmSearch').submit();
		}
	}

	function setHolder() {
		if ($('#searchName').val() == 'bxnsubject') {
			$('#searchTxt').attr('placeholder', '제목으로 검색합니다.');
		} else if ($('#searchName').val() == 'bxncontent') {
			$('#searchTxt').attr('placeholder', '내용으로 검색합니다.');
		} else {
			$('#searchTxt').attr('placeholder', '제목이나 내용으로 검색합니다.');
		}
	}
</script>
<div class="container">
	<div class="page-header">
		<h1>
			공지사항 목록 <small>...공지사항 목록을 보여줍니다.</small>
		</h1>
	</div>
	<form action="/board/notice/searchNotice" id="frmSearch" name="frmSearch">
		<input type="hidden" name="bxnsubject" id="bxnsubject"> 
		<input type="hidden" name="bxncontent" id="bxncontent">
		<div class="col-xs-5">
			<select name="searchName" id="searchName" onChange="setHolder();">
				<option value="bxnsubject">제목</option>
				<option value="bxncontent">내용</option>
				<option value="mix">제목+내용</option>
			</select>
			<%-- <c:if test=""> --%>
			<input type="text" class="form-control col-xs-5" placeholder="제목으로 검색합니다." name="searchTxt" id="searchTxt" onkeydown="chkEnter();">
			<button class="btn btn-default" type="button" id="clickBtn" onclick="sc();">
				<i class="icon-search icon-black"></i>
			</button>
		</div>
		<%-- </c:if> --%>
	</form>
	<!-- <form action="/board/notice/searchNotice" method="get" id="frmSearch">
	<div class="alert alert-info"></div> -->
	<table class="table table-bordered">
		<!-- <tr>
					<td></td>
					<td></td>
					<td><select name="searchName">
						<option value="bxnsubject">글제목</option>
						<option value="bxncontent">글내용</option>
						<option value="">글제목+글내용</option>
					</select></td>
					<td><input id="cmtn" name="searchValue"></td>
					<td><button type="button" class="btn btn-default btn-sm" onclick="sc();">검색</button></td>
			</tr> -->
		<!-- 			</form> -->
		<tr>
		<td><div class="span1"><a href="/board/notice">최근 공지</a></div></td>
		<td><div class="span4"></div></td>
		<td><div class="span2"></div></td>
		<td><div class="span1"></div></td>
		</tr>
		<tr>
			<th><div class="span1">번호</div></th>
			<th><div class="span4">제목</div></th>
			<th><div class="span2">작성일</div></th>
			<th><div class="span1">조회수</div></th>
		</tr>
		<%-- <c:forEach items="${notice}" var="list" varStatus="i" begin="${i.end}+10"> --%>
		<c:forEach items="${notice}" var="list">
			<fmt:parseDate value="${list.regdate}" var="dateFmt"
				pattern="yyyyMMdd" />
			<tr>
				<%-- <td><div class="span1">${list.bxnseq}</div></td> --%>
				<td><div class="span1">${list.count}</div></td>

				<td><div class="span4">
						<a href="/board/notice/readNotice?bxnseq=${list.bxnseq}">
							${list.bxnsubject}
							<c:if test="${list.bxnfile1 != null}"><i class="icon-file"></i></c:if>
							<c:if test="${list.ASNEW_FLG == 'NEW'}">
								<font color="blue"><small>[ NEW! ]</small></font>
									<c:if test="${list.bxncnt >= 20}">
										<font color="red">[ HOT! ]</font>
									</c:if>
							</c:if>
							<c:if test="${list.ASNEW_FLG == 'OLD'}">
								<c:if test="${list.bxncnt >= 20}">
									<font color="red"><small>[ HOT! ]</small></font>
								</c:if>
							</c:if>
						</a>
					</div></td>

				<td><div class="span2">
						<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" />
					</div></td>
				<td><div class="span1">${list.bxncnt}</div></td>
			</tr>
		</c:forEach>
			<c:if test="${pPageCnt < sPage}">
		<h6><a href="/board/notice?cPage=${cPage - 1}">이전페이지</a></h6>
	</c:if>
	<c:forEach var="page" begin="${sPage}" end="${(sPage + pPageCnt) - 1}">
		<c:if test="${page<=tPage}">
			<c:if test="${page==cPage}">
				<span style="font-size:20px;color:red"><a href="/board/pastNotice?cPage=${page}">${page}</a></span>
			</c:if>
			<c:if test="${page!=cPage}">
				<span><a href="/board/pastNotice?cPage=${page}">${page}</a></span>
			</c:if>
		</c:if>
	</c:forEach>
	<c:if test="${cPage < tPage}">
		<h6><a href="/board/pastNotice?cPage=${cPage+1}">다음페이지</a></h6>
	</c:if>
		<c:if test="${!empty USEQ}">
			<%
				String udiv = session.getAttribute("UDIV").toString();
					request.setAttribute("udiv", udiv);
			%>
			<c:if test="${udiv=='A'}">
				<tr>
					<td><div class="span1"><button type="button" onclick="location.href='/board/notice/write'">새 공지</button></div></td>
					<td><div class="span4"></div></td>
					<td><div class="span2"></div></td>
					<td><div class="span1"></div></td>
				</tr>
			</c:if>
		</c:if>
	</table>
</div>
<%@ include file="../include/footer.jsp"%>