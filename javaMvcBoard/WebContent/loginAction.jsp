<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.user.userDTO"%>
<%@page import="com.bhy.model.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<% 
	String ID = request.getParameter("userID");
	String PW = request.getParameter("userPassword");
	
	userDAO dao = userDAO.getInstance(); //인스턴스생성
	int loginResult = dao.login(ID, PW); 
	
	if(loginResult == 1) { 
		//로그인 성공
		userDTO dto = dao.getUser(ID);
		String userID = dto.getUserID();
		session.setAttribute("userID", userID);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");

	} else if (loginResult == 0) { 
		//비번 틀림
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (loginResult == -1) { 
		//존재하지 않는 회원
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} 
%>
</body>
</html>