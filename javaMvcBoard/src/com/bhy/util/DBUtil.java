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
public class DBUtil {

	public static Connection MysqlConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/board?autoReconnect=true&useSSL=false&serverTimezone=UTC";
		String user = "root", password = "1234";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver 연결");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 완료");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e2) {
			e2.printStackTrace();
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
			e.printStackTrace();
		} 
	}
}
