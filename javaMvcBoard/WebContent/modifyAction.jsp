<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.bhy.model.user.userDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");
	dto.setUserID(userID);
	
	userDAO dao = userDAO.getInstance();
	int result = dao.updateUser(dto);
	
	if(result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 수정되었습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 수정 실패입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>