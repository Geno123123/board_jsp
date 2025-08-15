
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    
	<%@ page import="user.UserDAO" %>
	<%@ page import="java.io.PrintWriter" %> <!-- java클래스를 jsp에서 사용하겠다. -->
	<jsp:useBean id="user" class="user.User" scope="page"/>
	<jsp:setProperty name="user" property="userID"/>
	<jsp:setProperty name="user" property="userPassword"/>
	<jsp:setProperty name="user" property="userGender"/>
	<jsp:setProperty name="user" property="userName"/>
	<jsp:setProperty name="user" property="userEmail"/>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
		String userID=null;
		if(session.getAttribute("userID")!=null){ //세션에 userID로 저장된 것이 없으면
			userID=(String)session.getAttribute("userID");
		}
		if(userID !=null){
	    	session.setAttribute("userID", user.getUserID());
	        out.println("<script>");
	        out.println("alert('이미 로그인이 되어있습니다.');");
	        out.println("location.href='main.jsp';"); //메인으로 돌림
	        out.println("</script>");
	    }
		
		if (user.getUserID()==null||user.getUserPassword()==null||user.getUserName()==null||user.getUserGender()==null||user.getUserEmail()==null){
			out.println("<script>");
	        out.println("alert('값을 입력해주세요');");
	        out.println("history.back();");
	        out.println("</script>");
		}
		
		
		else{
			 UserDAO userDAO = new UserDAO();
			 int result=userDAO.join(user);
	    	if(result == -1){
	    		out.println("<script>");
	        	out.println("alert('이미 존재하는 아이디입니다.');");
	        	out.println("history.back();");
	        	out.println("</script>");
	    	}
	    
	    	else{
	        	session.setAttribute("userID", user.getUserID());
	        	out.println("<script>");
	        	out.println("location.href='main.jsp'");
	        	out.println("</script>");
	    }
		}
	   
		%>
	
		
	
	</body>
	</html>