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

	userDAO dao = userDAO.getInstance();
	if(dao.confirmID(dto.getUserID())==userDAO.MEMBER_EXISTENT){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		int result = dao.join(dto);
		if(result == userDAO.MEMBER_JOIN_SUCCESS) {
			session.setAttribute("id", dto.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 가입을 축하합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 가입에 실패했습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	}
	/* userDAO dao = new userDAO();
	
	int result = dao.join(user);
	
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName()==null || user.getUserGender()==null || user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		if (result == -1) { 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다..')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	} */
%>
</body>
</html>