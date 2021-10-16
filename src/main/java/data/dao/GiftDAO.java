package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.GiftDTO;
import mysql.db.DBConnect;

public class GiftDAO {
	DBConnect db = new DBConnect();
	
	public void insertGift(GiftDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into gift (name, content, contest_name, photo) values (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getContest_name());
			pstmt.setString(4, dto.getPhoto());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateGift(GiftDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update ignore gift set name=?, content=?, contest_name=?, photo=? where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getContest_name());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<GiftDTO> getGiftList(String name) {
		List<GiftDTO> list = new ArrayList<GiftDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from gift where contest_name=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GiftDTO dto = new GiftDTO();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setContest_name(rs.getString("contest_name"));
				dto.setPhoto(rs.getString("photo"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public List<GiftDTO> getGift(String name) {
		List<GiftDTO> list = new ArrayList<GiftDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from gift where contest_name=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GiftDTO dto = new GiftDTO();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setContest_name(rs.getString("contest_name"));
				dto.setPhoto(rs.getString("photo"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
}
