package data.dto;

import java.sql.Timestamp;

public class NoticeDTO {
	private String idx;
	private String subject;
	private String content;
	private String writer;
	private int readCount;
	private Timestamp writeDay;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getWriteDay() {
		return writeDay;
	}
	public void setWriteDay(Timestamp writeDay) {
		this.writeDay = writeDay;
	}
}
