	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>	    
	<%@ page import="bbs.BbsDAO" %>
	<%@ page import="java.io.PrintWriter" %> 
	<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
	<jsp:setProperty name="bbs" property="bbsTitle"/>
	<jsp:setProperty name="bbs" property="bbsContent"/>
	
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
		if(userID ==null){	
			        out.println("<script>");
			        out.println("alert('로그인을 하세요');");
			        out.println("location.href='login.jsp';"); //메인으로 돌림
			        out.println("</script>");
			    }
		else{
			
			if (bbs.getBbsTitle()==null||bbs.getBbsContent()==null){
				out.println("<script>");
				out.println("alert('값을 입력해주세요');");
				out.println("history.back();");
				out.println("</script>");
			}
			
			
			else{
				 BbsDAO bbsDAO = new BbsDAO();
				 int result=bbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent());
				    	if(result == -1){
				    		out.println("<script>");
				        	out.println("alert('글쓰기에 실패했습니다.');");
				        	out.println("history.back();");
				        	out.println("</script>");
				    	}
				    
				    	else{
				        	out.println("<script>");
				        	out.println("location.href='board.jsp'");
				        	out.println("</script>");
				    }
			}
		}
		%>
	
		
	
	</body>
	</html>