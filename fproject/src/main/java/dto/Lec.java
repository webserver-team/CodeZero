package dto;

import java.io.Serializable;

public class Lec implements Serializable {
	
	//Getter, Setter 메소드
	public String getLecId() {
		return lecId;
	}

	public void setLecId(String lecId) {
		this.lecId = lecId;
	}

	public String getLecName() {
		return lecName;
	}

	public void setLecName(String lecName) {
		this.lecName = lecName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getLecDescription() {
		return lecDescription;
	}

	public void setLecDescription(String lecDescription) {
		this.lecDescription = lecDescription;
	}

	public String getLecCategory() {
		return lecCategory;
	}

	public void setLecCategory(String lecCategory) {
		this.lecCategory = lecCategory;
	}

	public String getLecLevel() {
		return lecLevel;
	}

	public void setLecLevel(String lecLevel) {
		this.lecLevel = lecLevel;
	}

	public int getLecPrice() {
		return lecPrice;
	}

	public void setLecPrice(int lecPrice) {
		this.lecPrice = lecPrice;
	}

	public int getLecReviewCount() {
		return lecReviewCount;
	}

	public void setLecReviewCount(int lecReviewCount) {
		this.lecReviewCount = lecReviewCount;
	}

	// 멤버 변수 (Property)
	private String lecId;
	private String lecName;
	private String teacherName;
	private String lecDescription;
	private String lecCategory;
	private String lecLevel;
	private int lecPrice;
	private int lecReviewCount;
	
	// 기본 생성자
	public Lec() {
		
	}
	
	
	
}
