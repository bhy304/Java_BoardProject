<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% String userID = (String) session.getAttribute("userID"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>JSP 게시판 웹사이트</title>
<!-- CSS Style -->
<link rel="stylesheet" href="css/reset.css">
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">	
<style>
	.hello {margin: 400px auto; text-align: center;}
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤뉴 메뉴  -->
<c:if test="${sessionScope.userID != null }">
	<div class="hello">
		<h1><%=userID %>님 안녕하세요 :)</h1>
	</div>
</c:if>
</body>
</html>
