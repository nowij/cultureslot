package bean.CS_main;

public class ContentDTO {
	private int content_num;
	private String year;
	private String release_date;
	private String genre;
	private String title;
	private String creator;
	private String title_image;
	private String introduction;
	private String country_category;
	private String country_name;
	private String video;
	private String production;
	private String distribution;
	private String grade;
	private String runtime;
	private String remake;
	private String cast;
	private String staff;
	private String awards;
	private String lyrics;
	private String album_title;
	private String album_type;
	private String series;
	private String trilogy;
	private String soundtrack;
	private String amount;
	private String ref_video;
	private String category;
	//0628 지원 수정
	private int start;
	private int end;
	private String img_path;
	
	public void setStart(int start) { this.start = start;}
	public void setEnd(int end) { this.end = end;}
	public int getStart() { return start;}
	public int getEnd() { return end;}
	
	public void setImg_path(String img_path) { this.img_path = img_path;}
	public String getImg_path() { return img_path;}
	
	public void setContent_num(int content_num) {this.content_num = content_num;}
	public int getContent_num() {return content_num;}
	
	public String getAwards() {
		return awards;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
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
	public String getTitle_image() {
		return title_image;
	}
	
	public void setAwards(String awards) {
		this.awards = awards;
	}
	
	public void setTitle_image(String title_image) {
		this.title_image = title_image;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getCountry_category() {
		return country_category;
	}
	public void setCountry_category(String country_category) {
		this.country_category = country_category;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getProduction() {
		return production;
	}
	public void setProduction(String production) {
		this.production = production;
	}
	public String getDistribution() {
		return distribution;
	}
	public void setDistribution(String distribution) {
		this.distribution = distribution;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getRemake() {
		return remake;
	}
	public void setRemake(String remake) {
		this.remake = remake;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getLyrics() {
		return lyrics;
	}
	public String getAlbum_type() {
		return album_type;
	}
	public void setAlbum_type(String album_type) {
		this.album_type = album_type;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public String getAlbum_title() {
		return album_title;
	}
	public void setAlbum_title(String album_title) {
		this.album_title = album_title;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getTrilogy() {
		return trilogy;
	}
	public void setTrilogy(String trilogy) {
		this.trilogy = trilogy;
	}
	public String getSoundtrack() {
		return soundtrack;
	}
	public void setSoundtrack(String soundtrack) {
		this.soundtrack = soundtrack;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getRef_video() {
		return ref_video;
	}
	public void setRef_video(String ref_video) {
		this.ref_video = ref_video;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
