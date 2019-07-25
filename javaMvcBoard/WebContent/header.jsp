<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<header id="header">
	<h1 class="logo"><a href="${path}/main.jsp">메인</a></h1>
	<nav class="nav">
		<ul>
			<li><a href="${path}/#">게시판</a></li>
<c:if test="${sessionScope.userID == null }">
			<li><a href="${path}/join.jsp">회원가입</a></li>
			<li><a href="${path}/login.jsp">로그인</a></li>
</c:if>
<c:if test="${sessionScope.userID != null }">
			<li><a href="${path}/#">회원정보수정</a></li>
			<li><a href="${path}/logoutAction.jsp">로그아웃</a></li>
</c:if>
		</ul>
	</nav>
</header>
</body>
</html>