package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.ApplyDTO;
import mysql.db.DBConnect;

public class ApplyDAO {
	DBConnect db = new DBConnect();
	ApplyDTO dto = new ApplyDTO();
	
	//신청 정보 추가
	public void insertApply(ApplyDTO dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="insert into apply(marathon, name, id, addr, hp, course, time, person) values(?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMarathon());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getCourse());
			pstmt.setString(7, dto.getTime());
			pstmt.setString(8, dto.getPerson());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//신청정보 가져오기
	public ApplyDTO getApply(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ApplyDTO dto = new ApplyDTO();

		String sql = "select * from apply where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				dto.setMarathon(rs.getString("marathon"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setHp(rs.getString("hp"));
				dto.setCourse(rs.getString("course"));
				dto.setTime(rs.getString("time"));
				dto.setPerson(rs.getString("person"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
}
