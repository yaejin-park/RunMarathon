package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ContestDTO;
import mysql.db.DBConnect;

public class ContestDAO {
	DBConnect db = new DBConnect();
	
	public List<ContestDTO> getAllList() {
		List<ContestDTO> list = new ArrayList<ContestDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contest order by contest_start desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ContestDTO dto = new ContestDTO();
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setContest_start(rs.getString("contest_start"));
				dto.setContest_end(rs.getString("contest_end"));
				dto.setApply_start(rs.getString("apply_start"));
				dto.setApply_end(rs.getString("apply_end"));
				dto.setGift_check(rs.getString("gift_check"));
				dto.setGift_start(rs.getString("gift_start"));
				dto.setGift_end(rs.getString("gift_end"));
				dto.setMoney(rs.getString("money"));
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
	
	public void insertContest(ContestDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into contest (name, content, contest_start, contest_end, apply_start, apply_end, gift_check, gift_start, gift_end, money) values (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getContest_start());
			pstmt.setString(4, dto.getContest_end());
			pstmt.setString(5, dto.getApply_start());
			pstmt.setString(6, dto.getApply_end());
			pstmt.setString(7, dto.getGift_check());
			pstmt.setString(8, dto.getGift_start());
			pstmt.setString(9, dto.getGift_end());
			pstmt.setString(10, dto.getMoney());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public ContestDTO getList(String name) {
		ContestDTO dto = new ContestDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contest where name=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setContest_start(rs.getString("contest_start"));
				dto.setContest_end(rs.getString("contest_end"));
				dto.setApply_start(rs.getString("apply_start"));
				dto.setApply_end(rs.getString("apply_end"));
				dto.setGift_check(rs.getString("gift_check"));
				dto.setGift_start(rs.getString("gift_start"));
				dto.setGift_end(rs.getString("gift_end"));
				dto.setMoney(rs.getString("money"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public void updateContest(ContestDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update ignore contest set name=? , content=?, contest_start=?, contest_end=?, apply_start=?, apply_end=?, gift_check=?, gift_start=?, gift_end=?, money=? where name=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getContest_start());
			pstmt.setString(4, dto.getContest_end());
			pstmt.setString(5, dto.getApply_start());
			pstmt.setString(6, dto.getApply_end());
			pstmt.setString(7, dto.getGift_check());
			pstmt.setString(8, dto.getGift_start());
			pstmt.setString(9, dto.getGift_end());
			pstmt.setString(10, dto.getMoney());
			pstmt.setString(11, dto.getBefore_name());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteContest(String name) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from contest where name=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
