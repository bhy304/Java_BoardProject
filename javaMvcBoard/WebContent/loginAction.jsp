<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.user.userDTO"%>
<%@page import="com.bhy.model.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<% 
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}

	request.setCharacterEncoding("UTF-8");
	
	String ID = request.getParameter("userID");
	String PW = request.getParameter("userPassword");
	
	userDAO dao = userDAO.getInstance();
	
	int loginResult = dao.login(ID, PW);
	if(loginResult == 1) {
		userDTO dto = dao.getUser(ID);
		if(dto == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 회원입니다.')");
			script.println("history.back()");
			script.println("</script>");	
		} else {
			String userid = dto.getUserID();
			session.setAttribute("userID", userid);
			session.setAttribute("ValidUser","yes");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	} else if (loginResult == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (loginResult == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} 
	
	
%>

</body>
</html>