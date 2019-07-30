<%@page import="java.io.PrintWriter"%>
<%@page import="com.bhy.model.board.boardDAO"%>
<%@page import="com.bhy.model.board.boardDTO"%>
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
#view_container {position: relative;  overflow: hidden; width: 700px; height: 800px; margin: 150px auto 0; padding: 0;}
#view_container h1 {margin: 15px 0; text-align: center;}
#view_container .view_row {background: #f8f8f8;}
#view_container .view_row .view_table {border: 1px black; width: 100%; height: 300px; font-size: 20px;}
#view_container .view_row .view_table .title {width: 20%; font-weight: bold;}
#view_container .view_row .view_table .content {border: 1px dotted #999; min-height: 200px; text-align: left;}
#view_container .view_row .btn {float: left; border: none; color:#fff; padding: 12px 16px; background-color: #1E90FF; border-radius: 10px; margin: 10px 2px; text-decoration: none; font-weight: bold;}
#view_container .view_row .btn_update {float: right; border: none; color:#fff; padding: 12px 16px; background-color: #2ecc71; border-radius: 10px; margin: 10px 2px; text-decoration: none;}
#view_container .view_row .btn_delete {float: right; border: none; color:#fff; padding: 12px 16px; background-color: #e74c3c; border-radius: 10px; margin: 10px 2px; text-decoration: none;}
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
	if(session.getAttribute("userID") != null){
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
%>
<div id="view_container">
<h1>게시판 글보기</h1>
	<div class="view_row">		
			<table class="view_table">
			<tr>
				<td class="title">제목</td>
				<td class="content"><%= board.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
			</tr>
			<tr>
				<td class="title">작성자</td>
				<td class="content"><%= board.getUserID() %></td>
			</tr>
			<tr>
				<td class="title">작성일</td>
				<td class="content"><%= board.getBbsDate().substring(0, 11) + board.getBbsDate().substring(11, 13) + "시" + board.getBbsDate().substring(14, 16)+ "분" %></td>
			</tr>
			<tr>
				<td class="title">내용</td>
				<td class="content"><%= board.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
			</tr>
			</table>
			<input class="btn" type="submit" value="목록" onclick="javascript:location.href='board.jsp'">
			<%
				// 글 작성자는 글 수정과 글 삭제 가능
				if(userID != null && userID.equals(board.getUserID())) {
			%>
					<a href="boardUpdate.jsp?bbsID=<%= bbsID %>" class="btn_update">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDeleteAction.jsp?bbsID=<%= bbsID %>" class="btn_delete">삭제</a>
			<%
				}
			%>
	</div>
</div>

</body>
</html>
