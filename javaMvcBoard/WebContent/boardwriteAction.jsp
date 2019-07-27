<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="com.bhy.model.board.boardDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="board" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");

	if(board.getBbsTitle() == null || board.getBbsContent() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		boardDAO dao = new boardDAO();
		int result = dao.write(board.getBbsTitle(), userID, board.getBbsContent());
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패하였습니다.')"); //데이터베이스 오류
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
	}
%>

</body>
</html>