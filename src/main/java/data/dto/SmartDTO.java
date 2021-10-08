package data.dto;

import java.sql.Timestamp;

public class SmartDTO {
	private String idx;
	private String subject;
	private String content;
	private int chu_count;
	private int read_count;
	private Timestamp write_day;
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
	public int getChu_count() {
		return chu_count;
	}
	public void setChu_count(int chu_count) {
		this.chu_count = chu_count;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public Timestamp getWrite_day() {
		return write_day;
	}
	public void setWrite_day(Timestamp write_day) {
		this.write_day = write_day;
	}
}