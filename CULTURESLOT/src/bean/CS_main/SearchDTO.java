package bean.CS_main;

public class SearchDTO {
	private String title_image;
	private String creator;
	private String year;
	private String category; 
	private String title;
	//0701 지원 수정
	private int content_num;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle_image() {
		return title_image;
	}
	public void setTitle_image(String title_image) {
		this.title_image = title_image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	//0701 지원 수정
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
}
