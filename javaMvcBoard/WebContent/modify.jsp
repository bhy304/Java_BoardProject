<%@page import="com.bhy.model.user.userDTO"%>
<%@page import="com.bhy.model.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
/* 회원수정 */
#modify_container {position: relative; overflow: hidden; width: 600px; margin: 50px auto 0; padding: 0;}
#modify_container h1 {margin: 10px 0; text-align: center;}
#modify_container .modify_form {}
#modify_container .modify_form .btn {border: none; color:#fff; padding: 12px 16px; background-color: #1E90FF; border-radius: 10px; margin: 10px 2px; text-decoration: none;}
#modify_container .modify_form .modify_table {width: 100%;}
#modify_container .modify_form .modify_table tr,th,td {border-color: #fff;} 
#modify_container .modify_form .modify_table .text {font-weight: bold; text-align: left; width: 100px;}
#modify_container .modify_form .modify_table input {width: 100%; padding: 10px 10px; margin: 15px auto; display: inline-block; box-sizing: border-box;}
</style>
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">	
<script type="text/javascript">
function updateInfoConfirm() {
	if(document.reg_frm.pw.value == "") {
		alert("비밀번호를 입력하세요.");
		document.reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.userName.value.length == 0){
		alert("이름은 필수 사항입니다.");
		reg_frm.userName.focus();
		return;
	}
	
	if(document.reg_frm.userEmail.value.length == 0){
		alert("이메일은 필수 사항입니다.");
		reg_frm.userEmail.focus();
		return;
	}
	
	document.reg_frm.submit();
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤뉴 메뉴  -->
<%
	String userID = (String) session.getAttribute("userID");
	userDAO dao = userDAO.getInstance();
	userDTO dto = dao.getUser(userID);
%>
<div id="modify_container">
	<h1>회원정보 수정 화면</h1>
    <form class="modify_form" action="modifyAction.jsp" method="post" name="reg_frm">
    	<table class="modify_table">
    	<tr>
    		<td class="text">아이디</td>
    		<td><%= dto.getUserID() %></td>
    	</tr>
    	<tr>
    		<td class="text">비밀번호</td>
    		<td><input type="text" name="pw" value="<%= dto.getUserPassword() %>"></td>
    	</tr>
    	<tr>
    		<td class="text">비밀번호 확인</td>
    		<td><input type="text" name="pw_check" value="<%= dto.getUserPassword() %>"></td>
    	</tr>
    	<tr>
    		<td class="text">이름</td>
    		<td><input type="text"name="userName" value="<%= dto.getUserName() %>"></td>
    	</tr>
    	<tr>
    		<td class="text">성별</td>
    		<td>
    		<%
    			if(dto.getUserGender() == "남자") {
    		%>
    		<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
    		<input type="radio" name="userGender" autocomplete="off" value="여자">여자
    		<%		
    			} else {
    		%>
    		<input type="radio" name="userGender" autocomplete="off" value="남자">남자
    		<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
    		<%
    			}
    		%>
    		</td>
    	</tr>    	    	
    	<tr>
    		<td class="text">이메일</td>
    		<td><input type="email" name="userEmail" value="<%= dto.getUserEmail() %>"></td>
    	</tr>      	    	
    	</table>
    	<input type="submit" value="수정" class="btn" onclick="updateInfoConfirm();">
    	<input type="reset" value="취소" class="btn" onclick="javascript:window.location='main.jsp'">
    </form>
</div>    
</body>
</html>