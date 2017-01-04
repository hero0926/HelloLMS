<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <div class="masthead">
        <h3 class="muted">Hello LMS</h3>
        <div class="navbar">
          <div class="navbar-inner">
            <div class="container">
              <ul class="nav">
                <li onClick='$("#menu1").css("display", "block");$("#menu1").css("position", "static");'><a href="#">My Page</a></li>
                <li><a href="#">강의실</a></li>
                <li><a href="#">고객센타</a></li>
                <li class="active"><a href="#">커뮤니티</a></li>
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
      
      
<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" id="menu1">
  <li><a tabindex="-1" href="#">Action</a></li>
  <li><a tabindex="-1" href="#">Another action</a></li>
  <li><a tabindex="-1" href="#">Something else here</a></li>
  <li class="divider"></li>
  <li><a tabindex="-1" href="#">Separated link</a></li>
</ul>