package data.dto;

import java.sql.Timestamp;

public class QuestionDTO {
	
	private String idx;
	private String writer;
	private String pass;
	private String subject;
	private String content;
	private int ref;
	private int step;
	private int reforder;
	private Timestamp writeDay;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getReforder() {
		return reforder;
	}
	public void setReforder(int reforder) {
		this.reforder = reforder;
	}
	public Timestamp getWriteDay() {
		return writeDay;
	}
	public void setWriteDay(Timestamp writeDay) {
		this.writeDay = writeDay;
	}
}
