package com.bhy.model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bhy.util.DBUtil;

/**
 * @author : HayeonBaek
 * @date : 2019. 7. 26.
 * @FileName : boardDAO.java
 * @brief 
 * @details : 데이터베이스 접근 객체
 */
public class boardDAO {
	
	// 현재의 시간을 가져오는 함수
	public String getDate() {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		conn = DBUtil.MysqlConnection();
		
		String sql = "select now()";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return ""; // 데이터베이스오류
	}
	
	// bbsID 게시글 번호를 가져오는 함수
	public int getNext() {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		
		String sql = "select bbsID from board order by bbsID DESC";
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return -1; // 데이터베이스오류
	}
	
	// 글작성
	public int write(String bbsTitle, String userID, String bbsContent) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql = "insert into board values(?, ?, ?, ?, ?, ?)";
		System.out.println(sql);
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(null, pstmt, conn);
		} return -1; // 데이터베이스오류
	}
	
	// 글목록(특정한 페이지에 따른 총 10개의 게시글을 가져와서 보여주기)
	public ArrayList<boardDTO> getList(int pageNumber){
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		ArrayList<boardDTO> list = new ArrayList<boardDTO>();
		
		String sql = "select * from board where bbsID < ? and bbsAvailable = 1 order by bbsID DESC limit 10";
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)* 10) ;
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				boardDTO board = new boardDTO();
				board.setBbsID(rs.getInt(1));
				board.setBbsTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBbsDate(rs.getString(4));
				board.setBbsContent(rs.getString(5));
				board.setBbsAvailable(rs.getInt(6));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return list;
	}
	
	// 10단위 페이징 처리를 위한 함수
	public boolean nextPage(int pageNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		
		String sql = "select * from board where bbsID < ? and bbsAvailable = 1 order by bbsID DESC limit 10";
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)* 10) ;
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return false;	
	}
	
	// 게시글 보기
	public boardDTO getBoard(int bbsID) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		
		String sql = "select * from board where bbsID = ?";
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID) ;
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				boardDTO board = new boardDTO();
				board.setBbsID(rs.getInt(1));
				board.setBbsTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBbsDate(rs.getString(4));
				board.setBbsContent(rs.getString(5));
				board.setBbsAvailable(rs.getInt(6));
				return board;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return null;	
	}
	
	// 게시글 수정
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql = "update board set bbsTitle = ?, bbsContent = ? where bbsID = ?";
		System.out.println(sql);
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			
			return pstmt.executeUpdate(); // 쿼리문 성공시 0 이상의 값을 반환
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(null, pstmt, conn);
		} return -1; // 데이터베이스오류
	}
	
	// 게시글 삭제
	public int delete(int bbsID) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		String sql = "update board set bbsAvailable = 0 where bbsID = ?";
		System.out.println(sql);
		try {
			conn = DBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bbsID);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.MysqlDisConnection(null, pstmt, conn);
		} return -1; // 데이터베이스오류
	}
}
