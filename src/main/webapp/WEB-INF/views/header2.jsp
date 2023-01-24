<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/main">
        <img src="images/logo.jpeg" alt="로고" style="width: 100px; height: 70px;">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasNavbarLabel">동네친구</h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        
        <div class="offcanvas-body">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link" href="/main">홈</a>
              </li>
              <li class="nav-item dropdown">
              <a class="nav-link" href="/logoutAction">로그아웃</a>
            </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="/diary">다이어리</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="/chat">채팅하기</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="/promlist">약속목록</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="/visitor">방명록</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="/gallery">사진첩</a>
              </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
	
</div>
  