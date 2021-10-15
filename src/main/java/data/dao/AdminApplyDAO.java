package data.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.AdminApplyDTO;
import mysql.db.DBConnect;

public class AdminApplyDAO {
	DBConnect db = new DBConnect();
	
	// 전체 회원 출력
	public ArrayList<AdminApplyDTO> getAllMembers() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member order by idx desc";
		
		ArrayList<AdminApplyDTO> list = new ArrayList<AdminApplyDTO>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdminApplyDTO dto = new AdminApplyDTO();
				
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setNick(rs.getString("nick"));
				dto.setHp(rs.getString("hp"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setAddr(rs.getString("addr"));
				dto.setAuth2(rs.getString("auth2"));
				
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
	
	
	
	/*
	 * // 해당 회원이 참가했던 대회 목록 반환 public List<AdminApplyDTO> getContest(String name) {
	 * List<AdminApplyDTO> alist = new Vector<AdminApplyDTO>();
	 * 
	 * Connection conn = db.getConnection(); PreparedStatement pstmt = null;
	 * ResultSet rs = null;
	 * 
	 * String sql = "select marathon from participation where name=?";
	 * 
	 * try {
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, name);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { AdminApplyDTO dto = new AdminApplyDTO();
	 * 
	 * dto.setMarathon(rs.getString("marathon"));
	 * dto.setCourse(rs.getString("course"));
	 * dto.setContestDate(rs.getTimestamp("contestDate"));
	 * 
	 * alist.add(dto); } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } finally { db.dbClose(pstmt, conn); }
	 * 
	 * return alist; }
	 */
		
		// 해당 회원이름에 대한 참가대회목록 반환
		public String getMarathon(String name) {
			String marathon = "";

			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select marathon from participation where name=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				rs=pstmt.executeQuery();

				if(rs.next()) // 해당 회원에 대한 참가대회목록 반환
					marathon = rs.getString("marathon");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}

			return name;
		}
	
		// 회원별 완주 기록 insert
		public void insertRecord(AdminApplyDTO dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "insert into participation (name,marathon,course,contest_date,record) values (?,?,?,?,?)";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getMarathon());
				pstmt.setString(3, dto.getCourse());
				pstmt.setTimestamp(4, dto.getContestDate());
				pstmt.setString(5, dto.getRecord());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
				
			}
		}
}
