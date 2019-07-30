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
/* 로그인 폼 */
#login_container {position: relative;  width: 450px; margin: 150px auto 0; padding: 0;} 
#login_container h1 {text-align: center;}
#login_container .login_form {background-color: #f1f1f1; height: 300px;}
#login_container .login_form  input {width: 100%; padding: 12px 20px; margin: 8px 0; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;}
#login_container .login_form  button {width: 100%; background-color: rgb(34, 8, 107); color: white; padding: 14px 20px;margin: 8px 0; border: none;}

</style>
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">	
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤뉴 메뉴  -->
	<div id="login_container">
	<h1>로그인 화면</h1><br>
        <form class="login_form" action="loginAction.jsp" method="post">
            
            <label for="userID"><b>아이디</b></label>
        	<input type="text" id="userID" name="userID" placeholder="Enter UserID">

            <label for="userPassword"><b>비밀번호</b></label>
            <input type="password" id="userPassword" name="userPassword" placeholder="Enter UserPassword">

            <button type="submit">Login</button>&nbsp;<button type="button" onclick="javascript:window.location='join.jsp'">Join</button>
        </form>
    </div>
</body>
</html>