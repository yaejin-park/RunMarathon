package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.ReviewDTO;
import data.dto.SmartDTO;
import mysql.db.DBConnect;

public class ReviewDAO {
	DBConnect db=new DBConnect();
	public void insertReview(ReviewDTO dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into review (nickname,subject,photo,content,write_day) values (?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//諛붿씤�뵫
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setString(4, dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public List<ReviewDTO> getAllList()
	   {
	      List<ReviewDTO> list=new Vector<ReviewDTO>();
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="select * from review";
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         while(rs.next())
	         {
	            ReviewDTO dto=new ReviewDTO();
	            dto.setIdx(rs.getString("idx"));
	            dto.setSubject(rs.getString("subject"));
	            dto.setNickname(rs.getString("nickname"));
	            dto.setPhoto(rs.getString("photo"));
	            dto.setContent(rs.getString("content"));
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
	public int getTotalCount()
	{
		int n=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from review";

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
	public List<ReviewDTO> getList(int start,int perpage)
	{
		List<ReviewDTO> list=new Vector<ReviewDTO>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from review order by idx desc limit ?,?";
		try {
			pstmt=conn.prepareStatement(sql);
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				ReviewDTO dto=new ReviewDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
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
	public ReviewDTO getData(String idx)
	{
		ReviewDTO dto=new ReviewDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from review where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//獄쏅뗄�뵥占쎈뎃
			pstmt.setString(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) 
			{
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
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
	public void updateReview(ReviewDTO dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update review set subject=?,photo=?,content=? where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//諛붿씤�뵫
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIdx());
			//�떎�뻾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public void deleteReview(String idx)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from review where idx=?";
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
}
