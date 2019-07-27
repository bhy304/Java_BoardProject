<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.bhy.model.user.userDTO"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");
	user.setUserID(userID);
	
	userDAO dao = userDAO.getInstance();
	int result = dao.updateUser(user);
	
	
	if(result == 1) {
%>
	<script type="text/javascript">
		alert("정보 수정 되었습니다.");
		document.location.href="main.jsp";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert("정보 수정 실패입니다.");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>