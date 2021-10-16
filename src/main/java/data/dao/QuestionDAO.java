package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.NoticeDTO;
import data.dto.QuestionDTO;
import mysql.db.DBConnect;

public class QuestionDAO {
	
	DBConnect db = new DBConnect();
	
	//insert (데이터 입력)
	public void insertQuestion(QuestionDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into question (subject, content, writer, pass, ref, write_day) values (?, ?, ?, ?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getPass());
			pstmt.setInt(5, dto.getRef());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//ref 최고값 얻기
	public int getMaxRef() {
		QuestionDTO dto = new QuestionDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(ref) from question";
		int ref=0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1);
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return ref;
	}
	
	public int updateParentInfo(String idx) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update question set ref=max(ref)+1";
		int num=0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return num;
	}
	
	//전체 데이터 갯수 (페이징을 위해 데이터 갯수를 알아야함)
	public int getTotalCount() {
		int n = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from question";

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
	
	//QnA 데이터 리스트 반환 (QnA 목록 출력용)
	public List<QuestionDTO> getList(int start, int perpage) {
		List<QuestionDTO> list = new Vector<QuestionDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from question order by ref desc, step asc, idx desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setRef(rs.getInt("ref"));
				dto.setStep(rs.getInt("step"));
				dto.setWriteDay(rs.getTimestamp("write_day"));
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
	public QuestionDTO getData(String idx) {
		QuestionDTO dto = new QuestionDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from question where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setWriteDay(rs.getTimestamp("write_day"));
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//idx에 해당하는 정보 가져오기(부모글의 정보 가져오기)
	public QuestionDTO getSubPass(String idx) {
		QuestionDTO dto = new QuestionDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select subject, pass, ref, step, reforder from question where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSubject(rs.getString("subject"));
				dto.setPass(rs.getString("pass"));
				dto.setRef(rs.getInt("ref"));
				dto.setStep(rs.getInt("step"));
				dto.setReforder(rs.getInt("reforder"));
			}
		} catch (Exception e) {
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//답변 insert
	public void insertAnswer(QuestionDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into question (subject, content, writer, pass, ref, step, reforder, write_day) values (?, ?, ?, ?, ?, ?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getPass());
			pstmt.setInt(5, dto.getRef());
			pstmt.setInt(6, dto.getStep()+1);
			pstmt.setInt(7, dto.getReforder()+1);
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//Q&A update(수정)
	public void updateQuestion(QuestionDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update question set subject=?, pass=?, content=? where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIdx());

			pstmt.execute();
		} catch (Exception e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteQuestion(int ref) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from question where ref=?";

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,ref);
			
			pstmt.execute();
		} catch (Exception e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteAnswer(String idx) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from question where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,idx);
			
			pstmt.execute();
		} catch (Exception e) {
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// idx로 작성자 얻기
	public String getNick(String idx) {
		String nick = "1";

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select writer from question where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				nick = rs.getString("writer");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return nick;
	}
}
