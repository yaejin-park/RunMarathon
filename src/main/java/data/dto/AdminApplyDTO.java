package data.dto;

import java.sql.Timestamp;

public class AdminApplyDTO {
	private String idx;
	private String name;
	private String nick;
	private String hp;
	private String id;
	private String pass;
	private String addr;
	private String auth2;
	
	private String marathon;
	private String course;
	private Timestamp contestDate;
	private String record;
	
	
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAuth2() {
		return auth2;
	}
	public void setAuth2(String auth2) {
		this.auth2 = auth2;
	}
	
	public String getMarathon() {
		return marathon;
	}
	public void setMarathon(String marathon) {
		this.marathon = marathon;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public Timestamp getContestDate() {
		return contestDate;
	}
	public void setContestDate(Timestamp contestDate) {
		this.contestDate = contestDate;
	}
}
