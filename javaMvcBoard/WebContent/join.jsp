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
/* 회원가입 */
#join_container {position: relative;  overflow: hidden; width: 450px; height: 800px; margin: 150px auto 0; padding: 0;}
#join_container h1 {margin: 10px 0; text-align: center;}
#join_container .join_form {background: #f8f8f8;}
#join_container .join_form input {width: 100%; padding: 10px 20px; margin: 10px auto; display: inline-block; border: 1px solid #ccc; box-sizing: border-box;}
#join_container .join_form button {width: 100%; background-color: rgb(34, 8, 107); color: white; padding: 14px 20px; margin: 8px 0; border: none;}
</style>
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">	
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤뉴 메뉴  -->
    <div id="join_container">
        <h1>회원가입 화면</h1>
        <form class="join_form" action="joinAction.jsp" method="post">
            <label for="userID"><b>아이디</b></label>
            <input type="text" id="userID" name="userID" placeholder="아이디" maxlength="20" required="required">
            
            <label for="userPassword"><b>비밀번호</b></label>
            <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" maxlength="20" required="required">
            
            <label for="userName"><b>이름</b></label>
            <input type="text" id="userName" name="userName"  placeholder="이름" maxlength="20" required="required">
            
            <label for="userGender"><b>성별</b></label>
            <input class="gender" type="radio" id="userGender" name="userGender" autocomplete="off" value="남자" checked>남자
            <input class="gender" type="radio" id="userGender" name="userGender" autocomplete="off" value="여자">여자<br>
            
            <label for="userEmail"><b>이메일</b></label>
            <input type="email" id="userEmail" name="userEmail"  placeholder="이메일" maxlength="20" required="required">
        
            <button type="submit">Sign up</button>
        </form>
    </div>

</body>
</html>