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
		
		String sql="insert into apply(marathon, name, id, addr1, addr2, hp, course, time, person) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMarathon());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getAddr1());
			pstmt.setString(5, dto.getAddr2());
			pstmt.setString(6, dto.getHp());
			pstmt.setString(7, dto.getCourse());
			pstmt.setString(8, dto.getTime());
			pstmt.setString(9, dto.getPerson());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//신청 정보 수정
	public void modifyApply(String name, String hp, String addr1, String addr2, String course, String time, String person, String id){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="update apply set name=?, addr1=?, addr2=?, hp=?, course=?, time=?, person=? where id=? and marathon='Run 2021 시즌3'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, addr1);
			pstmt.setString(3, addr2);
			pstmt.setString(4, hp);
			pstmt.setString(5, course);
			pstmt.setString(6, time);
			pstmt.setString(7, person);
			pstmt.setString(8, id);
			
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

		String sql = "select * from apply where id=? and marathon='Run 2021 시즌3'";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setMarathon(rs.getString("marathon"));
				dto.setName(rs.getString("name"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setHp(rs.getString("hp"));
				dto.setCourse(rs.getString("course"));
				dto.setTime(rs.getString("time"));
				dto.setPerson(rs.getString("person"));
				dto.setRecord(rs.getString("record"));
				dto.setDelivery(rs.getString("delivery"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//신청여부 가져오기
	public boolean isDoubleApply(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from apply where id=? and marathon='Run 2021 시즌3'";
		
		boolean flag = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag =true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	//회원 상태 얻기
	public String applyStatus(String id) {
		String status = "no";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select record,delivery from apply where id=? and marathon='Run 2021 시즌3'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				status = "apply";
				if(rs.getString("delivery")!=null) {
					status="delivery";
					if(rs.getString("record")!=null) {
						status="record";
					}
				} 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return status;
	}
}
