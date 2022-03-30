package bean.CS_board;

import java.sql.Timestamp;

public class RequestContentDTO {

    public int rc_num; //게시글 넘버 0623수정
    public String id; // 요청 아이디
    public String category; // 요청 장르
    public String title; // 요청 글 제목
    public String content; // 글 내용
    public Timestamp reg_date; 
    public int hit; // 글 조회수
    public int comment_state;
    
    public void setRc_num(int rc_num) {
    	this.rc_num = rc_num;
    }
	public void setId(String id) {
		this.id = id;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}
	public void setComment_state(int comment_state) {
		this.comment_state = comment_state;
	}
	
	public int getRc_num() {
		return rc_num;
	}
	
	public String getId() {
		return id;
	}

	public String getCategory() {
		return category;
	}
	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	
	public int getHit() {
		return hit;
	}
	public int getComment_state() {
		return comment_state;
	}
}
