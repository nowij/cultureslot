package bean.CS_member;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private Timestamp reg_date;
	private String key;
	//0707 지원 수정
	private int start;
	private int end;
	
	
	public void setId(String id) {this.id = id;}
	public void setPw(String pw) {this.pw = pw;}
	public void setName(String name) {this.name = name;}
	public void setBirth(String birth) {this.birth = birth;}
	public void setGender(String gender) {this.gender = gender;}
	public void setEmail(String email) {this.email = email;}
	public void setReg_date(Timestamp reg_date) {this.reg_date = reg_date;}
	public void setKey(String key) {this.key = key;}
	public void setStart(int start) { this.start = start;}
	public void setEnd(int end) { this.end = end;}
	
	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getName() {return name;}
	public String getBirth() {return birth;}
	public String getGender() {return gender;}
	public String getEmail() {return email;}
	public Timestamp getReg_date() {return reg_date;}
	public String getKey() {return key;}
	public int getStart() { return start;}
	public int getEnd() { return end;}
	
}
