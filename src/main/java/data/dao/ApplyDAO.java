package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.ApplyDTO;
import mysql.db.DBConnect;

public class ApplyDAO {
	DBConnect db = new DBConnect();
	ApplyDTO dto = new ApplyDTO();
	
	//신청 정보 추가
	public void insertApply(){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="insert into apply(marathon, name, addr, hp, course, time, person) values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMarathon());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getCourse());
			pstmt.setString(6, dto.getTime());
			pstmt.setString(7, dto.getPerson());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}
