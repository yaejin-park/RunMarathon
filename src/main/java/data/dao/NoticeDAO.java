package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.NoticeDTO;
import mysql.db.DBConnect;

public class NoticeDAO {
	
	DBConnect db = new DBConnect();
	
	//insert (데이터 입력)
	public void insertNotice(NoticeDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into notice (subject,content, writer, write_day) values (?, ?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체 데이터 갯수 (페이징을 위해 데이터 갯수를 알아야함)
	public int getTotalCount() {
		int n = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from notice";

		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	}
	
	//공지사항 데이터 리스트 반환 (공지사항 목록 출력용)
	public List<NoticeDTO> getList(int start, int perpage) {
		List<NoticeDTO> list = new Vector<NoticeDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from notice order by idx desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setWriteDay(rs.getTimestamp("write_day"));
				dto.setReadCount(rs.getInt("read_count"));
				//list에 추가
				list.add(dto);
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//idx에 해당하는 dto반환 (게시판 목록을 클릭했을 때 번호에 해당하는 내용을 보여주기위함)
	public NoticeDTO getData(String idx) {
		NoticeDTO dto = new NoticeDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from notice where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadCount(rs.getInt("read_count"));
				dto.setWriteDay(rs.getTimestamp("write_day"));
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//제일 최근 데이터의 idx값 받아오기
	public String getMaxIdx() {
		NoticeDTO dto = new NoticeDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(idx) from notice";
		String idx="";
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = rs.getString(1);
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return idx;
	}
	
	//조회 수 증가
	public void updateReadCount(String idx) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update notice set read_count = read_count+1 where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, idx);

			pstmt.execute();
		} catch (Exception e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//공지사항 delete(삭제)
	public void deleteNotice(String idx) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from notice where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,idx);

			pstmt.execute();
		} catch (Exception e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//공지사항 update(수정)
	public void updateNotice(NoticeDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update notice set subject=?, content=? where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIdx());

			pstmt.execute();
		} catch (Exception e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//이전글, 다음글 출력. idx를 받아와서 idx에 대한 이전 데이터, 다음 데이터 뽑아옴
	public List<NoticeDTO> getSubject(String idx) {
		List<NoticeDTO> list = new Vector<NoticeDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT idx, subject FROM notice WHERE idx = ? "
				+ "UNION ALL (SELECT idx, subject FROM notice WHERE idx < ? ORDER BY idx DESC LIMIT 1) "
				+ "UNION ALL (SELECT idx, subject FROM notice WHERE idx > ? ORDER BY idx ASC LIMIT 1) "
				+ "ORDER BY idx DESC";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, idx);
			pstmt.setString(2, idx);
			pstmt.setString(3, idx);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				//list에 추가
				list.add(dto);
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
}
