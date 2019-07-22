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

    <div id="wrap">
        <header id="header" class="clearfix">
	            <h1 class="logo"><a href="main.jsp">JSP 게시판 웹사이트</a></h1>
	            <div class="nav">
		            <a href="main.jsp">메뉴</a> 
					<a href="board.jsp">게시판</a>
					<a href="join.jsp">회원가입</a>
					<a href="login.jsp">로그인</a>
	            </div>
	        
        </header>
        <!-- //header -->

        <section id="contents" class="clearfix">
            <div class="cont">
			<h3>로그인 화면</h3>
            	<form id="login-form" action="loginAction.jsp" method="post">
	            	<div class="login_content">	                 
	                    <div class="lc_text">
	                        <label for="uid" class="ir_su">아이디</label>
	                        <input type="text" id="userID" name="userID" class="input_text" placeholder="아이디" maxlength="20"><br>
	                        <label for="upw" class="ir_su">비밀번호</label>
	                        <input type="password" id="userPassword" name="userPassword" class="input_text" placeholder="비밀번호" maxlength="20">
	                    </div>
	                    <input class="lc_btn" type="submit" value="로그인">
	                </div>
            	</form>
            </div>
        </section>
        <!-- //contents -->

    </div>
    <!-- //wrap -->
</body>
</html>