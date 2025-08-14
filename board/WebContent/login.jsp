<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP 게시판 웹사이트</title>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <!-- 브랜드 -->
    <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>

    <!-- 토글 버튼 (모바일용) -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- 메뉴 -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <!-- 왼쪽 메뉴 -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
        <li class="nav-item"><a class="nav-link" href="boardM.jsp">게시판</a></li>
      </ul>

      <!-- 오른쪽 접속하기 드롭다운 -->
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            접속하기
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="join.jsp">회원</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container"><br>
  <div class="row justify-content-center">
    <div class="col-lg-4">
      <div class="p-5 bg-light rounded-3">
        <form method="post" action="loginAction.jsp">
          <h3 class="text-center mb-4">로그인 화면</h3>
          <div class="mb-3">
            <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
          </div>
          <div class="mb-3">
            <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
          </div>
          <input type="submit" class="btn btn-primary form-control" value="로그인">
        </form>
      </div>
    </div>
  </div>
</div>


<!-- Bootstrap JS (Bundle 포함: Popper.js 포함) -->
<script src="js/bootstrap.bundle.js"></script>
</body>
</html>
