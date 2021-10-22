package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.MenuDTO;
import mysql.db.DBConnect;

public class MenuDAO {
	DBConnect db = new DBConnect();
		
	// ÀüÃ¼ oneµª½º ¸Þ´º
	public List<MenuDTO> getAllOneDepth() {
		List<MenuDTO> list = new ArrayList<MenuDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from menu_db where parent_idx is null";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuDTO dto = new MenuDTO();
				dto.setMenu_idx(rs.getString("menu_idx"));
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_depth(rs.getString("menu_depth"));
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
	
	public String getOneDepth(String num) {
		String name = "";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select menu_name from menu_db where menu_idx=? && menu_depth=1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("menu_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	} 
	
	public String getTwoDepth(String num) {
		String name = "";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select menu_name from menu_db where menu_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("menu_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	} 
	
	// twoµª½º ¸Þ´º
	public List<MenuDTO> getTwoDepthList(String num) {
		List<MenuDTO> list = new ArrayList<MenuDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from menu_db where parent_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuDTO dto = new MenuDTO();
				dto.setMenu_idx(rs.getString("menu_idx"));
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_url(rs.getString("menu_url"));
				dto.setMenu_depth(rs.getString("menu_depth"));
				dto.setParent_idx(rs.getString("parent_idx"));
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
