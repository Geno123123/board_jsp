<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- java클래스를 jsp에서 사용하겠다. -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
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
	
	
    UserDAO userDAO = new UserDAO();
    int result = userDAO.login(user.getUserID(), user.getUserPassword());

    if(result == 1){
    	session.setAttribute("userID", user.getUserID());
        out.println("<script>");
        out.println("alert('로그인 성공');");
        out.println("location.href='main.jsp';"); // 로그인 성공 후 이동
        out.println("</script>");
    }
    else if(result == 0){
        out.println("<script>");
        out.println("alert('비밀번호가 틀립니다.');");
        out.println("history.back();");
        out.println("</script>");
    }
    else if(result == -1){
        out.println("<script>");
        out.println("alert('존재하지 않는 아이디입니다.');");
        out.println("history.back();");
        out.println("</script>");
    }
    else if(result == -2){
        out.println("<script>");
        out.println("alert('데이터베이스 오류');");
        out.println("history.back();");
        out.println("</script>");
    }
	%>

	

</body>
</html>