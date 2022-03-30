package bean.CS_board;

import java.sql.Timestamp;

public class NoticeDTO {

	private int n_num; 					
	private String n_subject;		
	private String n_content;			
	private String n_writer;	
	private Timestamp n_reg;			
	
	public void setN_num(int n_num) {
		this.n_num = n_num;	
	}
	
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;	
	}
	
	public void setN_content(String n_content) {
		this.n_content = n_content;	
	}
	
	public void setN_writer(String n_writer) {
		n_writer =  "CULTURES'LOT";
		this.n_writer = n_writer;
	}
	
	public void setN_reg(Timestamp n_reg) {
		this.n_reg = n_reg;	
	}
	
	public int getN_num() {
		return n_num;
	}
	
	public String getN_subject() {
		return n_subject;
	}
	
	public String getN_content() {
		return n_content;
	}
	
	public String getN_writer() {
		return n_writer;
	}
	
	public Timestamp getN_reg() {
		return n_reg;
	}
	
	
}
