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
	String sql="insert into community (num,nickname,subject,content,write_day) values (?,?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setString(1, dto.getIdx());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			//占쎈뼄占쎈뻬
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
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				SmartDTO dto=new SmartDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setNickname(rs.getString("nickname"));
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
	//num�뿉 �빐�떦�븯�뒗 dto諛섑솚
	public SmartDTO getData(String idx)
	{
		SmartDTO dto=new SmartDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from community where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setString(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) 
			{
				dto.setIdx(rs.getString("idx"));
				dto.setNickname(rs.getString("nickname"));
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
	public SmartDTO getSearchData(String search)
	{
		SmartDTO dto=new SmartDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from community where subject like '%?%'";
		try {
			pstmt=conn.prepareStatement(sql);
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setString(1, search);
			rs=pstmt.executeQuery();
			if(rs.next()) 
			{
				dto.setIdx(rs.getString("idx"));
				dto.setNickname(rs.getString("nickname"));
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
	//�쟾泥� 媛��닔
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

	//議고쉶�닔 利앷�
	public void updateReadcount(String idx)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update community set read_count=read_count+1 where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setString(1, idx);
			//占쎈뼄占쎈뻬
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public void updateChu(String idx)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update community set chu_count=chu_count+1 where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//諛붿씤�뵫
			pstmt.setString(1, idx);
			//�떎�뻾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//諛⑷툑 異붽��맂 理쒖쥌 �떆���뒪 num媛� 由ы꽩
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
