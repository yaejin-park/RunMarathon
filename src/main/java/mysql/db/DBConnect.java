package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	static final String MYSQLDRIVER = "com.mysql.jdbc.Driver";

	static final String MYSQL_URL = "jdbc:mysql://db-semi5.cnkpw8i7gzb8.ap-northeast-2.rds.amazonaws.com:3306/semi";

	
	public DBConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(MYSQLDRIVER);
//			System.out.println("성공");
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql 드라이버 실패 :" + e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(MYSQL_URL, "admin", "asdf7890");
		} catch (SQLException e) {
			System.out.println("Mysql 연결 실패 :" + e.getMessage());
		}
		
		return conn;
	} 
	
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			
		}
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		try {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			
		}
	}
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			
		}
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			
		}
	}
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		new DbConnection();
//	}
}
