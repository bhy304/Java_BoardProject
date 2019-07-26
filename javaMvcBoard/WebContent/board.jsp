<%@page import="java.util.ArrayList"%>
<%@page import="com.bhy.model.board.boardDTO"%>
<%@page import="com.bhy.model.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>JSP 게시판 웹사이트</title>
<!-- CSS Style -->
<link rel="stylesheet" href="css/style.css">
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">	
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<div id="board_container">
	<h1>게시판 글쓰기</h1>
	<div class="row">
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					boardDAO dao = new boardDAO();
					ArrayList<boardDTO> list = dao.getList(pageNumber);
					for(int i=0; i<list.size(); i++) {
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a href="boardview.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16)+ "분"%></td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(pageNumber != 1) {
		%>
			<a href="board.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn_before">이전</a>
		<%
			}
			if(dao.nextPage(pageNumber + 1)) {
		%>
			<a href="board.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn_next">다음</a>
		<%
			}
		%>
		<a href="boardwrite.jsp" class="btn_right">글쓰기</a>
	</div>
</div>

</body>
</html>