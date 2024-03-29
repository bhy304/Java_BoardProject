package com.bhy.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bhy.util.DBUtil;

/**
 * @author : HayeonBaek
 * @date : 2019. 7. 22.
 * @FileName : userDAO.java
 * @brief : Data Access Object
 * @details : 로그인 기능, 회원가입 기능 추가
 */
public class userDAO {
	
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private static userDAO instance = new userDAO();
	
	private userDAO() {
	}
	
	public static userDAO getInstance() {
		return instance;
	}
	
	// 로그인(아이디,비밀번호 체크)		
	public int login(String userID, String userPassword) {
		int result = 0;
		String dbPassword;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select userPassword from user where userID = ?";
		System.out.println(sql);
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPassword = rs.getString("userPassword");
				if(dbPassword.equals(userPassword)) {
					result = userDAO.MEMBER_LOGIN_SUCCESS; //로그인 성공
					System.out.println("로그인 성공:" + result);
				} else {
					result = userDAO.MEMBER_LOGIN_PW_NO_GOOD; //비밀번호 불일치
					System.out.println("비번 틀림:" + result);
				} 
			} else {
				result = userDAO.MEMBER_LOGIN_IS_NOT; //존재하지 않는 회원
				System.out.println("회원이 아닙니다:" + result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return result; 
	}
	
	// 회원가입
	public int join(userDTO user) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into user(userID, userPassword, userName, userGender, userEmail) values(?, ?, ?, ?, ?)";
		System.out.println(sql);
		conn = DBUtil.MysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
		
			System.out.println("id:" + user.getUserID() +
							   "pw: " + user.getUserPassword() + 
							   "name: " + user.getUserName() + 
							   "gender: " + user.getUserGender() + 
							   "email: " + user.getUserEmail());
			
			pstmt.executeUpdate();
			
			result = userDAO.MEMBER_LOGIN_SUCCESS;
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			System.out.println(e.getMessage());
		} finally {
			DBUtil.MysqlDisConnection(null, pstmt, conn);
		} return result;
	}
	
	// 회원 확인
	public int confirmID(String id) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select userID from user where userID = ?";
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = userDAO.MEMBER_EXISTENT; 
				System.out.println("있는 회원" + result);
			} else {
				result = userDAO.MEMBER_NONEXISTENT;
				System.out.println("없는 회원" + result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			System.out.println(e.getMessage());
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return result;
		
	}
	
	// getUser Info(selectAll)
	public userDTO getUser(String id) {
		
		userDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where userID = ?";
		conn = DBUtil.MysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new userDTO();
				dto.setUserID(rs.getString("userID"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserEmail(rs.getString("userEmail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			System.out.println(e.getMessage());
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return dto;
		
	}
	
	// 회원정보 수정
	public int updateUser(userDTO user) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user set userPassword= ?, userEmail= ?, userName= ?, userGender= ? where userID= ?";
		System.out.println(sql);
		conn = DBUtil.MysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserID());
			System.out.println("id:" + user.getUserID() +
					   ", pw: " + user.getUserPassword() + 
					   ", name: " + user.getUserName() + 
					   ", gender: " + user.getUserGender() + 
					   ", email: " + user.getUserEmail());
			result =  pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(null, pstmt, conn);
		} return -1; // 데이터베이스 오류
	}
}
