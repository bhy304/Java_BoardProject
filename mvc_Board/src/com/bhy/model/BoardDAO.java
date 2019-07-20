package com.bhy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bhy.util.MySQLDBUtil;

/**
 * @author : HayeonBaek
 * @date : 2019. 7. 20.
 * @FileName : BoardDAO.java
 * @brief 
 * @details
 */
public class BoardDAO {

	public List<BoardDTO> SelectAll() {
		
		List<BoardDTO> boardList = new ArrayList<>();
		BoardDTO dto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from mvc_board order by bGroup desc, bStep asc;";
		System.out.println(sql);
		try {
			conn = MySQLDBUtil.MysqlConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Timestamp bDate = rs.getTimestamp("bDate");
				int bHit = rs.getInt("bHit"); 
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				
//				dto = makeBoard(rs);
				dto = new BoardDTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
				boardList.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MySQLDBUtil.MysqlDisConnection(rs, pstmt, conn);
		} return boardList;
		
	}
	
//	public void write(String bName, String bTitle, String bContent) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String sql = "insert into mvc_board() values ";
//		
//		
//	}
	
}
