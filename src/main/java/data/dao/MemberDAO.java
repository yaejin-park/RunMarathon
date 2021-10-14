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
		
		String sql = "insert into member(name, nick, hp, id, pass, addr1, addr2, auth1, auth2, opt) values (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getNick());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getId());
			pstmt.setString(5, dto.getPass());
			pstmt.setString(6, dto.getAddr1());
			pstmt.setString(7, dto.getAddr2());
			pstmt.setString(8, dto.getAuth1());
			pstmt.setString(9, dto.getAuth2());
			pstmt.setString(10, dto.getOpt());
			
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
		String name =null;
		
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
	
	//닉네임 검색해서 중복 닉네임 찾기
	public String getNick(String nick) {
		String isNick =null;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select nick from member where nick=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isNick = rs.getString("nick");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isNick;
	}
	
	
	//회원정보 가져오기
	public MemberDTO getAllMember(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;

		MemberDTO dto = new MemberDTO();
		
		String sql = "select * from member where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setHp(rs.getString("hp"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAuth1(rs.getString("auth1"));
				dto.setAuth2(rs.getString("auth2"));
				dto.setOpt(rs.getString("opt"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	/*
	 * //비밀번호 찾기 public MemberDTO findLogin(String name, String hp, String id,
	 * String auth1, String auth2) { MemberDTO dto = new MemberDTO(); }
	 */
	
}
