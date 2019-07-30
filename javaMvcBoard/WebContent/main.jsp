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
#hello {margin: 100px ; text-align: center;}
#main {text-align: center; height: 500px;  border: 1px dotted black; line-height: 150px;}
#main .btn {border: none; color:#fff; padding: 12px 16px; background-color: #1E90FF; border-radius: 10px;  text-decoration: none;}
	
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤뉴 메뉴  -->
<c:if test="${sessionScope.userID != null }">
	<div id="hello">
		<h3><%= userID %>님 안녕하세요 :)</h3>
	</div>
	
	<div id="main">
		<h1>웹 사이트 소개</h1>
		<p>이 웹사이트는 JSP 웹사이트입니다. 최소한의 간단한 로직을 이용해서 개발했습니다.</p>
		<p><a href="#" class="btn">자세히 알아보기</a></p>
	</div>
</c:if>
</body>
</html>
