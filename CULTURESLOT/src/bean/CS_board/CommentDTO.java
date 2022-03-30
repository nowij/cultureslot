package bean.CS_board;

public class CommentDTO {
	private int comment_num;
	private String id;
	private String category;
	private String title;
	private String content;
	private int content_num;
	private String year;
	private int start;
	private int end;
	
	public void setStart(int start) { this.start = start; }
	public void setEnd(int end) { this.end = end;}
	public void setComment_num(int comment_num) {this.comment_num = comment_num;}
	public void setId(String id) {this.id = id;}
	public void setCategory(String category) {this.category = category;}
	public void setTitle(String title) {this.title = title;}
	public void setContent(String content) {this.content = content;}
	public void setContent_num(int content_num) {this.content_num = content_num;}
	public void setYear(String year) {this.year = year;}
	
	public int getStart() { return start;}
	public int getEnd() { return end; }
	public int getComment_num() {return comment_num;}
	public String getId() {return id;}
	public String getCategory() {return category;}
	public String getTitle() {return title;}
	public String getContent() {return content;}
	public int getContent_num() {return content_num;}
	public String getYear() {return year;}
	
}
