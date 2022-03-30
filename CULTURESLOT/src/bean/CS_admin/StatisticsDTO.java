package bean.CS_admin;

public class StatisticsDTO {
	
	private int age10; // 10대 이하 회원 수
	private int age20; // 20대 회원 수
	private int age30; // 30대 회원 수
	private int age40; // 40대 회원 수
	private int age50; // 50대 회원 수
	private int age60; // 60대 이상 회원 수
	private int ageNone;
	
	public void setAge10(int age10) {
		this.age10 = age10;
	}
	public void setAge20(int age20) {
		this.age20 = age20;	
	}
	public void setAge30(int age30) {
		this.age30 = age30;
	}
	public void setAge40(int age40) {
		this.age40 = age40;
	}
	public void setAge50(int age50) {
		this.age50 = age50;
	}
	public void setAge60(int age60) {
		this.age60 = age60;
	}
	public void setAgeNone(int ageNone) {
		this.ageNone = ageNone;
	}
	
	public int getAge10() {
		return age10;
	}
	public int getAge20() {
		return age20;
	}
	public int getAge30() {
		return age30;
	}
	public int getAge40() {
		return age40;
	}
	public int getAge50() {
		return age50;
	}
	public int getAge60() {
		return age60;
	}
	public int getAgeNone() {
		return ageNone;
	}
/////////////////////////////////////////
	
	private int maleCount;
	private int femaleCount;
	
	public void setMaleCount(int maleCount) {
		this.maleCount = maleCount;
	}
	public void setFemaleCount(int femaleCount) {
		this.femaleCount = femaleCount;
	}
	
	public int getMaleCount() {
		return maleCount;
	}
	public int getFemaleCount() {
		return femaleCount;
	}
/////////0701 add //////////////////////
	
	private String title;
	private int title_count;
	
	public void setTitle(String title) {
		this.title = title;
	}
	public void setTitle_count(int title_count) {
		this.title_count = title_count;
	}
	
	public String getTitle() {
		return title;	
	}
	public int getTitle_count() {
		return title_count;	
	}

	private int ageGroup;
	private String gender;
	private String year;
	private String category;
	private double percent;
	
	public void setAgeGroup(int ageGroup) {
		this.ageGroup = ageGroup;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	
	public int getAgeGroup() {
		return ageGroup;
	}
	public String getGender(){
		return gender;
	}
	public String getYear() {
		return year;
	}
	public String getCategory() {
		return category;
	}
	public double getPercent() {
		return percent;
	}
}
