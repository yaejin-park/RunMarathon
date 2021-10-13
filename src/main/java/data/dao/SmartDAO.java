package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.SmartDTO;
import mysql.db.DBConnect;


public class SmartDAO {
	DBConnect db=new DBConnect();
	//insert
	public void insertSmart(SmartDTO dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into community (subject,content,write_day) values (?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			//è«›ë¶¿ ”¤ï¿½ëµ«
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			//ï¿½ë–ï¿½ë»¾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
	public List<SmartDTO> getList(int start,int perpage)
	{
		List<SmartDTO> list=new Vector<SmartDTO>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from community order by idx desc limit ?,?";
		try {
			pstmt=conn.prepareStatement(sql);
			//è«›ë¶¿ ”¤ï¿½ëµ«
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				SmartDTO dto=new SmartDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setChu_count(rs.getInt("chu_count"));
				dto.setRead_count(rs.getInt("read_count"));
				dto.setWrite_day(rs.getTimestamp("write_day"));
				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	//num —  •´ ‹¹ •˜ Š” dtoë°˜í™˜
	public SmartDTO getData(String idx)
	{
		SmartDTO dto=new SmartDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from community where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//è«›ë¶¿ ”¤ï¿½ëµ«
			pstmt.setString(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setChu_count(rs.getInt("chu_count"));
				dto.setRead_count(rs.getInt("read_count"));
				dto.setWrite_day(rs.getTimestamp("write_day"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	//  „Òú  ê°  ˆ˜
	public int getTotalCount()
	{
		int n=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from community";

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				n=rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs,pstmt, conn);
		}
		return n;
	}

	//ì¡°íšŒ ˆ˜ ××ê 
	public void updateReadcount(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update community set read_count=read_count+1 where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//è«›ë¶¿ ”¤ï¿½ëµ«
			pstmt.setString(1, num);
			//ï¿½ë–ï¿½ë»¾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//ë°©ê¸ˆ ì¶”ê  œ ×âœì¢…  ‹œ   Š¤ numê°  ë¦¬í„´
	public String getMaxNum()
	{
		SmartDTO dto=new SmartDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select max(idx) from community";
		String idx="";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				idx=rs.getString(1);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return idx;
	}
}