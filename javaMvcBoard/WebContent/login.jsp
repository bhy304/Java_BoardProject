<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="login_container">
	<h1>로그인 화면</h1><br>
        <form class="login_form" action="loginAction.jsp" method="POST">
            
                <label for="userId"><b>아이디</b></label>
                <input type="text" id="userID" name="userID" placeholder="Enter UserID">

                <label for="userPassword"><b>비밀번호</b></label>
                <input type="password" id="userPassword" name="userPassword" placeholder="Enter UserPassword">

                <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>