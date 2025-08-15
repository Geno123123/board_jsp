	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ page import="bbs.BbsDAO"%>
	<%@ page import="bbs.Bbs"%>
	<%@ page import="java.util.ArrayList"%>
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
			String userID=null;
			if(session.getAttribute("userID")!=null){
				userID = (String) session.getAttribute("userID");
			}
			int pageNumber=1;
			if(request.getParameter("pageNumber")!=null){
				pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
			}
		%>
	
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
	        <li><a class="nav-link" href="main.jsp">메인</a></li>
	        <li class="active"><a class="nav-link" href="boardM.jsp">게시판</a></li>
	      </ul>
	
	      <%
	      		if(userID==null){
	   	   %>
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
	      <% 
	      	} else{
	    	  %>
	    	  
	    	  <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            회원관리
	          </a>
	          <ul class="dropdown-menu dropdown-menu-end">
	            <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
	          </ul>
	        </li>
	    	  <% } %>      
	    </div>
	  </div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align: center">번호</th>
						<th style="background-color:#eeeeee; text-align: center">제목</th>
						<th style="background-color:#eeeeee; text-align: center">작성자</th>
						<th style="background-color:#eeeeee; text-align: center">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i=0;i<list.size();i++){
						
					
					%>
					<tr>
						<td><%= list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID()%></td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분"%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber !=1){
					
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber+1)){
					
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
	
	<!-- Bootstrap JS (Bundle 포함: Popper.js 포함) -->
	<script src="js/bootstrap.bundle.js"></script>
	</body>
	</html>
