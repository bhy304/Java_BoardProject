<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
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
</head>
<body>
<script>
function go() {
	var userID = "<%=session.getAttribute("userID")%>";
	if (userID == "null"){
		alert("로그인 후 이용가능합니다.");
		window.location.href = '${pageContext.request.contextPath}/login.jsp';
	} else {
		window.location.href = '${pageContext.request.contextPath}/board.jsp';
	}
};
</script>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<header id="header">
	<h1 class="logo"><a href="${path}/main.jsp">board</a></h1>
	<nav class="nav">
		<ul>		
			<li><a href="javascript:void(0);" onclick="go();">게시판</a></li>	
<c:if test="${sessionScope.userID == null }">
			<li><a href="${path}/join.jsp">회원가입</a></li>
			<li><a href="${path}/login.jsp">로그인</a></li>
</c:if>
<c:if test="${sessionScope.userID != null }">
			
			<li><a href="${path}/modify.jsp">회원정보수정</a></li>
			<li><a href="${path}/logoutAction.jsp">로그아웃</a></li>
</c:if>
		</ul>
	</nav>
</header>
</body>
</html>