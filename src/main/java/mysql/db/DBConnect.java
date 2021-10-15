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
		try {
			Class.forName(MYSQLDRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("aws Mysql fail:"+e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(MYSQL_URL, "admin", "asdf7890");
		} catch (SQLException e) {
			System.out.println("Mysql fail :"+e.getMessage());
		}
		return conn;
	}
	
	
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if(rs!= null) rs.close();
			if(stmt!= null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try { 
			if(rs!= null) rs.close();
			if(pstmt!= null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		try {
			if(stmt!= null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			
		}
		
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try { 
			if(pstmt!= null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			
		}
		
	}


}
