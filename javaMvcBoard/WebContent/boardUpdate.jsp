<%@page import="com.bhy.model.board.boardDAO"%>
<%@page import="com.bhy.model.board.boardDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>JSP 게시판 웹사이트</title>
<!-- CSS Style -->
<link rel="stylesheet" href="css/reset.css">
<style>
/* 게시판 글쓰기 */
#update_container {position: relative;  overflow: hidden; width: 700px; height: 800px; margin: 150px auto 0; padding: 0;}
#update_container .row {background: #f8f8f8;}
#update_container .row table {border: 1px black; width: 100%;}
#update_container .row table caption {font-size: 20px; table-layout: auto;}
#update_container .row table input {width: 600px; margin: 20px 50px auto; }
#update_container .row table textarea {width: 600px; height:350px; margin: 20px 50px auto;}
#update_container .row .button {border: none; color:#fff; padding: 12px 16px; background-color: #1E90FF; border-radius: 10px; margin: 10px 10px; text-decoration: none;}

</style>
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">	
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤뉴 메뉴  -->
<%
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
	boardDTO board = new boardDAO().getBoard(bbsID);
	if(!userID.equals(board.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
%>
<div id="update_container">
	<div class="row">
		<form action="boardUpdateAction.jsp?bbsID=<%= bbsID %>" method="post">
			<table>
			<caption><b>게시판 글수정</b></caption>
			<tr>
				<td><input type="text" placeholder="제목을 입력해 주세요" name="bbsTitle" maxlength="50" value="<%= board.getBbsTitle() %>"></td>
			</tr>
			<tr>
				<td><textarea placeholder="내용" name="bbsContent" maxlength="2048"><%= board.getBbsContent() %></textarea></td>
			</tr>
			</table>
			<input class="button" type="submit" value="수정">&nbsp;<input class="button" type="reset" value="취소" onclick="javascript:location.href='board.jsp'">
		</form>
	</div>
</div>

</body>
</html>