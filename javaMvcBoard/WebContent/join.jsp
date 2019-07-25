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
    <div id="join_container">
        <h1>회원가입 화면</h1>
        <br>
        <form class="join_form" action="joinAction.jsp" method="post">
            <label for="userId"><b>아이디</b></label>
            <input type="text" id="userID" name="userID" placeholder="아이디" maxlength="20" required="required">
            
            <label for="userId"><b>비밀번호</b></label>
            <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" maxlength="20" required="required">
            
            <label for="userId"><b>이름</b></label>
            <input type="text" id="userName" name="userName"  placeholder="이름" maxlength="20" required="required">
            
            <label for="userId"><b>성별</b></label>
            <input class="gender" type="radio" id="userGender" name="userGender" autocomplete="off" value="남자" checked>남자
            <input class="gender" type="radio" id="userGender" name="userGender" autocomplete="off" value="여자">여자<br>
            
            <label for="userId"><b>이메일</b></label>
            <input type="email" id="userEmail" name="userEmail"  placeholder="이메일" maxlength="20" required="required">
        
            <button type="submit">Sign up</button>
        </form>
    </div>

</body>
</html>