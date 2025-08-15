<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <!-- 왼쪽 메뉴 -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
        <li class="nav-item"><a class="nav-link active" href="boardM.jsp">게시판</a></li>
      </ul>

      <!-- 오른쪽 메뉴 -->
      <% if (userID == null) { %>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            접속하기
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
            <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
          </ul>
        </li>
      </ul>
      <% } else { %>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            회원관리
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
          </ul>
        </li>
      </ul>
      <% } %>
    </div>
  </div>
</nav>

<!-- 글쓰기 폼 -->
<div class="container mt-4">
  <div class="row">
    <form action="writeAction.jsp" method="post">
      <table class="table table-striped text-center" style="border: 1px solid #dddddd">
        <thead>
          <tr>
            <th colspan="2" style="background-color:#eeeeee;">게시판 글쓰기 양식</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" required></td>
          </tr>
          <tr>
            <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px" required></textarea></td>
          </tr>
        </tbody>
      </table>
      <input type="submit" class="btn btn-primary float-end" value="글쓰기">
    </form>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="js/bootstrap.bundle.js"></script>
</body>
</html>
