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
	String sql="insert into community (idx,nickname,subject,content,write_day) values (?,?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			//�뛾�룆�뾼占쎈데�뜝�럥�럠
			pstmt.setString(1, dto.getIdx());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			//�뜝�럥堉꾢뜝�럥六�
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
	public List<SmartDTO> getList1(int start,int perpage)
	{
		List<SmartDTO> list1=new Vector<SmartDTO>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from community order by idx desc limit ?,?";
		try {
			pstmt=conn.prepareStatement(sql);
			//�뛾�룆�뾼占쎈데�뜝�럥�럠
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
				list1.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list1;
	}
	public List<SmartDTO> getList(int start,int perPage,String column,String words)
	{
		List<SmartDTO> list=new Vector<SmartDTO>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		if(words==null || words.equals("")||words.length()==0) //검색어가 없을때
		{
			if(column==null|| column.equals("")||column.length()==0) {//select이 없을때
				sql = "select * from community order by idx desc limit "+start+","+perPage;
			}
			else {
				sql = "select * from community order by idx desc limit "+start+","+perPage;
			}	
		}else { // 검색어가 있을때
			if(column==null|| column.equals("")||column.length()==0) {//select이 없을때
				sql = "select * from community order by idx desc limit "+start+","+perPage;
			}else {
				sql = "select * from community where "+column+" like "+"'%"+words+"%'"+" order by idx desc limit "+start+","+perPage;
			}	
		}
		try {
			pstmt=conn.prepareStatement(sql);
			//�뛾�룆�뾼占쎈데�뜝�럥�럠
			
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
	//num占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 dto獄쏆꼹�넎
	public SmartDTO getData(String idx)
	{
		SmartDTO dto=new SmartDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from community where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//�뛾�룆�뾼占쎈데�뜝�럥�럠
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
	
	//占쎌읈筌ｏ옙 揶쏉옙占쎈땾
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

	//鈺곌퀬�돳占쎈땾 筌앹빓占�
	public void updateReadcount(String idx)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update community set read_count=read_count+1 where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//�뛾�룆�뾼占쎈데�뜝�럥�럠
			pstmt.setString(1, idx);
			//�뜝�럥堉꾢뜝�럥六�
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
	//獄쎻뫕�닊 �빊遺쏙옙占쎈쭆 筌ㅼ뮇伊� 占쎈뻻占쏙옙占쎈뮞 num揶쏉옙 �뵳�뗪쉘
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
	public void deleteCommunity(String idx)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from community where idx=?";
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
	public void updateSmart(SmartDTO dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update community set subject=?,content=? where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			//諛붿씤�뵫
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIdx());
			//�떎�뻾
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
