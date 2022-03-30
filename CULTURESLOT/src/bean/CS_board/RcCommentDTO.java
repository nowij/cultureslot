package bean.CS_board;

public class RcCommentDTO {
	private int comment_num;
	private int rc_num;
	private String category;
	private String rc_writer; // 6월 23일 추가
	private String content;
	
	public void setComment_num(int comment_num) {this.comment_num = comment_num;}
	public void setRc_num(int rc_num) {this.rc_num = rc_num;}
	public void setCategory(String category) {this.category = category;}
	public void setRc_writer(String rc_writer) { this.rc_writer = rc_writer;} // 6월 23일 추가
	public void setContent(String content) {this.content = content;}
	
	public int getComment_num() {return comment_num;}
	public int getRc_num() {return rc_num;}
	public String getCategory() {return category;}
	public String getRc_writer() {return rc_writer;} // 6월 23일 추가
	public String getContent() {return content;}
}
