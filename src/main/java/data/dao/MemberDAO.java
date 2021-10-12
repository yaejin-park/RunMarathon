package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MemberDTO;
import mysql.db.DBConnect;

public class MemberDAO {
	DBConnect db = new DBConnect();
	MemberDTO dto = new MemberDTO();
	
	//회원가입
	public void insertMember(MemberDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into member(name, nick, hp, id, pass, addr, auth1, auth2, opt) values (?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getNick());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getId());
			pstmt.setString(5, dto.getPass());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getAuth1());
			pstmt.setString(8, dto.getAuth2());
			pstmt.setString(9, dto.getOpt());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
	
	//로그인 확인
	public boolean isMember(String id, String pass) {
		boolean flag = false;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id=? and pass=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	//아이디 중복체크(중복이면 true)
	public boolean isIdCheck(String id) {
		boolean isId = false;
		
		Connection conn =  db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isId = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isId;
	}
	
	//아이디로 이름 얻기
	public String getName(String id) {
		String name ="";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select name from member where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return name;
	}
}
