package com.bhy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author : HayeonBaek
 * @date : 2019. 7. 20.
 * @FileName : MySQLDBUtil.java
 * @brief 
 * @details
 */
public class MySQLDBUtil {

	public static Connection MysqlConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/board?autoReconnect=true&useSSL=false&serverTimezone=UTC";
		String user = "root";
		String password = "1234";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver 연결");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 완료");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
		return conn;
	}

	public static void MysqlDisConnection(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null)
				conn.close();
			if (st != null)
				conn.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
