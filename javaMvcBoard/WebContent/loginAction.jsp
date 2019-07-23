<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.user.userDTO"%>
<%@page import="com.bhy.model.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPassword");
	
	userDAO dao = userDAO.getInstance();
	
	int loginResult = dao.login(userID, userPW);
	if (loginResult == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (loginResult == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(loginResult == 1) {
		userDTO dto = dao.getUser(userID);
		if(dto == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 회원입니다.')");
			script.println("history.back()");
			script.println("</script>");	
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	} 	
%>

</body>
</html>