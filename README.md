# Overview
게시판 만들기
***
### 1. 회원 관리
1. 로그인
2. 로그아웃
3. 회원가입
4. ~~회원정보 수정~~ - 코드수정중

### 2. 게시판 
1. 메인페이지
2. 전체 리스트 보기
3. 글쓰기
4. 글수정
5. 글삭제
6. 글보기

### 3. DB 
###### DBMS : MySQL
1. 회원관리
```bash
-- 회원 테이블 생성
create table user (
  userID varchar(20),
  userPassword varchar(20),
  userName varchar(20),
  userGender varchar(50),
  userEmail varchar(50),
  primary key(userID) 
) default character set utf8mb4 collate utf8mb4_general_ci;
```
2. 게시판
```bash
-- 게시판 테이블 생성
create table board (
  bbsID INT, -- 글번호
  bbsTitle VARCHAR(100), -- 글제목
  userID varchar(20), -- 작성자
  bbsDate datetime, -- 작성일
  bbsContent text, -- 글내용
  bbsAvailable INT, -- 글삭제 목적
  PRIMARY KEY(bbsID)
) default character set utf8mb4 collate utf8mb4_general_ci;
```
