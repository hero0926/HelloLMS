<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/ad_menu.jsp" %>
	
   <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="page-header">
       <h1>FAQ 리스트 <small>...FAQ를 관리합니다..</small></h1>
       </div>

      <!-- Example row of columns -->
      <div class="row">
        
        <div class="span12">
        <h3>  </h3>
                     
		<div class="alert alert-info">
	        <div id="search_faq"  class="print_display_none">
				<ul class="crr_detail_search">
					<li>
						<label for="search_input">질문유형</label>
						<select name="검색" id="search_input"  >
						  <option value="All">전체</option>
						  <option value="category_key_1">강좌관련</option>
						  <option value="category_key_2">계정관련</option>
						</select>
					</li>
					<li>
						<label for="search_field">검색</label>
						<input name="search_field" type="text" class="input_left" id="search_field"  style="width:233px;"  />
						<button id="ui_search_btn" >검색 </button>
					</li>
				</ul>
			</div>

			 <ul class="crr_faq" id="acc">
				<li class="on">		
					<p class="question">
					
						<span class="blind">질문</span>
						<a href="#"><span>응시자격 / 지원방법</span><class="dropdown-toggle" data-toggle="dropdown"><em>3급 신입사원의 응시자격은?</em><b class="caret"></b></a>
						<ul class="dropdown-menu">
					<div class="answer">
						<div class="inner">
							<span class="blind">답변</span>
							 사별특성에 따라 자격 및 대상이 달라질 수 있습니다. 경력 채용 안내는 경력채용 게시판을 참고해 주시고 기타 자세한 문의는 해당회사로 문의해 주시기 바랍니다. 
							 <br />
							 사별특성에 따라 자격 및 대상이 달라질 수 있습니다. 경력 채용 안내는 경력채용 게시판을 참고해 주시고 기타 자세한 문의는 해당회사로 문의해 주시기 바랍니다. 
							 <br />
							 사별특성에 따라 자격 및 대상이 달라질 수 있습니다. 경력 채용 안내는 경력채용 게시판을 참고해 주시고 기타 자세한 문의는 해당회사로 문의해 주시기 바랍니다. 
						</div>
						</ul>
						
					</div>
				</li>
				<li>
				<div class="nav-collapse collapse">
            <ul class="nav">
              <li class="dropdown">
              	<a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				  <li><a href="#about"  onClick="alert('로그인 하세요.');">개인정보수정</a></li>
				  <li class="dropdown-submenu">
				    <a tabindex="-1" href="#">내강의</a>
				    <ul class="dropdown-menu">
				      <li><a href="#about" onClick="alert('로그인 하세요.');">수강신청한 과정</a></li>
				      <li><a href="#about" onClick="alert('로그인 하세요.');">수강중인 과정</a></li>
				    </ul>
				  </li>
				</ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">강의실 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#" onClick="alert('로그인 하세요.');">수강신청가능한 강좌</a></li>
                  <li><a href="#" onClick="alert('로그인 하세요.');">진행중인 강좌</a></li>
                  <li><a href="/course/openCourse">공개 강좌</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                	<li><a href="/board/notice">공지사항</a></li>
                	<li><a href="#">FAQ</a></li>
     			    <li><a href="#" onclick="alert('로그인 하세요.');">Q&A</a></li>
                </ul>
              </li>
            </ul>

            <form class="navbar-form pull-right" action="/member/loginPost" method="post">
              <input class="span2" type="text" name="mxid" placeholder="ID">
              <input class="span2" type="password" name ="mxpw" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>&nbsp;
              <button type="button" class="btn" onClick="javascript:document.location.href='/member/register1';">Join us</button>
            </form>
          </div>				
					<p class="question">
						<span class="blind">질문</span>
						<a href="#"><span>지원서 작성 / 수정</span><em>인문학 전공 중에서도 특히 삼성에서 선호하는 분야가 있나요?</em></a>
					</p>
					<div class="answer">
						<div class="inner">
							<span class="blind">답변</span>
							 답변
						</div>
					</div>
				</li>
				<li>				
					<p class="question">
						<span class="blind">질문</span>
						<a href="#"><span>지원회사 변경</span><em>교육 과정 중 급여는 지급하나요?</em></a>
					</p>
					<div class="answer">
						<div class="inner">
							<span class="blind">답변</span>
							 답변
						</div>
					</div>
				</li>
           </ul>



<%@ include file="../include/footer.jsp"%>