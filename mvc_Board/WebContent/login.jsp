<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Board</title>

<!-- CSS Style -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/sytle.css">
<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
</head>
<body>

	<div id="wrap">
		<div id="header">
			<div class="container">
				<div class="header">
					<div class="header-menu">
						<a href="main.jsp">JSP 게시판 웹사이트</a> <a href="main.jsp">메뉴</a> 
						<a href="board.jsp">게시판</a>
					</div>
					<!-- //헤더 메뉴 -->
					<div class="header-title">
						<h1>JSP 게시판 만들기</h1>
						<br>
					</div>
					<!-- //헤더 타이틀 -->
				</div>
			</div>
		</div>
		<!-- //header -->

		<div id="contents">
			<div class="container">
				<div class="login">
					<form action="loginAction.jsp" method="post">
						<h3>로그인 화면</h3><br>
						<div class="form-group">
							<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호" maxlength="20">
						</div>
						<br>
						<input type="submit" class="" value="로그인">
					</form>
				</div>
			</div>
		</div>
		<!-- //contents -->

		<div id="footer">
			<div class="container">footer</div>
		</div>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
</body>
</html>