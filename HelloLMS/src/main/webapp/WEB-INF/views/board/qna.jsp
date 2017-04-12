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
			if ($('#searchName').val() == 'bxqsubject') {
				$('#bxqsubject').val($('#searchTxt').val());
				$('#bxqcontent').val('');
				$('#bxqrepcontent').val('');
			} else if ($('#searchName').val() == 'bxqcontent') {
				$('#bxqsubject').val('');
				$('#bxqcontent').val($('#searchTxt').val());
				$('#bxqrepcontent').val('');
			} else if ($('#searchName').val() == 'bxqrepcontent') {
				$('#bxqsubject').val('');
				$('#bxqcontent').val('');
				$('#bxqrepcontent').val($('#searchTxt').val());
			} else {
				$('#bxqsubject').val($('#searchTxt').val());
				$('#bxqcontent').val($('#searchTxt').val());
				$('#bxqrepcontent').val($('#searchTxt').val());
			}
			$('#frmSearch').submit();
		}
	}

	function setHolder() {
		if ($('#searchName').val() == 'bxqsubject') {
			$('#searchTxt').attr('placeholder', '제목으로 검색합니다.');
		} else if ($('#searchName').val() == 'bxqcontent') {
			$('#searchTxt').attr('placeholder', '내용으로 검색합니다.');
		} else if ($('#searchName').val() == 'bxqrepcontent') {
			$('#searchTxt').attr('placeholder', '답변내용으로 검색합니다.');
		} else {
			$('#searchTxt').attr('placeholder', '제목이나 내용이나 답변내용으로 검색합니다.');
		}
	}
</script>
<input type="hidden" name="mxseq" value="${USEQ}">
<div class="container">
	<div class="page-header">
		<h1>
			QNA 목록<small>...QNA 목록을 보여줍니다.</small>
		</h1>
	</div>
	<div class="alert alert-info"></div>
	<form action="/board/qna/searchQna" id="frmSearch" name="frmSearch">
		<input type="hidden" name="bxqsubject" id="bxqsubject"> 
		<input type="hidden" name="bxqcontent" id="bxqcontent">
		<input type="hidden" name="bxqrepcontent" id="bxqrepcontent">
		<div class="col-xs-5">
			<select name="searchName" id="searchName" onChange="setHolder();">
				<option value="bxqsubject">제목</option>
				<option value="bxqcontent">내용</option>
				<option value="bxqrepcontent">답변내용</option>
				<option value="mix">제목+내용+답변내용</option>
			</select>
			<%-- <c:if test=""> --%>
			<input type="text" class="form-control col-xs-5" placeholder="제목으로 검색합니다." name="searchTxt" id="searchTxt" onkeydown="chkEnter();">
			<button class="btn btn-default" type="button" id="clickBtn" onclick="sc();">
				<i class="icon-search icon-black"></i>
			</button>
		</div>
		<%-- </c:if> --%>
	</form>
	<table class="table table-bordered">
		<tr>
			<th><div class="span1">번호</div></th>
			<th><div class="span4">제목</div></th>
			<th><div class="span2">문의날짜</div></th>
		</tr>
		<c:forEach items="${rep}" var="rep" varStatus="i">
			<input type="hidden" name="bxqgrid" value="${rep.bxqgrid}">
			<input type="hidden" name="bxqno" value="${rep.bxqno}">
			<input type="hidden" name="bxqseq" value="${rep.bxqseq}">
			
			<fmt:parseDate value="${rep.qnadate}" var="dateFmt"
				pattern="yyyyMMdd" />

			<tr>
				<td><div class="span1">${i.count}</div></td>

				<c:choose>
					<c:when test="${rep.bxqno==null}">
						<td><div class="span4">
								<a href="/board/qna/readQna?bxqseq=${rep.bxqseq}">[<font
									color="red"> 답변 준비중 </font>]&nbsp;${rep.bxqsubject}
								</a>
							</div></td>
					</c:when>
					<c:otherwise>
						<td><div class="span4">
								<a href="/board/qna/readQna?bxqseq=${rep.bxqseq}">[<font
									color="blue"> 답변 완료 </font>]&nbsp; ${rep.bxqsubject}
								</a>
							</div></td>
					</c:otherwise>
				</c:choose>
				<td><div class="span2">
						<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM. dd" />
					</div></td>
			</tr>
		</c:forEach>
	</table>
	<table class="table table-bordered">
		<tr>
			<td><div class="span1"><button type="button" class="btn btn-default btn-sm" onclick="location.href='/board/qna/write'">새 문의</button></div></td>
			<td><div class="span4"></div></td>
			<td><div class="span2"></div></td>
			<td><div class="span1"></div></td>
		</tr>
	</table>
	
</div>
<br>


<%@ include file="../include/footer.jsp"%>